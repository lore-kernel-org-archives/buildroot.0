Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACAC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B1841925;
	Fri, 12 Aug 2022 15:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B1841925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_9joF_2vUyO; Fri, 12 Aug 2022 15:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF52941920;
	Fri, 12 Aug 2022 15:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF52941920
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1BD1BF5AE
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63CB5404C9
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CB5404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MvRAYZdE4IR for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:02:29 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C4A404AE
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C4A404AE
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 15:02:28 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M4aEC-1oKrwM45bS-001hmI; Fri, 12 Aug 2022 16:57:21 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 16:56:51 +0200
Message-Id: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:GF9cb9KCa9nADmgLy6+N0hZ8A7G4SikU7jEsYSn+/PKIEhWVGJD
 ko7pXHXXYGDsM+CPGROpwgs7diFCTxj9ZNrEUqsRA8D4tC/ajDqnKJnUtbXANuB2uXM/TSP
 FBYkF+d0JqMqat6vE1pRI3mjGigBRVoiLgownp7AjPy3IID9oizVao9REWMwwulAWyo0wJu
 XlWdqeuVnj46tV3J9SDBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FtUKm1XhyBc=:H1GnbHWxs5wAu0ImkToXCE
 2mW16MX6bkbAZNMLE2C3Rqzp4SO/MF7c7rrpccndAEprHGyWKpFQYzWwHz/IdNp3grAUsOajJ
 XQ1NOmdZLf/cMTmDQ/6wmKyEAuOVA+iYZ9Qa4/X/pb1DcJyXzHc6yDgAkMnNpU5mwWsyhwlCF
 FgTE5+N57DTMB6q2saV9g1ED4KpcbVRrR0uyLgBImySCNS6tySs5hGBflnCbhuqO64APS2zae
 s9YJtltssLzu7RXAqKy85XiMh16iXbwt9VvF2z9j2Z+reVEMx7L7Pr1t6XvjjNx0KQu+cePto
 G+TWUkgJsuSZF7Zo++gRU2XPLsMnHFnl8OwHssMDJRs1h1KlFIr6tA7LBf5l25wrpKnqUwgq3
 U1UdPsa3pHtoid99Yp9i8TYu9bXjED2Hw9uZAMewNLme7AuVALr+d73xzkyCepYbRqWdB3npB
 CiGZ3mR5ZnPSaxizQXrxlla1O9a/256SNNTmMcSyPaaSewEuIZ8UHwA606j10Gf3aMSrgY5rb
 zcakuhJwmVnkITBGzcmz9VdqJFZdBSooF1nKT4kcNRhiU+98HEPkOibgRBIxUwmzTB+7Hc5rU
 /TrLBRcTFSkXssQ+p3mZhl4Nz+t528tM6Re76X4dn8v8CFzG5oLQXTaRr/V4fAvI2en9Rrl1M
 9x36n/ofMwxTbAmtW722sDXYCjKi2kjcosanzuTBAVnUtKD0jnUKm0LvPwOMDBBY52Auwg+un
 MHaX2YqI/6y1+4JZ7zWauuesk0rwTr55OxVF8dA/GVKFBxazpGGVHaGmYfMTmH+UaytJKNCTP
 ++bHft9
Subject: [Buildroot] [PATCH v3 1/2] package/libgit2: link with -latomic if
 needed
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

libgit2 is currently a library without any reverse dependencies so the
missing atomic symbols do not cause build failures yet.

libgit2 uses the atomics intrinsics on gcc >= 4.7 and the sync
intrinsics on previous gcc versions.  Since gcc 4.9 is the new
minimum, ignore the sync intrinsics requirements.

The next version of libgit2 will also build a binary, which will
expose the problem.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---
v3: first series with this patch
---
 package/libgit2/libgit2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3f1e6e1593..9b5e2b897d 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -44,4 +44,9 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBGIT2_CONF_OPTS += \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
