Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D5BC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 14:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7569540908;
	Tue, 29 Aug 2023 14:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7569540908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EELDrag86ova; Tue, 29 Aug 2023 14:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C37404D0;
	Tue, 29 Aug 2023 14:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C37404D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32DEE1BF39E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 14:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C4B060EF8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 14:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4B060EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJRib6-xxfcO for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 14:26:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 379BF60AAE
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 379BF60AAE
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1Mlejs-1pscZL1VD8-00ik2v; Tue, 29 Aug 2023 16:26:45 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 16:26:09 +0200
Message-Id: <20230829142609.18139-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wc1FwIks+C/JwrNZk6kXx5dOyHMcleyM8DV0lk2Xd4ysoZkc1v5
 tFlYE73N0C7CqHiH3h7C7HcXgsg18Nl2MMCD0iA94pAe0oTqFry9xHUPLc4i3rO92BHenOM
 QgZ9VlvCqswk/3WHPuVVm8JLyt936uSrjU04YAyu3do6o+6gTRpXZX34Izckg58mg1cZqot
 Wiw5FYLmlB8PJkWDOnLTA==
UI-OutboundReport: notjunk:1;M01:P0:CdX0aJKucvY=;QsnpEoX7BSQyi9ZPVTljXAwgrGm
 fLcMP7+WFM6+rtVoYUAzi+Vlxm11/jGa91CiIgOlUZy92U8cA2xGHSZ++NQdQm0/4sYgrOKuU
 eZHquSw394tIAc4N99jXKksb8xbvDRyKxMorBKKDcI62JuIGSyt1LZ1eom/iNohs+HcgLbHBb
 l9dy5AFZDYMbupo43e8pThVTa1cdY29sO6r0Crcxd5frnjauJlfrHniOGBGfHclMC0tdy74rw
 Iep5HKxRRi+oynvL+/kbLk9+BYLb/CUvcCbKQfWyTTntn4hTwHH95/NGC/OjI3ziLTzsb5rK4
 hy5LIPEumvuQBJAhITIoSHSXrkbABTC5aLs7pO/0G3hMJEW4s81qlag7G+/AcJHGbtcp8rE82
 Hf8w1Jg8A6leS8NuRnYo01d3sEt2a03PPB/sNGybr/LgvZHA1ZvKueaUuHEbPKdcS4rg29yn7
 A46zZuV8XKUJfUfBhrN0FP7sX8con3NOLoYxOM3nbENzsp6eoNZ/o0RkPtAa6eerM7jqx0qH8
 2Yot28T3zjJDK3HX821L2xZoazgOwjAyLyu7AnHFGQAbtLEO4vwtClMl0F2vkEhJtfEz4tXEo
 6o058HlFNXWjaMQxS7HI+eaTBPwls0boLICnGpF5MGX5fHtXWBevP/ynNO5/4QTZp+QWImGQP
 l+PKBCiv2jS1ey2Zxojqvm95BDtHPi7ZpToQUD7Jx+3nzrjtCmZIuyPvkLCQK52m7/iluyJY1
 16ri5j9PcLWnIcZAFqEJLbjnsNxqKi7rQ5K2Ok1CDJ1hMaSIReRgbJm9fufzdXPmqgpb5ZESo
 lS3GTcYutffZUURorX8rdUW4oEnHtIG61PdXmdgOiLXWrKcubn+H+RZ+dnbRBVcwRgAsWgu2m
 0Qr1OWr+n7jOthg==
Subject: [Buildroot] [PATCH next 1/1] package/libgit2: bump version to 1.7.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a problem with the build system that would make it fail to
use pkg-config to detect libssh2.  It worked anyway because -lssh2
works.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 1997c3ba8e..76d599b81e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9d0f84a86bf98b73e68997f5c1543cc5067d0ca9c7a5acaba3e8d117ecefef3  libgit2-1.7.0.tar.gz
+sha256  17d2b292f21be3892b704dddff29327b3564f96099a1c53b00edc23160c71327  libgit2-1.7.1.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 93505f7d85..92563d24bb 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.7.0
+LIBGIT2_VERSION = 1.7.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
