Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A98CD80CA
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 13:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C38C40935;
	Tue, 10 Oct 2023 13:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C38C40935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-NBmCL5eZsx; Tue, 10 Oct 2023 13:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6453240967;
	Tue, 10 Oct 2023 13:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6453240967
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2D031BF3DF
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7B9281EC0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B9281EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMZ7wRMgSf-f for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 13:22:03 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Oct 2023 13:22:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558E881EBF
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 558E881EBF
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:22:03 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MkHEH-1rIgnx1bfl-00kfb5; Tue, 10 Oct 2023 15:16:56 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 15:16:25 +0200
Message-ID: <20231010131626.1128436-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:0/rwhVKZVbx+5znVzNp0xG50ZqprBLgcxiqL84gzSqwghnbD7SK
 xnln6ySgYD/1eB5jISLeYy+I2fexHNqbQWWEgjxDs1qiDtrGPHmTRFVbgJXeKdhaegUDoNL
 Hz6hkdZnQXURcSuuri49cTvPS9fuGioWJNpYV4ZMsB2UR8VqrJ3ROMczE5wNIrzLCCtI2/A
 O3szHE4pCObtgcsCIM8Mw==
UI-OutboundReport: notjunk:1;M01:P0:C07U16podt8=;QytJxJl+58hFhJ1aRuxKGYQbKN9
 6ASsF6sGbVWz+x6TBkm9GB6BgfT47sKn/Y92A+s9Xhas+7Fu6hWJubhibTY45gptb+sZIj2Ym
 KXAdZY3feAWOez8T4GOJiOMTrjDSPaJ4d5i/eUEOXMA6RbJWoiIg2SqEJb7MyqqfRretzEjnH
 eJupuolYCxArPjIbik4iyVlQrAuxy/wBiXrj2TbfHQSh5DjQ3fMZ2EgD5AGFih2Am70mWeWFF
 vHz8mb1L1rphTrLXOAmh1ZrmQPmAl6jJlXSifDVoFfACcwIl7fdb5iSomgM8+PsKdlkbIAVvq
 Qwsn/z4GRRFc0tnbJ1EzUqmINxN4xZ9CyPZ1z7MhxjmroYLzadWYYY5i1ioPVXk6mtEbsSdht
 l328Xyeoj6uaXnKem+qQ6R4CIl1Vblwp/J8do18VooXeMkXcPCFzax0Joe61EW/8uzlnuHpHG
 vs0GAszcE+MYXZw/KaojaZXXEApFvR6CHn9QjPrNEoNh6ufIR/tJib8qnB60px6rAX1KnbNrB
 1ubn3U8AhLI15x8kcm2cvpfjI0UmgxJMxF5nVviC6Crk+C+A2VWX8EcRtL7qZV5lEDgFBLGdt
 DJZIUWvWoS2ONTO60tZUPLyeN+kVuebWSaa4dWdJYEqlfk7Cy3Q9iy5vUDVSJ5IrjFdjjNJIh
 rX36f8Sf20WWMuNnVqldDo9X02rpOdB+4B5A3vvO7sqgL+n0BU+u4YieE9tp8HL04gyHASjIX
 pSpurHSTXtMVwuJyvpCZP040+9yEoiwjwxxFUOyRlThEjC+b3PAXPeZj/eFric3xQ6Rncl2ly
 YN7edzkTyknsMLuWM+zyCKz3hyFd1ViLzox2ZqAQ7WWQxROKRjsRX/Sy+ZsKrBMh1VC0Ty/W8
 Exrt8ih7pwy3R7g==
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.3.4
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index 488608bc4c..d3bca46803 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b4d0234f0806a723d79a89426c7dbb351cf6cf554c323cf2625a3e078a93d065  vue-3.3.2.tgz
+sha256  5d3ab0144d5b8eaf28ccfbf27500669a91463226c4767041c7293ce76065171a  vue-3.3.4.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 50b7100b8a..29bf3bc66b 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.3.2
+VUEJS_VERSION = 3.3.4
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
