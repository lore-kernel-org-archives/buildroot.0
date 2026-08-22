Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A7EC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8777480FFF;
	Fri,  4 Sep 2026 16:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdAybKM_wA6B; Fri,  4 Sep 2026 16:22:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CF5DA810F7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538953;
	b=A0kTYv3jg7sh0WViEgIza7+r2SpmF1cuukz/wPS6IQMgGhqOwcRIOOstSo0n7J/ZyUKa
	 KFGWJY5hMUhI7sRnFQaDjYUVe0GaK90tmNPilAvGdJq2hNK/NSy5otPtmqT+07awYgGnq
	 E6MnjFw6rNduPlZSg5Po2hbXMELIFF0rplXGUUDoMw0IniR4g8O8OWvj/PGIudjEGQ61O
	 sHFQt3ZJYnnHeEILi5fExW1KAHLS2KlZrzGQuTIoVZnIfeRiE8dwLnb0g/tw0xNSWAbb4
	 KRMMVGr38heqTCOeBD3brJrZOO8K43me6DoP2syLR28z1ldBjdSB5woStjg0QAguhog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ngfa2ewWKX/8GZJ/Triu+D5VbvJ7tM4Z0w5b0bS6jg4=;
	b=iWU/ckO6k8jVQe7bBwrG/j1s87NfYRzPiyiMCZvTEe8j2sMGLepZIriMmnnIuWhC+6iR
	 uNbYJ2sAJTo4Oatc8+R0jBMjHIfSiDG1P51Xe1TxbOehkTJngYAekPt6SfIeBTctCOHbi
	 7YLkciWEXIyY+sjbM7y4EJcT4AodPDFESK3SYK24/rWCKO/+23LpWzSHDaFE7KKemm4F7
	 Now80z5/vRRiLZKwjDPss0tHi8YUDAGIiMVuBIg0WRrwrxclXmraKxcwq49lUHM0Rv/s8
	 L2P301h/RCxQz3BbEeTP3ntF5ZirhuOqMDuCSs2Qog1CGxSWm72XNimwYGPMT2kCXig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538952;
	bh=ngfa2ewWKX/8GZJ/Triu+D5VbvJ7tM4Z0w5b0bS6jg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UyJKjFNUcoVaZeSCnJ/TYvZn6MUe7buRIyGaX8KnvaOqR4ggq8MjCvgGwF+zZ9oD/
	 9vlVfvAaNxbfLR5bHJ1lbprc6v5OeNU0p/yqr2E3pOdyPpqm2DzHh9c07bLYKHqlMA
	 6ak8/SoynwNm3RYE7K0FuKGgHf6p/zs2Ez6oHD6xIVmABScXAZbPD0RHz/mj7NDvuz
	 ON7Cjh3OEM7p0GVT6uwL6/N/PR7+/Dlkkvv0eA7qcNoZmPSFxdg1rtFUqoKTPW+62t
	 dwuCCNlsOaBUmtWSRJFDaWFRc8SVrODjDmQgLfI9oMoFIf/gLFiv4F9OPgaXpAH5jP
	 o4NrtOaHaZfnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5DA810F7;
	Fri,  4 Sep 2026 16:22:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E620B2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 843D080F64
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sehZowm6n9Ak for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0963C80F6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=ovZYkqoT5g0sz0e3Qpk7dx6oOdwi//kANn1fgd9Xyhlw/SSYHEkqfCR/DRGp8P/9Eve2
 aBddrjO5hQZcxek4CwCYAxwKOXN/+dLhmJ+m5lEDB8hAmyVegT+1KW1N96nu/VWxAhgUK
 N1RoL5x0sFDcCkDqpDmjnd8m6HQkuw+cwrR8S5DvQgQTtVXylO327tt3AMMNyjsOuZ4N+
 kHesJOXJQ5nArk0+kxJOY/b51XEXkEtBz+K63kXDho21oZF9SsYwQr6fx8GHxVCo3Sy+3
 mEtkeFaEatzF8L0hIssDcJjD1OFNSnFGlq5GnhxYKfUnDRGjNfdL2mrQHIHebaB21PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dQYBtflXIoavNzMd4KjeZR3b3ShPDlejXVl9Zn2UpFo=;
 b=JVD+Kmkiy+/c9akG3wCeBPBTpREJtg6BbRX0XlXBIAqBWS5nVGYizpIWVNALXjbociYg
 YBjsRvgwnvFi3cZl0zeJr3k1gqnnckNRdD0tOa5aD6fz4Or9NKmBbWVo3fKIW7OUbec1j
 S9iyCBQ/wXMqo/H6BOQ25wM4oAdaMUkHcO47CF7EIqho+W1CwE0yB52WMBwDElcBUkMNr
 MsyoFyxMVdxgAPobLUQVJKGnpfBZaxxRopQ4zniPjXeKKiP87tDANEomqhM2uev4Iufxk
 EVNT4gI0JVVcswQNRXdVIU9iKcrU8+EQGxdymFql0KXwmA+vZI/CYR6UlBYbQnxEKhQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0963C80F6F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DC7594CCC; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 15:24:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43cbd2b46ad88c6a88b732caaf621acd20344139
X-Git-Newrev: a0c0208e1bc7ee83eb5a058b6c20b5e2ec6e3c1e
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.6DC7594CCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0c0208e1bc7ee83eb5a058b6c20b5e2ec6e3c1e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove patches upstreamed in this release.

Release announce:
https://lore.kernel.org/linux-nfs/dc0f6f41-84be-4a70-92db-89890bded3ab@redhat.com/

Backport 3 patches from upstream fixing this release regressions:

* 67ed1bdb ("exportfs: link failure with --disable-nfsdctl")
* cec8eeb6 ("getport: fix missing stddef.h inclusion")
* cf80edae ("statd: fix memory leak in sm_mon_1_svc() when existing host re-monitors")

And 4th patch which fixes error on old toolchains, e.g.
br-arm-full-static or bootlin-aarch64-glibc-old.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: fix check-package errors]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h_key_file-fix-missing-string.h-inclusion.patch | 28 --------
 ...emory-leak-in-sm_mon_1_svc-when-existing-.patch | 40 +++++++++++
 ...ompat.h-file-to-deal-with-old-Linux-api-a.patch | 77 ----------------------
 ...02-getport-fix-missing-stddef.h-inclusion.patch | 33 ++++++++++
 ...xportfs-link-failure-with-disable-nfsdctl.patch | 39 +++++++++++
 ...t-backend_sqlite.c-fix-getrandom-fallback.patch | 30 ---------
 ...-getport-Fix-switch-case-on-old-compilers.patch | 44 +++++++++++++
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  5 +-
 9 files changed, 162 insertions(+), 138 deletions(-)

diff --git a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
deleted file mode 100644
index 838d519d5a..0000000000
--- a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2d99ff0aa8a3b4d20558bce742edaaed9d24b3cb Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 7 Apr 2026 17:23:13 +0200
-Subject: [PATCH] fh_key_file: fix missing string.h inclusion
-
-Add #include <string.h> to fix build failure.
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-1-giulio.benetti@benettiengineering.com/T/#t
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/nfs/fh_key_file.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
-index 5f5eafc1..81ea1500 100644
---- a/support/nfs/fh_key_file.c
-+++ b/support/nfs/fh_key_file.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <string.h>
- #include <uuid/uuid.h>
- 
- #include "nfslib.h"
--- 
-2.47.3
-
diff --git a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
new file mode 100644
index 0000000000..d3a5bf991f
--- /dev/null
+++ b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
@@ -0,0 +1,40 @@
+From cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae Mon Sep 17 00:00:00 2001
+From: xuchenchen <xuchenchen@kylinos.cn>
+Date: Sat, 15 Aug 2026 13:58:16 -0400
+Subject: [PATCH] statd: fix memory leak in sm_mon_1_svc() when existing host
+ re-monitors
+
+When an already-monitored host sends a new SM_MON request with a
+different priv cookie, the code sets existing=1 and reuses the
+existing notify_list entry. However, clnt->dns_name is overwritten
+with the newly allocated dnsname without freeing the old value,
+causing a memory leak.
+
+Since statd is a long-running daemon, repeated SM_MON requests with
+changing cookies will accumulate leaked strings.
+
+Fix by freeing the old dns_name before overwriting it.
+
+Signed-off-by: xuchenchen <xuchenchen@kylinos.cn>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae
+---
+ utils/statd/monitor.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/utils/statd/monitor.c b/utils/statd/monitor.c
+index c76589ca..76ef16f1 100644
+--- a/utils/statd/monitor.c
++++ b/utils/statd/monitor.c
+@@ -187,6 +187,8 @@ sm_mon_1_svc(struct mon *argp, struct svc_req *rqstp)
+ 	NL_MY_VERS(clnt) = id->my_vers;
+ 	NL_MY_PROC(clnt) = id->my_proc;
+ 	memcpy(NL_PRIV(clnt), argp->priv, SM_PRIV_SIZE);
++	if (existing)
++		free(clnt->dns_name);
+ 	clnt->dns_name = dnsname;
+ 
+ 	/*
+-- 
+2.53.0
+
diff --git a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
deleted file mode 100644
index c5c57c6503..0000000000
--- a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 218e1b572123f527bd92c17ebb7ac00c2a7e6c01 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 7 Apr 2026 17:47:40 +0200
-Subject: [PATCH] Introduce compat.h file to deal with old Linux api and fix
- build failure due to missing NETLINK_EXT_ACK
-
-In compat.h check if NETLINK_EXT_ACK exists, otherwise define it to fix
-build failure and where at the moment <linux/netlink.h> is included
-let's include "compat.h"
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-2-giulio.benetti@benettiengineering.com/T/#u
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/export/cache.c       |  2 +-
- support/export/cache_flush.c |  2 ++
- support/include/compat.h     | 10 ++++++++++
- utils/nfsdctl/nfsdctl.c      |  1 +
- 4 files changed, 14 insertions(+), 1 deletion(-)
- create mode 100644 support/include/compat.h
-
-diff --git a/support/export/cache.c b/support/export/cache.c
-index 2f128d7d..65008f51 100644
---- a/support/export/cache.c
-+++ b/support/export/cache.c
-@@ -40,7 +40,7 @@
- #include <netlink/genl/ctrl.h>
- #include <netlink/msg.h>
- #include <netlink/attr.h>
--#include <linux/netlink.h>
-+#include "compat.h"
- 
- #ifdef USE_SYSTEM_NFSD_NETLINK_H
- #include <linux/nfsd_netlink.h>
-diff --git a/support/export/cache_flush.c b/support/export/cache_flush.c
-index ed7b964f..2a24dec7 100644
---- a/support/export/cache_flush.c
-+++ b/support/export/cache_flush.c
-@@ -38,6 +38,8 @@ extern int no_netlink;
- #include "sunrpc_netlink.h"
- #endif
- 
-+#include "compat.h"
-+
- static int nl_send_flush(struct nl_sock *sock, int family, int cmd)
- {
- 	struct nl_msg *msg;
-diff --git a/support/include/compat.h b/support/include/compat.h
-new file mode 100644
-index 00000000..83229b65
---- /dev/null
-+++ b/support/include/compat.h
-@@ -0,0 +1,10 @@
-+#ifndef COMPAT_H
-+#define COMPAT_H
-+
-+#include <linux/netlink.h>
-+
-+#ifndef NETLINK_EXT_ACK
-+#define NETLINK_EXT_ACK 11
-+#endif
-+
-+#endif /* COMPAT_H */
-diff --git a/utils/nfsdctl/nfsdctl.c b/utils/nfsdctl/nfsdctl.c
-index 016dd2eb..c7126748 100644
---- a/utils/nfsdctl/nfsdctl.c
-+++ b/utils/nfsdctl/nfsdctl.c
-@@ -26,6 +26,7 @@
- #include <netlink/msg.h>
- #include <netlink/attr.h>
- #include <linux/netlink.h>
-+#include "compat.h"
- 
- #include <readline/readline.h>
- #include <readline/history.h>
--- 
-2.47.3
-
diff --git a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
new file mode 100644
index 0000000000..a85390cdec
--- /dev/null
+++ b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
@@ -0,0 +1,33 @@
+From cec8eeb69dc65eb91e0cb23ebff23530d9397425 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 15 Aug 2026 14:00:36 -0400
+Subject: [PATCH] getport: fix missing stddef.h inclusion
+
+getport.c uses offsetof() but does not include <stddef.h>. On glibc
+this works because offsetof is pulled in transitively, but on musl it
+is not available without the explicit include, causing:
+
+  getport.c:459:41: error: implicit declaration of function 'offsetof'
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cec8eeb69dc65eb91e0cb23ebff23530d9397425
+---
+ support/nfs/getport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nfs/getport.c b/support/nfs/getport.c
+index 608e185b..6bd2f713 100644
+--- a/support/nfs/getport.c
++++ b/support/nfs/getport.c
+@@ -27,6 +27,7 @@
+ #endif
+ 
+ #include <sys/types.h>
++#include <stddef.h>
+ #include <sys/time.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-- 
+2.53.0
+
diff --git a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
new file mode 100644
index 0000000000..f1668c5b97
--- /dev/null
+++ b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
@@ -0,0 +1,39 @@
+From 67ed1bdb1af1c70a5fd3b377a997401b7676b827 Mon Sep 17 00:00:00 2001
+From: jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 15 Aug 2026 14:20:03 -0400
+Subject: [PATCH] exportfs: link failure with --disable-nfsdctl
+
+Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
+exportfs. This is a regression from 2.9.1.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=67ed1bdb1af1c70a5fd3b377a997401b7676b827
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ea19715..2ce1e129 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -256,8 +256,6 @@ PKG_CHECK_MODULES(LIBNL3, libnl-3.0 >= 3.1)
+ PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >= 3.1)
+ 
+ AC_CHECK_HEADERS(linux/nfsd_netlink.h)
+-AC_DEFINE([HAVE_NFSD_NETLINK], 1,
+-	  [Define to 1 if nfsd generic netlink support is available])
+ 
+ # ensure the system netlink headers have the latest features
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
+@@ -279,6 +277,8 @@ AC_ARG_ENABLE(nfsdctl,
+ 	enable_nfsdctl="yes")
+ 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" = "yes" ])
+ 	if test "$enable_nfsdctl" = yes; then
++		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
++	  		[Define to 1 if nfsd generic netlink support is available])
+ 		PKG_CHECK_MODULES(LIBREADLINE, readline)
+ 	fi
+ 
+-- 
+2.53.0
+
diff --git a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
deleted file mode 100644
index 86d615ca34..0000000000
--- a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From dbd44e7d6d4140e5e9d01f0a6daf6f3e45e5acbc Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 8 Apr 2026 14:28:28 +0200
-Subject: [PATCH] support/backend_sqlite.c: fix getrandom() fallback
-
-In old Linux/Glibc versions __NR_getrandom is defined in <sys/random.h>
-so let's add it to fix build failure.
-
-Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-3-giulio.benetti@benettiengineering.com/T/#u
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/reexport/backend_sqlite.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
-index 0eb5ea37..a1e981e4 100644
---- a/support/reexport/backend_sqlite.c
-+++ b/support/reexport/backend_sqlite.c
-@@ -9,6 +9,8 @@
- #include <string.h>
- #include <unistd.h>
- 
-+#include <sys/syscall.h>
-+
- #ifdef HAVE_GETRANDOM
- # include <sys/random.h>
- # if !defined(SYS_getrandom) && defined(__NR_getrandom)
--- 
-2.47.3
-
diff --git a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
new file mode 100644
index 0000000000..692bc8bd3b
--- /dev/null
+++ b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
@@ -0,0 +1,44 @@
+From 7b886f3502977040461a8b31f5948a128f7069e2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Thu, 20 Aug 2026 01:03:10 +0200
+Subject: [FTBFS,PATCH,nfs-utils 1/1] getport: Fix switch case on old compilers
+Cc: Steve Dickson <SteveD@RedHat.com>,
+    Giulio Benetti <giulio.benetti@benettiengineering.com>,
+    Julien Olivain <ju.o@free.fr>
+
+Buildroot distro compiles with fairly old compilers, which defaults to
+old C11 standard (some of still used compilers don't even have newer
+standard than C11). Workaround code which requires C23 with using { }.
+
+This fixes error:
+
+    getport.c:460:3: error: a label can only be part of a statement and a declaration is not a statement
+       size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
+       ^~~~~~
+
+Fixes: 1a6dcd74 ("Removed warnings in nfs_sockaddr2universal()")
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream: https://lore.kernel.org/linux-nfs/20260819232049.438643-1-petr.vorel@gmail.com/
+---
+ support/nfs/getport.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/support/nfs/getport.c b/support/nfs/getport.c
+index 6bd2f713..18ea0777 100644
+--- a/support/nfs/getport.c
++++ b/support/nfs/getport.c
+@@ -456,9 +456,10 @@ char *nfs_sockaddr2universal(const struct sockaddr *sap)
+ 	int len = sizeof(struct sockaddr);
+ 
+ 	switch (sap->sa_family) {
+-	case AF_LOCAL:
++	case AF_LOCAL: {
+ 		size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
+ 		return strndup(sun->sun_path, path_len);
++	}
+ 	case AF_INET:
+ 		if (inet_ntop(AF_INET, (const void *)&sin->sin_addr.s_addr,
+ 					buf, (socklen_t)sizeof(buf)) == NULL)
+-- 
+2.53.0
+
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 19315e60a3..93f8e463a1 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.1/sha256sums.asc
-sha256  302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c  nfs-utils-2.9.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/sha256sums.asc
+sha256  e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed86c9d3dc4097e8c  nfs-utils-2.9.2.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index df9fdbc052..6e0fb1a04c 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.9.1
+NFS_UTILS_VERSION = 2.9.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -12,6 +12,9 @@ NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 
+# 0003-exportfs-link-failure-with-disable-nfsdctl.patch
+NFS_UTILS_AUTORECONF = YES
+
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
