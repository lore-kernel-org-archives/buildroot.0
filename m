Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6546FCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 08:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDA0340471;
	Sat, 23 Sep 2023 08:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA0340471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgFSpg4-gKsv; Sat, 23 Sep 2023 08:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365DE40597;
	Sat, 23 Sep 2023 08:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365DE40597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 729731BF83C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58ED8820B3
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58ED8820B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8fsKhz1DlAu for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 08:08:00 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 23 Sep 2023 08:07:59 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8513D820B2
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8513D820B2
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 08:07:58 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([89.245.58.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MV6G6-1r8oXA2YGE-00S8Sh; Sat, 23 Sep 2023 10:02:46 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.178]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1qjxb5-0001en-Ck; Sat, 23 Sep 2023 10:02:45 +0200
Received: (nullmailer pid 1188210 invoked by uid 2001);
 Sat, 23 Sep 2023 08:02:39 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 10:02:29 +0200
Message-Id: <20230923080229.1188198-1-post@lespocky.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Scan-Signature: 4b5898d038d1415590f3a2ccc7ce21d7
X-Provags-ID: V03:K1:4CNH3Bz1bNW9HDnJtaEJ/qohWTYPJ5BeqTFyKiVJXMwaMXmcksq
 R3frs1kQM8dl1+CSPi1aw04YTM5ZfIqp9B6OrfdPg9cnNt8xjKOujGD4MuhJCOQyJj+JIq/
 28dukiINPnUkstsFc44KZeGQi/5Yq/MLWfWtz0S6GPhOjJIapBNkzN+hJMnUqxyQX/3NFjC
 5GDJnMDa9ygXGLUBT29aw==
UI-OutboundReport: notjunk:1;M01:P0:md6nw83/DDw=;6ap7UWx5DK5apAbImzLSIHC1nEb
 XoWlKtz/QKwb0d1LeITRESKdhKjXEB89n442cm4yLkTd3SO9zfzoxmijXO2dwCcxPqZSgBh9V
 vYYhzkKKqt1+DjEodfpKf44gxZiENK+eauCZ59K1ViyOUj6O6nq0dvVbdRe56LRywuR36nxvC
 yyQUj7KL1hOmHTXo/5ElNPipGWvY/3qk/4zFuGHudHrDh2tR87Lzab+S2oHx/RFqyta+BO9ru
 J3DuWH3CusiM2dES6We1jc0omVUYnbwDGG7FdWjAg3cab5EqhLvymGmsorsrVy5QA6UAuotcM
 tNSdx/Q0kS/BQB9HawBibdgB9GQRAnfZgbLii6XFc0HFRYgstNxmPCre1S3KEGBkM5FGtVvPQ
 yMmdoX2YbR5Vn7YnTJrpJigAT8po6cOGTPE0wWK5SKzgJ4HBfMKtgqy/3ZD6wqw+SoauDjrmu
 lz0vHFfTqXGBq3Lqz6WbkAkheZt2YLtR6GAhrze8UX34EWkc2dLjv8Hg8hjxn6DBEJ6ctDeLQ
 UsY13/QajCq84bwJCZiT1J46vAFAkJ5CaqTJDg0kqKtQtVFXPfCekdnpiI9f23/D7mOaB+ahP
 RZhyYrnsBUKm8fnsUcs08pmATqSoJx5b1l1HlFKqdxrAoOxe7FyIxwPLAtGvtgkxIiWt855sK
 +1oc0cGdps4EiqAXABJvGo0ikQCgffoYiKU0kf1nG8F2QmP1pe4sZnFSOzBhq7kTuQ3MgvCc/
 5Ykcxx5I3mpUkFhIHO7w4PPLo+m7vFeKSOKu/b+pWAlQoFauitokoJ4nsITB7cYAzf6f26pps
 9VzgHfw1yAw5vsyQi9uHZY8sJVWKxZ57/KedPHOpVJg1+jpzDSybSnxkrG8U4CO6PBo9psatD
 BV7rfxjxLM1rgeQ==
Subject: [Buildroot] [PATCH] package/putty: bump version to 0.79
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes mostly.

Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index c691a4f975..05c1a9eea6 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.78/{sha1,sha256,sha512}sums
-sha1  198f01db6bea708e480fb11dd23026eda7b3f49f  putty-0.78.tar.gz
-sha256  274e01bcac6bd155dfd647b2f18f791b4b17ff313753aa919fcae2e32d34614f  putty-0.78.tar.gz
-sha512  d7a3e2eabd5f1f65fc0f3f1ee0789c30fbe891b57f63ddeac0b92befcb6aecd4a748f04a21c76ee42d992deb77c2e1a0454a71cc620ef26fbf23af660bd84bb5  putty-0.78.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.79/{sha1,sha256,sha512}sums
+sha1  c40c3ce9fd334c40e64c6b33ee7e1096dad52701  putty-0.79.tar.gz
+sha256  428cc8666fbb938ebf4ac9276341980dcd70de395b33164496cf7995ef0ef0d8  putty-0.79.tar.gz
+sha512  4f10f870b229c89e928921d3b350955ce1c1170a062e7943d9cc8dbd83389d82a9b844623541605f0db5a429d545c2d188bf8e384c6515466fae69b216120983  putty-0.79.tar.gz
 
 # Locally calculated
 sha256  7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 82b7464bb4..d3c8d923f0 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.78
+PUTTY_VERSION = 0.79
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE

base-commit: 20c023a3b1363f914a18652a79f83648af2cf1e6
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
