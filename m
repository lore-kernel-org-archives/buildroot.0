Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B87CAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA6D842BC;
	Sat, 13 Sep 2025 15:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MD4E5uzhq6uV; Sat, 13 Sep 2025 15:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F9BA8428A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9BA8428A;
	Sat, 13 Sep 2025 15:01:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F20117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D44014003D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_g9ataxHoNG for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 15:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D50140027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D50140027
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 15:01:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBCF8458F; Sat, 13 Sep 2025 15:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 16:58:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d21948be38a43c0b24a6152fa357061c879327a2
X-Git-Newrev: 1f2b459b56b117e97164feb397ad14435717d524
X-Patchwork-Hint: ignore
Message-Id: <20250913150116.1DBCF8458F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: fix shellcheck SC1090
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f2b459b56b117e97164feb397ad14435717d524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using /dev/null as file source because the package doesn't provide a default
systemv service configuration file.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien: remove S43htpdate .checkpackageignore entry
  to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore        | 1 -
 package/htpdate/S43htpdate | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a1f87db79a..e5bf14ae73 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -489,7 +489,6 @@ package/haveged/S21haveged Shellcheck lib_sysv.Variables
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
