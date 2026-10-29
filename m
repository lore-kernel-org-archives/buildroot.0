Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95973606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nat5Y2hB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F3460A71;
	Thu, 29 Oct 2026 20:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yrhq2GwO9_-Z; Thu, 29 Oct 2026 20:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B9AA60A77
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305426;
	b=oRhutfrvO/M+nYywUIr4XJ9Q4xPT7J1MMgUfy2QN9igq5LHTI+Uv5TOTVzmIqTmWUZ1E
	 uIl75dTWikjbbgv5eXUCYnRx4GCCbIM+bISSFVjXJGmIcipa+d7bJeHYmhau7sNPWabBs
	 KKQT3Dfnynne+IEnGLz41VGuCtYfOrHnPlhi5JQzbAtj+upc7Dxsi69N6Vp6zy82BaM8b
	 Z6C7FIZfEHIYSKkRgX96S5/GHugRtgG2Ut9CV+Turlk6HLG3d0czKEWJ6FS60hVaixuPt
	 7KonkuIUHpBjhYJxi0oYH61BB+SOdxafv8WAtF93a/Uk08fCmJopF9az9YrNBUpO9RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qERP7wJWU6EaqYLz3YO5Wo5v2OUBd6iSLYKnHZhdk4k=;
	b=P4TldYBtS5LOwF8a7gJN1FE9F89TOhaqqO9FkRVE3Uc4kv/EhIkx3ePif3qQcmTKvagc
	 4KZ1iMPnyExIm6LGk2aMjrTADrgRL+Wp9fPCaIwoHly1FTuUTJFlW+0jZZEyP2wx3Sf4Y
	 P5CU4RQlEA0a6Er/kcsBDvUGCLsObZYX0ONzrjTwq3K1OObEKJ95E8WU8piqrU41/3P9W
	 IYEK74C8DCOzT9Da+lC0S90Wt1LbTd21z7Js4gzjdDi51kCH0WMzIi/Y9EN1eUpwA6Iko
	 QidtLOZoomxth+GUq6Pxca9kxE/2MjCrYktD41eOc61mBcvTRRJWipI7ctDBzQRz90g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305426;
	bh=qERP7wJWU6EaqYLz3YO5Wo5v2OUBd6iSLYKnHZhdk4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nat5Y2hBo0g2QOQn/Juc8+XUrfMOIhS7zkmBFO/VGoXg9qkOBSz/38f7xSqZlOp20
	 oRHPN80cs0HTOcBwwaglpIOUdzlzO07Gann7YHhaPB7hrHjS8aV5zjluID1YkmwAsr
	 JrrnT1legOnD7ZZm0Moc0dLEJ4dt0vW77Rt280QEA89RBfIsFejnla1ElofEFN3zTj
	 BD7w8kGpdUBseNrwmaMGPgfADJuA3yk95/yeMHLmnS86wo9wggixOpQlUHKSg6r0X2
	 lb3pyEWU+Mzb1+PTVc0kq3KtLnFbea3QOb2fzLxboXNG5JD1heX1aFuLP2Bcbs3SvU
	 Un3j2wMSvNdpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9AA60A77;
	Thu, 29 Oct 2026 20:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC0F972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52E6240506
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBzerT7f-e0Z for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8802D404FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305405;
 b=U7+9AAXjVk2JwvX/rlRmGFm5DVsygj66dYyZy+zyYQw45LtFzzW3roz9t6kUR7OmaMkR
 gzMat0oTJo5NWGXuPlt7x84GPgamDKFyF7RyS1DrOgu6WxTlgUxU+A32KkbAKJP9KrrF9
 bzJ6KUNsbs1d/WhOSzGHXcxjLERi30/Hod2zrs9FtT3Y/PjiwgM2CBCfeEuXpXKAXuODg
 Y6F4Jvgs77fsmcUBlOrdI22whqrlUAKnEUh45OPqtiPntZc5MnWrPFHdWhvxjpytZEPVF
 OepZ05bexsFshQfMRlm8qYOj044i4h/kqbKPJ4422fZQpcwth3Gg/JELypQXbFZnUxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305405;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=j6T0S4+Nlp7xG1+60lLelpHrTHVT6/wTCx1dwBcmkv4=;
 b=DnbQxxtn1VSM95PRQ0FL2hB+KtgUYPRmp47pZPadmDNIR19Tuh6yQi9gYVsDxXAgDuDt
 RDaJ2m+VA++HMvbFqBnFXl2Ax9ELtT6SVDudOHC+i+fJOGYSu8O+XX92TFVwK0ldS8hUZ
 4BLjXkvjkxSdAhr4j+A9Tsx/8wA8bTCKF2wKii+9awJl7v6FMsO/zj2huFGY2V5Kyda6B
 dtOEnG86RKQoHEcPEh2cLDKa5AlN6kmgEUHpITdKU2I8rcH/uxbKZs0Sw7bXKf19RGyFT
 gDHXnZWWTnAhASH7Ze0MlYrnIEOyxhaNfVC8kr8TiqjX6iroKCiZNsaCntcLDq8fxJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8802D404FF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AD059D2EF; Thu, 29 Oct 2026 20:21:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcd7370ab2f30d9c0e768320811a8bb09fee11ef
X-Git-Newrev: fcca24b3dfdfd5b16191f5d19da760ca478b5130
X-Patchwork-Hint: ignore
Message-Id: <20261029202158.0AD059D2EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-vfs-*: mass version bump to
 Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcca24b3dfdfd5b16191f5d19da760ca478b5130
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index e65ba18fa5..79e861b1aa 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aab35cb6b03191609a7e97df02f2f102659c12e414f7b95595f9bb2047554daf  kodi-vfs-libarchive-21.0.2-Omega.tar.gz
+sha256  378ac05a967e80dc02d36ddcaaff97dd8324ebd58c3ca7cc82b943037dec14a4  kodi-vfs-libarchive-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index ee1ca59b52..7ee7547f2b 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 21.0.2-Omega
+KODI_VFS_LIBARCHIVE_VERSION = 22.0.3-Piers
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index c69e57758f..eded39b35a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7492cf73d52299218acc982c4b35b020ea801d36d47e40460341f4dde712de50  kodi-vfs-rar-21.0.2-Omega.tar.gz
+sha256  b640feaa5579afbf1ae911eeb47abed78501d2bc2bb177ecc06022da04707181  kodi-vfs-rar-22.0.5-Piers.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 7cffe1274a..cc96dab863 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 21.0.2-Omega
+KODI_VFS_RAR_VERSION = 22.0.5-Piers
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 3a59241d7b..be2471c77b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01a23958331cb0cd78fd2e9367d1269d4319c20b84db5b132632f9c1acd5f3c5  kodi-vfs-sftp-21.0.2-Omega.tar.gz
+sha256  e0d54427f74874da2352afdea0288864dbaf8dc38ecc5bbc0b1711a129233e0c  kodi-vfs-sftp-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 18ea2bc099..c6eb220d18 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 21.0.2-Omega
+KODI_VFS_SFTP_VERSION = 22.0.6-Piers
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
