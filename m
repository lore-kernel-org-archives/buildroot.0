Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953BAEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B4C06100B;
	Tue, 18 Jul 2023 20:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B4C06100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnY6TTuRf5xi; Tue, 18 Jul 2023 20:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8AB60BFB;
	Tue, 18 Jul 2023 20:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F8AB60BFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A22E21BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8778E415FD
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8778E415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNZojlkLP4k1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E40A415F6
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E40A415F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CAF3873D8; Tue, 18 Jul 2023 20:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:40:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33
X-Git-Newrev: b0c6f049740b6b130301e356aab81c12de683645
X-Patchwork-Hint: ignore
Message-Id: <20230718204030.6CAF3873D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git-crypt: fix build with openssl
 3.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b0c6f049740b6b130301e356aab81c12de683645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix was proposed upstream: https://github.com/AGWA/git-crypt/issues/290

Alpine Linux uses a similar fix:
https://git.alpinelinux.org/aports/commit/community/git-crypt/APKBUILD?id=25b42ad7711b08c63aaf3c24af80a4bcd7607817

Fixes:
http://autobuild.buildroot.net/results/dfb/dfb5da218bb323edc57cc609c2b75d5fbc6e1fd1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git-crypt/git-crypt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index d562522485..82671b037b 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -15,7 +15,8 @@ GIT_CRYPT_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 define GIT_CRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(TARGET_LDFLAGS) $(GIT_CRYPT_LIBS)" \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" PREFIX=/usr
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -DOPENSSL_API_COMPAT=0x30000000L" \
+		PREFIX=/usr
 endef
 
 define GIT_CRYPT_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
