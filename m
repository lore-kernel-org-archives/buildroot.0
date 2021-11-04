Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EC6C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCCC61186
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BCCC61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80A160B9A;
	Thu,  4 Nov 2021 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMefNHZOtBTn; Thu,  4 Nov 2021 20:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EACC60B97;
	Thu,  4 Nov 2021 20:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72FA31BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6249A60B97
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dy90Fruo1gB2 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:33:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0B0D60B96
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636057990;
 bh=Ge6g44A8yj5Dkhan4v85Tl6ug3uCEi5h3EChpVHqEe8=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=HYcFy5dfleaVuRIQZytUIrCeWy4WL5lwkDoceqPyeRJe3vLig02SRKRbwhA5KTJZS
 Y4WEDQRV6vhJenlghPgxNeC+xMbKHjzACzg+imu8xFQxF+9M4GGd8lqOyYD6I8TH83
 Q1SE6Ae/1cHFfmXamVTH0zt1Eez3gi3RMlNI+et0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1n4g9m2nEu-00M205
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 21:33:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 21:33:10 +0100
Message-Id: <20211104203310.5829-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:7fTfXeayJwqVRwbXAlBMFnvWxrG+HkoPaXQlrJcO47LtdiowL1a
 rzPzeQMB2YjKhHU8I4RUlCQ/mk1eB9G+TXlJz77PxTVpd4PA41kPIAToCBr/7/e5h6TBYwc
 1HdheLg00qSKJMyQM0GX+6xuspB5ZsqByY8QWKmxRTI3jno+diNCCS1GJiOjiQgOpaoKqOR
 8//me9OQJ/qatyIAJVxNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EIMveTigLHg=:WgzzY4YW4r/AqkB1raXwhU
 KBb1cpK3mVu5GO6kIsdW4D8Z1ooH1Tnt/ovV51N9+o7A1gFcasONv3ZZ/2mnsIZVOatafTVI1
 8e5Gqx0JDsIaH9AXChVzmekPvpua7frA0YeGLC262XQhb27m3DptQQCxPiq0LpUX0syGS/HNC
 a/Xijxdkl3lKvKCyKdsc05JFkzX6HGxJ2Ek5n4mgsVx8rUokyRSXKFVb5/Op8wZYMsRz5EGUT
 CyG2SP52+xMwDBZNQ5N1vqgWcY8qZX2Tkng3b8afO/0jGjkC3cOpTI8y6T5VkE3HjRWWEkafW
 HoQwot7GfFy0oou/bz0RVKfjKui8J+e3KRCP/vCCNOz9N+Q3B8U4lRmTMuYZ7pA1RaHXedTe+
 YDEu/yAec7/NLkJdrC57eyl/n4Z/3WigEw5iALoHjdba7ZZIvycqun7RcnjeGBuSeurzp0lP7
 nTmBSThkRnvvKjW1jlmEu9NbGoGURyBfSbtuideT82TtpeDEaceB2emoKi+Ufvd175+WugzDN
 44pw/ojksrXpsZ23AYYb/8JQE25jAXq1nJL+I/cFCVLIfk6as3+itz0sQYCeIaPk1fcJ7Ww52
 5F67YyJ2S5OYr5th3ziVOXpo5D3BF5/ynyU0U2obZvuvnbfDMWowWaBJ2R3CHvGSIZQlAUMwx
 hzuZCeFw251XeQJT3915xoZijLr7CZwE9mOnnW21AyBRS/ECxBQ1eP9bRqzUlqWTzU//TQj3O
 p8u94RaXSACLKHLaIcsf+2ClwzIXThArake4wkpekC+QT+RU3Rcj5hSg+FdRKcW/7lTWr6qZa
 j3fBHtbNGK0GfZnNKuCYxt2zN9G/B7tWM+qLYd4L03iIBHIyoBjqDn2H+Z0ckjX4sYUQ+hU9b
 Z2QJW9AzmaWwZVMiNdyFTrO/h9rRUg52JR2fT7UPdLSCpDBm6VA4GncUEzdqySofnIeWn2C6L
 ciZ6//SCxsD9gqRSdMgDWtGih5Cck913WdkAmdPYfQfJi6dX68N+e0VCSlARga3Mx0vH4pG+u
 dyZaI0bZNVjXkBVl13gPnAhNMPrLJAaeniMJr8NQpD9foICq/j0shgjw9pUvzHZp5IjHL/hJe
 j/CHyFCD5qpCxc=
Subject: [Buildroot] [PATCH v1] package/gdb: fix host gdb-11.1 compile with
 simulator enabled and glibc >= 2.34
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add upstream patch to avoid host gdb-11.1 compile failure with simulator
  enabled and glibc >= 2.34

Fixes:

  targ-map.c:412:17: error: initializer element is not constant
    412 |   { "SIGSTKSZ", SIGSTKSZ, TARGET_SIGSTKSZ },
        |                 ^~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...sim-filter-out-SIGSTKSZ-PR-sim-28302.patch | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch

diff --git a/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch b/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
new file mode 100644
index 0000000000..d969d98831
--- /dev/null
+++ b/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
@@ -0,0 +1,110 @@
+From 7b3df9b8938357c2b0dcf2624e599a76fc4edc02 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sun, 3 Oct 2021 12:02:53 -0400
+Subject: [PATCH] sim: filter out SIGSTKSZ [PR sim/28302]
+
+We map target signals to host signals so we can propagate signals
+between the host & simulated worlds.  That means we need to know
+the symbolic names & values of all signals that might be sent.
+
+The tools that generate that list use signal.h and include all
+symbols that start with "SIG" so as to automatically include any
+new symbols that the C library might add.  Unfortunately, this
+also picks up "SIGSTKSZ" which is not actually a signal itself,
+but a signal related setting -- it's the size of the stack when
+a signal is handled.
+
+By itself this doesn't super matter as we will never see a signal
+with that same value (since the range of valid signals tend to be
+way less than 1024, and the size of the default signal stack will
+never be that small).  But with recent glibc changes that make this
+into a dynamic value instead of a compile-time constant, some users
+see build failures when building the sim.
+
+As suggested by Adam Sampson, update our scripts to ignore this
+symbol to simplify everything and avoid the build failure.
+
+Bug: https://sourceware.org/PR28302
+
+[Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=39d53d04357606a15efd400147fa7369d71baf2c]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ sim/bfin/linux-targ-map.h | 5 +----
+ sim/common/gennltvals.py  | 6 ++++--
+ sim/common/nltvals.def    | 1 -
+ 3 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/sim/bfin/linux-targ-map.h b/sim/bfin/linux-targ-map.h
+index e9c8c8f..0340ed5 100644
+--- a/sim/bfin/linux-targ-map.h
++++ b/sim/bfin/linux-targ-map.h
+@@ -30,6 +30,7 @@ echo
+ # XXX: nothing uses this ?
+ echo '#include <signal.h>' | \
+ bfin-uclinux-gcc -E -dD -P - | \
++grep -v SIGSTKSZ | \
+ sed -r -n \
+     -e '1istatic CB_TARGET_DEFS_MAP cb_linux_signal_map[] = {' \
+     -e '$i\ \ { 0, -1, -1 }\n};' \
+@@ -1987,10 +1988,6 @@ static CB_TARGET_DEFS_MAP cb_linux_signal_map[] =
+ #ifdef SIG_SETMASK
+ # define TARGET_LINUX_SIG_SETMASK 2
+   { "SIG_SETMASK", SIG_SETMASK, TARGET_LINUX_SIG_SETMASK },
+-#endif
+-#ifdef SIGSTKSZ
+-# define TARGET_LINUX_SIGSTKSZ 8192
+-  { "SIGSTKSZ", SIGSTKSZ, TARGET_LINUX_SIGSTKSZ },
+ #endif
+   { 0, -1, -1 }
+ };
+diff --git a/sim/common/gennltvals.py b/sim/common/gennltvals.py
+index b3e558d..bd4d7e9 100755
+--- a/sim/common/gennltvals.py
++++ b/sim/common/gennltvals.py
+@@ -67,6 +67,7 @@ FILE_HEADER = f"""\
+ def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
+              headers: Iterable[str],
+              pattern: str,
++             filter: str = r'^$',
+              target: str = None):
+     """Extract constants from the specified files using a regular expression.
+ 
+@@ -94,12 +95,13 @@ def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
+     srcfile = ''.join(f'#include <{x}>\n' for x in headers)
+     syms = set()
+     define_pattern = re.compile(r'^#\s*define\s+(' + pattern + ')')
++    filter_pattern = re.compile(filter)
+     for header in headers:
+         with open(srcdir / header, 'r', encoding='utf-8') as fp:
+             data = fp.read()
+         for line in data.splitlines():
+             m = define_pattern.match(line)
+-            if m:
++            if m and not filter_pattern.search(line):
+                 syms.add(m.group(1))
+     for sym in sorted(syms):
+         srcfile += f'#ifdef {sym}\nDEFVAL {{ "{sym}", {sym} }},\n#endif\n'
+@@ -129,7 +131,7 @@ def gen_common(output: TextIO, newlib: Path, cpp: str):
+              ('errno.h', 'sys/errno.h'), 'E[A-Z0-9]*')
+ 
+     gentvals(output, cpp, 'signal', newlib / 'newlib/libc/include',
+-             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*')
++             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*', filter=r'SIGSTKSZ')
+ 
+     gentvals(output, cpp, 'open', newlib / 'newlib/libc/include',
+              ('fcntl.h', 'sys/fcntl.h', 'sys/_default_fcntl.h'), r'O_[A-Z0-9]*')
+diff --git a/sim/common/nltvals.def b/sim/common/nltvals.def
+index 8ae8839..8bc6ae5 100644
+--- a/sim/common/nltvals.def
++++ b/sim/common/nltvals.def
+@@ -116,7 +116,6 @@
+  { "SIGPROF", 27 },
+  { "SIGQUIT", 3 },
+  { "SIGSEGV", 11 },
+- { "SIGSTKSZ", 8192 },
+  { "SIGSTOP", 17 },
+  { "SIGSYS", 12 },
+  { "SIGTERM", 15 },
+-- 
+2.33.1
+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
