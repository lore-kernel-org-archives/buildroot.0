Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E6CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0191C6104D;
	Fri, 19 Sep 2025 12:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7LdWjVZYfeK; Fri, 19 Sep 2025 12:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34DC961042
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DC961042;
	Fri, 19 Sep 2025 12:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7CAA273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B90A4087A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_f6yjJD25Uz for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02BA40C2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02BA40C2A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEAD485E7F; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 16:44:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 40b81bbf9f569846edd29c98f2a4d8326968de3c
X-Git-Newrev: e17496b123218f95728c707f0224722bdc905e64
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.AEAD485E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/htpdate: fix
 shellcheck SC1090
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e17496b123218f95728c707f0224722bdc905e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Using /dev/null as file source because the package doesn't provide a default
systemv service configuration file.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien: remove S43htpdate .checkpackageignore entry
  to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1f2b459b56b117e97164feb397ad14435717d524)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore        | 1 -
 package/htpdate/S43htpdate | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 541d3d3767..fe7f4ad0ee 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -501,7 +501,6 @@ package/haveged/S21haveged Shellcheck lib_sysv.Variables
 package/heirloom-mailx/0001-fix-libressl-support.patch lib_patch.Upstream
 package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstream
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
-package/htpdate/S43htpdate Shellcheck
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
index 5971d70639..22e5e6c803 100644
--- a/package/htpdate/S43htpdate
+++ b/package/htpdate/S43htpdate
@@ -4,6 +4,8 @@ DAEMON="htpdate"
 PIDFILE="/var/run/$DAEMON.pid"
 
 HTPDATE_ARGS="-a -s -t https://google.com"
+
+# shellcheck source=/dev/null
 test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
 
 start() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
