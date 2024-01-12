Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6918CC47258
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDB26FACD;
	Fri, 12 Jan 2024 18:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDB26FACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9lKrZpfkKyK; Fri, 12 Jan 2024 18:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ADC9607A4;
	Fri, 12 Jan 2024 18:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ADC9607A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E97C1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A5A8456D
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A5A8456D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuYMqxRgm5UR for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C1384564
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C1384564
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5105D85FA0; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 19:00:06 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5536261b3f7b7a7fb935d6b203c5882db4b875c4
X-Git-Newrev: 5547abb237ffb1feb52f4fa26d834ffb3f6aa839
X-Patchwork-Hint: ignore
Message-Id: <20240112180317.5105D85FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/botan: add
 trousers optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5547abb237ffb1feb52f4fa26d834ffb3f6aa839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

trousers is an optional dependency since version 1.11.26 and
https://github.com/randombit/botan/commit/1752f0d522eef9a4a703fccf702b4b026c1c1d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55b0434940d46bd16ec1d6063f124c9560e4ceb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 59fbc950b0..52019f36eb 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -67,6 +67,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_TROUSERS),y)
+BOTAN_DEPENDENCIES += trousers
+BOTAN_CONF_OPTS += --with-tpm
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 BOTAN_DEPENDENCIES += xz
 BOTAN_CONF_OPTS += --with-lzma
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
