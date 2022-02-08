Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFDCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A60408C8;
	Tue,  8 Feb 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIdyoia9fguy; Tue,  8 Feb 2022 21:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EE0A40423;
	Tue,  8 Feb 2022 21:38:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E075F1BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE8A960AEC
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEa5fHcKzJqj for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:38:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEE8D60ACF
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:37:59 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.103.8]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.17.189]) with ESMTPA (Nemesis) id
 1MN67J-1naSe10vxN-00J2ML; Tue, 08 Feb 2022 22:37:56 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:37:22 +0100
Message-Id: <20220208213722.836257-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:oBomqdqZIL4buYeswnegDXJGdE1EKvjtLN7tHM7SPEOD/1pRN2H
 S5oynINMpcr0iDhuJkCEGcvC8LtqZ60LoRD7NZXjFxMAzZwrmND8t68P1Bgm44HoWXemGYc
 CjhZQwbhTuw7LKgA3KfvWRQHi4ibXOAdmrkHMcYhMBKFI54VknVGR7YBoSm/QVwZ+p2drOB
 xs1/kf/AwDsxd4HMgDT+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BMtURVBsHaA=:R5puf82gG9RSPymg+qOJq3
 iVelUFyV8u0ZL0fuyseCFaiHy4yUIZWRxKUYjsriXF92t5aDmF8E3lF5vZapNKeDvRjFC9qml
 RrJ5iV5ondqvYtHOFRZCalH8vG6NZzg03RdjeNAWv/kSuByM+L+dlnedk30ghtYmZgBOtnVfY
 31hi25MJIO0bn0wA8jcB6wLtME7o504VJzgtOw2VM4cgeluYrGVwdij4wy77gtCOhqeBzth+7
 xXmuHtr+IANKuEKuXWRW+XdDPT22cAs8QqmoN8GfXhnevLLmPEJQvPJoqUWKArT2Ic7xTFNa8
 8ZAiHSaFj7+Li3tJ8g9tGdkiuTnVGEQhwgz7uDGRWPvOKSBfafKfBHT6i6qJrS5SkPJxvtM1d
 lGculozPfPZU2ZGzSoc4wNu7nf4kNT/ZwhqJYzZImq2CMD4qgpOykhbQmz9XwrloDOsF7/3BJ
 HVovhw6VBYfglIEEtiCDNPYBGfupi1/YeD5UAYqOsaDYZBqpHekWDt2KMFhj8+ovg08ILiTYA
 dukwlw0BPSxVkgy2AjQPK32L07rZgp2CTAFhJXUEup5uvOT9k+LLOcdM+GKHaGpvg33gjLqG7
 ZMVhKgW6074826FG61Ut3uUhEE3r4IZpgfpQnpRf9ULPGtSx0mAyTEw2TPgheCCXocvQbK1wC
 YjRISUb8cSf2U5fyxQK+mMHbH95ac+dLLAGDSNroT71svdNLH6oWwL21iSbaP8AI14WkpAT+E
 bzFX7nUhHw9KI7gW
Subject: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE as
 dependency.
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
Cc: giulio.benetti@benettiengineering.com, thomas.petazzoni@bootlin.com,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If it's not present, enable libiconv.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v1 -> v2:
  - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
    as before (pointed out by Thomas and Giulio)
---
 package/guile/Config.in | 1 +
 package/guile/guile.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index b1182a4cee..f70e674018 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0f245fca76..03420407f8 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+GUILE_DEPENDENCIES += libiconv
+endif
+
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
 # instead of the ones provided by
 # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
