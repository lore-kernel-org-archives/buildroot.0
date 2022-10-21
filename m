Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC84C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846B084401;
	Fri, 21 Oct 2022 22:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 846B084401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_MMfbqWRACv; Fri, 21 Oct 2022 22:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0E5843EB;
	Fri, 21 Oct 2022 22:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0E5843EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 927921BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78ABD41793
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78ABD41793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hRH7DDtQXwp for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:22:58 +0000 (UTC)
X-Greylist: delayed 00:07:37 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 269B441780
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 269B441780
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:22:57 +0000 (UTC)
Received: from uxmal.fritz.box ([151.71.224.230]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.17.173]) with ESMTPSA (Nemesis) id
 1MOAmt-1oRyMm2om1-00ObBu; Sat, 22 Oct 2022 00:10:13 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:09:56 +0200
Message-Id: <20221021220956.699772-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:bkIixqUP0ghZcbjm5MOpi197NpRv87EBTRc+TvVHXvgEpBfUAjI
 W7G02nTOVXyJd6Oi0rpFRI8boI+6BoqPqX1O3N1y3fU/sLKAhwVE7AUhYTtMEIdrQFYyVl0
 WJMZiQdw/BBttaARR8BExCCPZrXbQOvPneYVr3Q0d+jh5v7S4nzOPLQgQkZB9j2wyjA91zO
 mAZwM4rmEme/Lecf6VLAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h3fKfm/WLqc=:/ON6ziubWQ6+ZNIgw3PWsW
 oe4SjyJSZPLuoR3JZdL2rt2JARfUlrDvL8+tNmg+oOYZiSwS1hlFpjlBgy0r91vRFifBFWkLK
 5Hf3ByAJJclEgukkqwXZ+HWDdR+AC416ALSVn0V8ecxX0vRByHA2xwpei0dVD1NIU3cRMIswk
 RFffaJYx8xwV5ioThG2YWs1QP9+Xn3Orp/0LDBjNQYtVzlw9lryqSwA/vvXSuz3WMuSMhg1CB
 77m73q+bjs9h6/ZcHWpi3yg8q06ZhycBp0et0zvc5Jr8oXmJ3mWf3niG+zAl3nvTuOY0Gd0QW
 K46W5DWJcMBfe1XaikP8E1YaBPVVy/0fzbdmmc3shf1qXQGoylUTAnxVlU4oQGjy6HBpKja/J
 wAXdm6bIO6kpN53o+LcGSPtvO+YfsdW6AbT0F9XtfdPRXJdyay4MkVjROaMTe/Ns7a1JosPuH
 XQEN2f3iaNI1Ch+uYsj23GxYGliBuMP14bzctpn+uOOF2na4RhAK+toVG/C0e3IlGHjwQroSI
 re/GnOd5RMN93299e7VLwYRgVexUz7TkdUEtDk9/ALv1GjKvSg3mcarl3lu2eWOXxDp3B7IRb
 H2LU+EPeRaaMlJr6/sZLPjAmQ/irWqzK9KqpO2uqbmXW5cZw10zMmA1xYstW+mGlB73AD4gYl
 C+o/T0MuUAIYkqYB1V06ZTAFTsLfr1hRv9djkNAJAt2IC1JH+f5cqOHkgXeG5ZZIgZA6MOMam
 sb4p9awJeFpYj1vL8l+pyCrQpfk5uQMrHYKqC+mzrdz5MyNVhrX3EDT5bfVb+dfnCcXdCBb61
 bMSkEEuJB6nu1mak4J0XtUgVxdaIw==
Subject: [Buildroot] [PATCH 1/1] package/libunistring: bump to version 1.1
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

https://savannah.gnu.org/projects/libunistring/

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/libunistring/libunistring.hash | 2 +-
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 81ffd4fb0c..8267d56327 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
-sha256  5bab55b49f75d77ed26b257997e919b693f29fd4a1bc22e0e6e024c246c72741  libunistring-1.0.tar.xz
+sha256  827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98  libunistring-1.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index a69eacd676..8d5b6f54ec 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.0
+LIBUNISTRING_VERSION = 1.1
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
