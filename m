Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18901CD4F30
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70DE8120B;
	Wed,  4 Sep 2024 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ9FbYvbTSJn; Wed,  4 Sep 2024 20:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AEEE8120C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AEEE8120C;
	Wed,  4 Sep 2024 20:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1101BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 484FE8120C
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeYZSDWDqQuG for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 20:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1387E8120B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1387E8120B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1387E8120B
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 20:53:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42bbbff40bbso49277715e9.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 13:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725483236; x=1726088036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Vmvzrflm6DSZn10l8gi7Sg1bxPukv3M52TalfurfTg=;
 b=tEXb9Drlzw4Q3qIv+rCVwF5h1pYjOoFJIJaVUEPXDkKT3nx5O5RF1iUHyk5brxW4tH
 j3+NcABWLnK+PEd/Ep6VZdZUDs16AhQQXI2IwyHYmhFtiC3ZNMzdbSk2rrBiJ4oJqqIB
 7JfmvOvo0MkArPmyZ/I4KMdCypFqCnl/uYmJymGuOMIhP2v8vhH7cE3VFDgLyGcC7ctA
 ZGelV7juyXTeF/jkyQK+s1nX6Hk7bYUI6zjxVK3n56Z+b9sSD5C2Rt64wH8DqA55DiWX
 gObs1gB6VmaG7/Hg81L3D7IAZARWScxbh9qRbvNObLcwwSeNNPjv7DzsUTMDqHNI3rC/
 MLkg==
X-Gm-Message-State: AOJu0Yzk68r2no+J9+nFct0i/x8x8i6J9OBgNIxzEh1P2gz8rtNsSYlt
 OuNewu3W1SMPQuTVwUyXYemW1EVGwlIf2wJUDu/6F59heYQln69OmgEleQ==
X-Google-Smtp-Source: AGHT+IGMvlBtmmIYmvTrxig4AEhypvrDSjynBUxY5flJTyW+L9psEJzDok+0mOjROn9UOd+yVlfbSg==
X-Received: by 2002:a05:600c:34c3:b0:426:5fe1:ec7a with SMTP id
 5b1f17b1804b1-42bbb440201mr125338185e9.31.1725483235371; 
 Wed, 04 Sep 2024 13:53:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bba3f2875sm195137695e9.41.2024.09.04.13.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 13:53:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 22:53:54 +0200
Message-ID: <20240904205354.504964-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725483236; x=1726088036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1Vmvzrflm6DSZn10l8gi7Sg1bxPukv3M52TalfurfTg=;
 b=e7uNge76rTMCbxtlb4IlEoKpjMiF5zoP6K30/ltsCN5iw22thFjoXjcccv1J9aSpdg
 ZHi5e376a+CdrNlVZ99MOdxH/nPwVIfdvbJCwamUasJb53xGsMkQNosbIhD2OT3mQGon
 KdirCUVjTxxSVaHSKnRZ52Ii0efmRl9dfUDWkHVk5d8UFoPXul70ivGzQ6CGcjHzuxfw
 koBILYmkD4YP6AfW+yKksJeuoQ8lNleVaaW/P2sKcDTwYCDvo/cE/BszrcWGeh3t21X3
 QromuWBIX3hf2UBn9tdWAUwz6EcL2VuePqMbu5gXSoJQfCRVTWh+pBxCiRzdtAvXBJbA
 KgTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e7uNge76
Subject: [Buildroot] [PATCH v3] docs/manual: use space-separated list for
 BR2_EXTERNAL
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <Brandon.Maier@collins.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Specifying a list of br2-external trees is poorly documented, and the
only example uses a colon to separate the br2-external paths.

Adding the support for colon-separated list is the biggest mistake that
was made when introducing support for multiple br2-external [0]. Indeed,
both space and colon can be used to separate entries in the list, and it
is also possible to mix the two. However, internally, the list is stored
as a space-separated list, and all the code will split on spaces.

So, using colons is odd.

Change the documentation to only mention using a space-separated list.

Of course, for backward compatibility, we keep the code as-is to accept
a colon-separated list, but we just do not advertise it.

[0] in 20cd49738781 core: add support for multiple br2-external trees

Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Note: support/scripts/br2-external has shellcheck issues; this commit
does not try to address those on purpose, as it only adds a comment.

---
Changes v2 -> v3:
  - add comment in support/scripts/br2-external  (Fiona)

Changes v1 -> v2:
  - fix typoes
---
 docs/manual/customize-outside-br.adoc | 5 +++--
 support/scripts/br2-external          | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 5e653f1603..081d302e42 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 ----
 
-We can also use multiple br2-external trees:
+We can also use multiple br2-external trees, by specifying a space-separated
+list of paths to use:
 
 ----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
 ----
 
 Or disable the usage of any br2-external tree:
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 8aea479d20..5659761153 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,6 +34,9 @@ main() {
     trap "error 'unexpected error while generating ${ofile}\n'" ERR
 
     mkdir -p "${outputdir}"
+    # Historically, BR2_EXTERNAL could also be colon-separated, so for
+    # backward compatibility, keep slitting on colons (in addition to
+    # spaces).
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
