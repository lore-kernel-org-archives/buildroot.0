Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891A1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB8B83E90;
	Wed, 27 Apr 2022 07:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UV_FdZCSqvh5; Wed, 27 Apr 2022 07:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D51483E85;
	Wed, 27 Apr 2022 07:28:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8841BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A86E83E54
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9pp7JwbQOaZ for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:28:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37E9B83E51
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:28:28 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M7sM0-1noZpo2SuY-004yEH; Wed, 27 Apr 2022 09:23:22 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 09:22:45 +0200
Message-Id: <20220427072245.3610-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OpR40rpjVMRTsKaMscMTiuXKFdhDiV81hcsdAfki2CRG0fy/Kn7
 vn+xtI2LgLdFU//jS1+OPycNajhNIAVcj1UEWyzNLzmfesezmPfUF5x2bt40IJXrMeKwDgE
 NP9Y9LYYwk9lveBUXyUkrKhXaemTJlcdBHQVDINLqgHaLikII8Fnv07T68CqIlpIxsemoxi
 lm7ynLixUusRQCeb+PrRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5XD4vFcUQek=:et/4mrJDmkpkIOPsmb7X2r
 eh94aSCKQGwCNJQX6J4xj4Bbe59en6typAtXU0LhLjtlWSOHvT1+3dZJ06/npKmkqs+zzbryN
 DbGoYjsxdxLCmsSIcDYSGN9tqdloo7OFH3jfchUQ4nJ0GCbG5NBy4bH1rfUMWI35IYWW3AEQg
 7JzH/0WvJ3F7u5AqEvIm4h9oD2PMNtuxyZ+4D4JlpQ4/3LUkc5yE57ibQk6zp6T9M8OePnt2G
 +lp3BbQAvexH1vKXtQteArF+EJetrpm92hWhHNlDnuy43c2vKjoGcgrU+VEVvwF0Ldve4QGK9
 sc/qzuF3X8DDC1/iUd6NMCdpf6RY5k1w5dRydmI3o+w3tTZn/VoNhDT6C98HdMyLnHPdW9jmb
 6wNSm4CeBvl/7uMG+j9euHCuG2d60EWvuHWana3r10OIW6OL5oTIUg/8w9qUqsuxHNfWm/K/P
 xtzOoQJHnJP74uLB3AZ0gV9mHg9V1uTiBu7kUHZSGTyY/GcOyWPLqP6Y2S/UUx5UE9QWoOGyZ
 YSl152YKcVRjPwd/kBrffmj7NjdmA60SHNx35BOeFb9/yAlcgTWw5jtbhy7rWFv9z3Au8EJr+
 YmOYNNhinwiwhbczyk64Hr+ITzhCCOeMLcAtrKBh5q8iQNh4Ru6CpVCS5OjpyXTmonSuE0RMb
 FkJ7NIAb50o7if2Pmv1GvxxiK2vid9fiXDBVDVty+Gm2dPsMJUm6LVpB2UT2HgaDH6JuYIrl3
 964ITzCn0hTU8ODBt3UHTVAG+ZxL/49KtlvzKA==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.4.3
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

git added restrictions on config files to fix CVE 2022-24765.  libgit2
adopted these changes for compatibility reasons, even if the vuln is
not exploitable in libgit2.

https://github.com/libgit2/libgit2/releases/tag/v1.4.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index ada411ea22..3b5837f789 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19  libgit2-1.4.2.tar.gz
+sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
 sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index e94dd9c370..3f1e6e1593 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.4.2
+LIBGIT2_VERSION = 1.4.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
