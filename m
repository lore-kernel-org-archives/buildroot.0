Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2ABC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CDBE611C4
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CDBE611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D4F60BE0;
	Sat,  6 Nov 2021 10:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRbgeYPRbK41; Sat,  6 Nov 2021 10:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A1C60AE2;
	Sat,  6 Nov 2021 10:20:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00E9A1BF2AE
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D51400CF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxRLbVgxlfvr for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC807400CC
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 401528806E; Sat,  6 Nov 2021 10:16:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:19:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd2318df7b92cfe3a87273cc38f8ad1767419b9b
X-Git-Newrev: 57a950754227d768f84a85266850e47172310ea9
X-Patchwork-Hint: ignore
Message-Id: <20211106101644.401528806E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: expand for 2021.11-rc1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57a950754227d768f84a85266850e47172310ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 CHANGES | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 93d191682d..676f195e01 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,7 +1,7 @@
 2021.11-rc1, to be released
 
 	Numerous package updates. Notable updates including numerous
-	Python modules, as well as Kodi add-ons.
+	Python modules, Kodi add-ons, nodejs, OpenJDK.
 
 	Toolchain:
 	- glibc update to 2.34
@@ -33,16 +33,21 @@
 	Removed defconfigs: qemu_csky
 
 	New packages: dtbocfg, firmware-utils, gstd, libdbi,
-	libdbi-drivers, lua-augeas, mstpd, php-pecl-dbus,
+	libdbi-drivers, libteam, lua-augeas, mstpd, php-pecl-dbus,
 	python-aioprocessing, python-bidict,
 	python-charset-normalizer, python-flask-expects-json,
-	python-git, python-pyndiff, python-rsa, python-xmljson,
+	python-git, python-pyndiff, python-rsa,
+	python-unitest-xml-reporting, python-xmljson,
 	python3-cryptography, python3-pip, qt5opcua, rwmem,
 	sloci-image, softhsm2, uqmi, vuejs-router, watchdogd,
 	wireplumber
 
 	Removed packages: canfestival, python-meld3
 
+	Work toward the removal of python 2 has progressed: many
+	python modules and packages have been updated to a version
+	supporting python 3.
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#14271: compilation error with rsync command for  permission
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
