Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C776C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9FF40303;
	Sun,  6 Feb 2022 08:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ELcDDE2rr1S; Sun,  6 Feb 2022 08:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D0040353;
	Sun,  6 Feb 2022 08:44:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1407E1BF3DD
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0226E813E9
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 08:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIa26Fzd9sQc for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 08:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E950C813E1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 08:43:59 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.103.53]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.17.173]) with ESMTPA (Nemesis) id
 1M734j-1n87Mp1nQN-008aWg; Sun, 06 Feb 2022 09:43:56 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 09:43:34 +0100
Message-Id: <20220206084334.1900252-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZYrYV4wruThc9l6zFtnDf8xLHBdr74ZHC/cg7IltBDScotUzwNG
 X/htogdBMuU9NQd1YRzPocdfz+o1sfi1Xiaor7xvIBBd9FOGYdu53M/x0ZoYE6/BkSBomBs
 DphhVpx6A/VfozQPTXn5z9dPKLSIS3W68uDj+7WAxMdxzrg0x6ADenRjQ7ZT9iTxJcOJ4u9
 6+Rq0i5qtnPzTB0IeI8fQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xRSkcg3v99Y=:9l/gz/lPCqGn7Yy6plUWCO
 EIHrDU+C28Kx5R224X1ll1BmeaRaQk0EtGqkrxw9S9jV/+yqH7CzubeqFtVBCrdmKkFUIi1L7
 mPO//Mt+qOl0sA5GYkHQ01ARX6/D3RxQJ8MmtKu0A6ZUel3elzdMdtcd731TSllFG3DNvhAM9
 vaPbe5WPcfLvMNkWUuyn60cprehySjIW2hI0pK0X6QxP1UJwyNtdVi+Eh8c8SR+disJ8hWj21
 ZKqDSf0POsF1kD2nFmOfgNv7b59RkvycwSWiaiTQ7rc/qdmxvlSOIULI/rj8n59bAZWJIpjPV
 cWMwgjyD5HgBRYNQ3/pjFEjRHmsvoedoZenmKkz9TX7R21p/UI8NuM6JRCEbM61qnNU3SpHZT
 FU+QyfHeUykjc2xcu4YxS/Z10U+A9dseGRytou023liP1p5vurHJls6aPu7ekuVIcyd7i5Dl1
 ja0iUpQ4dg0TDVX1mUWRNEoJp3sNe+OIOjvHoDyemiTS1xojrGfoISE4M9aaDTbFrawmaMC6+
 8KLPpfWtYjh4o413JlWeZpFQ1eQ9NGQsjR7cJk0lv3oPSWrBNC+tc0deF6leurrRxRUj/+jnd
 rygvbLQofRiNTpIUhBu/LymJqeayQSVfw6J+uXuxscQFmaa+WTwPQAWPGNQOjJsGfbwFF/bLD
 pPOPOv4oyRylRu/YcOho/FO95kad74xG0/pW/8wcMxp+iXLMvGziEsAtkvaWh9Kpt1daTN2CL
 ADDF5/M42zkzJpuS
Subject: [Buildroot] [PATCH v1 1/1] package/guile: Guile 3.0.7 requires
 libiconv.
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the error reported in the daily results.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/guile/Config.in | 1 +
 package/guile/guile.mk  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index b1182a4cee..2367a3ed3d 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBICONV
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0f245fca76..0f26443023 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -15,7 +15,7 @@ GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 GUILE_CPE_ID_VENDOR = gnu
 
-GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libiconv
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
