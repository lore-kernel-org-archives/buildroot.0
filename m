Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5E606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rgY8opxL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A0D606DB;
	Tue, 20 Oct 2026 21:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER5nk4IUa71O; Tue, 20 Oct 2026 21:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B4DE60730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531366;
	b=Dqx1Cek+q4NsHU3cjrKxNgBqqsc7L1EeyG0BNkMQPmgebpmancf/Y2jbVylx/iwyWnoG
	 1ajSb8agqCsKcdV2KDUygSfTdjtoiBHBagDME1xGis2m6KmfiK+oKdrB5kba29rTSk1BR
	 WcOG3wdL3SazIMyvQ+nbuM1DQvc1FC+2NlDsuogTd2cV3TTRJMelr0zbwjY9dw5mXMkB7
	 F4oighoQD9125I3uKdQw791RxKGe7x1Notau773lk7flYbogXOX6OQfOIg9jvbh8GnvFd
	 urWg4FzbJ5eRJ9bJasdgbRV5JtQiAoIUbTphToZQPepUTHNglTdwon90b9oESPUUBrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a2sZIn3YiGeK2gpzldYR8UGyYtyU46RmzymsxGND2/E=;
	b=pYCdZkEJvOoFg463KAFATVv6rpAS1LeP/1kQ6cYAQaIlH8VKrG7ty+8VAD9UmiAJrpOD
	 y+582LPRemWq9lba51O4GmOr97OGf8pOxHuhGIoPraTVUvS2Z0tIHjL19LsFHW/ZTBO66
	 tM77XIOW1cdEqWZ3uSYqXyLuLwBUenpWL/XkkLQW/FbiHUJ/g8xXCYH9aaWCZVw5Gzgc7
	 KdylZSnDkhol5yG8pYrpwpnrq7VvzZRu85w2ONXEyXFVOHCL8sdjrczwhReMt8M272Y3z
	 ptWP3EPk1Vz+6BDJ+t9F9udriDFCUXja0XDeyJNhTVK7ibSSGB3aeERSrG1k2MWf9Ag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531366;
	bh=a2sZIn3YiGeK2gpzldYR8UGyYtyU46RmzymsxGND2/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rgY8opxL+vMW0BKiL8phahHFoZM3Zo1UbPN4U7+fSN34JkepzA6BfvrN639+xWQ21
	 ISIqt8wzxOLfzvcid4p4YJWWEUOiJ+ELC7zr5lbsJ5tU5jEvjwOqwZI36jra90motg
	 X2qAKHekLjlZ4P6qh0ntdIkPhRcJSSHvntMH1CNhWli5CIhDgTLcPdQ5CQQeHB8Vv2
	 3FHXsylkW2Mm/sc+ggIBytXzRU0ZuLOnYm2Uimw/omqjWAmD58X377ICpF3JLdeywy
	 d1/oMJpiVAEzeIbLMo6rGttE/WB8FqFO6SRbjQWHxxF37iO50Fm4SuW5sPotnrQzXu
	 jQeOYO3E7ja0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4DE60730;
	Tue, 20 Oct 2026 21:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 286281E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A06E40112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CvEyw0ZE-dZ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B5C474006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531364;
 b=JIWBSgSlehRBrqCsfqovHHESu0A7auK9T7Iq9Ul6ah6mqH3m0NBhVhKpo0g792Ap8erj
 KaICJSBRCQ0EHFGM3e3IN7lo8ICqLraLCjBgDBp86R0tXdc8xNPOEKiwBq1BDP4EKAfEi
 iLqcM9U54Eo9ytJpIoGFnW8Ds1xv1DwibxN/JIymLQlYkbNJ3gvn/V7AQ5WZqGSgDRVPx
 WE/hGdVeUUiQoYvi7gKOVvFEfxN6GaVdBerouAtVT7vAGa1DxD+BS2NaYb6YERPvFNZGl
 t9OVY5Nh7nwTm8vIqTXmyUHYmkIBLioneRAkmnPnyXLNvTQlZ79qU7lGYBei6EFPLbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531364;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=z7zXCxGnmG1hDcFtDg6lWFibKDveRxiJmxEtF4fJ5Pg=;
 b=UwOQowsMKaJ3quOWmu5w91HmLxNoUFrxFSpfB3FsbamGcnbWkm0bKbEFBvb8ec8Zltcp
 PZNsHN8Nu9IXKA0c0jHVgefo15E5P/UaRdhCrZZvN2PjoWrfFaH2aVrbEQ5UJpRzu7LuC
 i9WkUx692g8mQUSIqx/wnz/lz8gaT6EhHPROY0dUNIrwb20NpUomYEcJiaansqFTILzfn
 +o2qU6/wNbY4UoNS+o/2QKU6m+p9oU5fqleuTQZViNQNAyhvt8Gj5wEFDDXUJvMB2ckVO
 7LpSXXojfZ5AZBfpT4Aj/S2SbBwJSSTCezuUZDHevyBGWALZVcRB22mF60lYi/3fK9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=iYz2By9y; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5C474006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:22:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso16693366b.0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792531361; x=1793136161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z7zXCxGnmG1hDcFtDg6lWFibKDveRxiJmxEtF4fJ5Pg=;
 b=g2Z6Ghp+jqZzHH7kxZMICnho7rllZjg6lT6d//yLB/dwtFTjzh0d6XcxgSm62jN9na
 ZQI9ZB23xOvmCAOLKEIOMrzCoaWb+uFjtZYuiBqfG/B4GWUZ7RTJibAlAmHc/yeVkEww
 UTD9zYNrnkNMlgJ5MCs6nHNoZilq2xTAm0e8eGKMkSM/EC/dGOg0Rv7WWceY+QijisvC
 p0HtlEKISNg32p+W3a/k/fspYq1CvOsfQ60f/mLdYewWoXaKEklIW8I8vDmBl5Jbzwov
 Z/avmqKaW4bxD69bf1CFVLrQKtcG3D7owZ1eBy2afTP40sxTYHIz/nKImBG5b0O2biLB
 NQNg==
X-Gm-Message-State: AFq9FYIMQ5tuc7MU9LpkIkf1LWI7J4hkFsXtBs3ZWtkOuForpPxp1vgm
 Xp2n/siUEiUnNms1BGP0RU5SGOyYAzRODqDZV/u5EnhJD6rgcJ8R5aQAFxLJgw==
X-Gm-Gg: AYBFou2+Pp8wOUatDNYfmjElf2DXhtRuY0LGZtPd+sqC83d+w/3uId3SpZiE+QizRyf
 WAx+4+fh1bbGSOWt144oL85bTbYrLJ+CFcpgkDvF0QDs9idxwdnMjn9V89LPHSqZeltiWK5ACez
 hkBohYxJmqzIjhsCQA/GbIIfBHVECeED2tGXNv48BJOLnK+KvUKRv/g08RopvLHzcPzB639u30Y
 Fs9nZmXBGMoCoDVDkSgWrOhcOtPU95DVTWl/tKZ9gUsASj+wfhwn3kCJTQhpDVmE593wKysTkWt
 YCtV15r++5tWfFg0cNQa0AyLMCnetYP97LgXZzUgDAw0FAv96Jj8Ooy7gjlNl4MTY7DRxxJzE7S
 pJMyc3i48F0T6sMZiriL8nazgLjXNPhmDNvoIfzqr04oOdkIWPYkNz8CSC2U2qDQpTIdgJZsAkE
 IJNvu7BF1eS0t9a3zkA6yly9RM8w0UvlvmkjatWjgCuvG4UErdUS+F7u1MU1ckiOKNdhtz3HAw9
 Ybwlhvh1w/oL1V6c1vBRgp21IG6DTNjFpbtbiB333/Zt7sdLxmm0CoV0wWWX+8L
X-Received: by 2002:a17:906:f58f:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c46060b6e24mr272108466b.26.1792531360701; 
 Tue, 20 Oct 2026 14:22:40 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678e5b70csm14524266b.3.2026.10.20.14.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 14:22:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:22:39 +0200
Message-Id: <20261020212239.4182418-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gobject-introspection: fix host build
 when /bin/sh warns
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

host-gobject-introspection is built with LD_LIBRARY_PATH pointing to
$(HOST_DIR)/lib. When g-ir-scanner calls pkg-config, which in Buildroot
is a /bin/sh wrapper script, the shell inherits that LD_LIBRARY_PATH.
On hosts where /bin/sh is bash linked against the system libreadline
(e.g. Arch Linux), and host-ncurses has already been built, the
dynamic loader picks up Buildroot's libncursesw, which has no symbol
versioning, and warns on stderr:

/bin/sh: .../host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)

giscanner merges pkg-config's stderr into its stdout and parses the
result as compiler flags, so the build fails with:

gcc: error: /bin/sh:: linker input file not found: No such file or directory
gcc: error: .../host/lib/libncursesw.so.6:: linker input file not found: No such file or directory
gcc: error: no: linker input file not found: No such file or directory
...

Add a patch, submitted upstream, so that giscanner only parses
pkg-config's stdout.

This issue has been present since commit 8270fca228b1
("package/gobject-introspection: fix host-linking"), which started
setting LD_LIBRARY_PATH for the build, while giscanner has been
merging pkg-config's stderr since 2018. It only shows up on some build
hosts, when host-ncurses is built before host-gobject-introspection.
It therefore affects 2020.05 and later, including 2025.02.x and
2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/615b6701c6c200f6e6f3081e784f981e4f4f644e

Fixes: 8270fca228b1892b699801536ce136460e4892e9 ("package/gobject-introspection: fix host-linking")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...t-parse-pkg-config-s-stderr-as-flags.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/gobject-introspection/0002-giscanner-Don-t-parse-pkg-config-s-stderr-as-flags.patch

diff --git a/package/gobject-introspection/0002-giscanner-Don-t-parse-pkg-config-s-stderr-as-flags.patch b/package/gobject-introspection/0002-giscanner-Don-t-parse-pkg-config-s-stderr-as-flags.patch
new file mode 100644
index 0000000000..c0d951abbd
--- /dev/null
+++ b/package/gobject-introspection/0002-giscanner-Don-t-parse-pkg-config-s-stderr-as-flags.patch
@@ -0,0 +1,71 @@
+From 68770762fa69786ffddc3f5f5846c7140eaed624 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 20 Oct 2026 15:58:23 +0200
+Subject: [PATCH] giscanner: Don't parse pkg-config's stderr as flags
+
+check_output() merges pkg-config's stderr into its stdout, and the
+result is then split into compiler and linker flags. Anything printed
+on stderr thus ends up on the compiler command line.
+
+This breaks the build when pkg-config is a shell script wrapper and
+the shell emits a warning, e.g. a dynamic loader warning caused by
+LD_LIBRARY_PATH pointing to a different libncursesw than the one the
+shell's libreadline was linked against:
+
+  /bin/sh: .../host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)
+
+which then results in:
+
+  gcc: error: /bin/sh:: linker input file not found: No such file or directory
+  gcc: error: no: linker input file not found: No such file or directory
+  ...
+
+Only use pkg-config's stdout. Its stderr is no longer captured, so
+warnings and error messages still reach the user's terminal.
+
+Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/568
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ giscanner/pkgconfig.py          |  2 +-
+ tests/scanner/test_pkgconfig.py | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/giscanner/pkgconfig.py b/giscanner/pkgconfig.py
+index 39db41d6..19c5953e 100644
+--- a/giscanner/pkgconfig.py
++++ b/giscanner/pkgconfig.py
+@@ -31,7 +31,7 @@ def check_output(flags, ignore_errors, command=None):
+     argv = command[:]
+     argv.extend(flags)
+     try:
+-        return subprocess.check_output(argv, universal_newlines=True, stderr=subprocess.STDOUT)
++        return subprocess.check_output(argv, universal_newlines=True)
+     except subprocess.CalledProcessError as e:
+         output = e.output or ''
+         if ignore_errors:
+diff --git a/tests/scanner/test_pkgconfig.py b/tests/scanner/test_pkgconfig.py
+index 8b654e38..b7aa149e 100644
+--- a/tests/scanner/test_pkgconfig.py
++++ b/tests/scanner/test_pkgconfig.py
+@@ -104,6 +104,17 @@ class PkgConfigTest(unittest.TestCase):
+             flags = pkgconfig.cflags(['bar-3.0'], command=command)
+             self.assertEqual(flags, ['-DLOG="HELLO"'])
+ 
++    def test_stderr_ignored(self):
++        """Checks that pkg-config's stderr does not end up in the flags."""
++        s = """
++        import sys
++        sys.stderr.write('warning: no version information available\\n')
++        print('-I/usr/include/foo')
++        """
++        with pkg_config_script(s) as command:
++            flags = pkgconfig.cflags(['foo-1.0'], command=command)
++            self.assertEqual(flags, ['-I/usr/include/foo'])
++
+ 
+ if __name__ == '__main__':
+     unittest.main()
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
