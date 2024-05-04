Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACF1C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC0A41572;
	Sat,  4 May 2024 21:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYYMA_iCRi6h; Sat,  4 May 2024 21:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041F341EFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041F341EFF;
	Sat,  4 May 2024 21:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 197511BF86B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 834214157E
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpp-Kkofs63m for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54E3141589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E3141589
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54E3141589
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso5851675e9.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858834; x=1715463634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DsElacefWw9CaqZVOKjqR0mJ1a/9TQmrHCvYDhy2avA=;
 b=QuKurPNLfoLyAa7pXmOgb4rGi+953dixyhhW6bKbDww0pm8RahbvKpI+jCuJ2pDzal
 8solUaVl23EZKdU9HcvYEwhhL5TneN+OoM2HRz0SF8GAaaq0pGna2oSHn/5v/rE4B1GM
 amRZs/IE/ucqwo0TgPiDDJuxHGdV4i00m3zuAJuzxdIBzH9dFUVPkwE56rcql3BvYI58
 YCn6iTe6XYOJjQzD45mrRwKQxYtol9lxi1VAA3LwPyKzV9462gBBWGlEcXtFZXFbL8rB
 PiTzhRyCWciSWzmPhj1lcd81zpJK3o9wH7qEJRukp0ByuhWZWx3qluGqKUG9KHRiQlRR
 YRKw==
X-Gm-Message-State: AOJu0YyiM6xwfWaO2sYe4Lw+ctZoWhI/iO0HP1CKN8qBlgNDKTShz3Ch
 cneOsJBtOHJe8nx3mSb+A1p1KdbE4Doqh/eg3Qf3Gpe6BCxS0deNxcdwzw==
X-Google-Smtp-Source: AGHT+IHUEOkesOq7JPj0+iEpQGXyXI/HJFgLS7edwBuxqIkdca0j/on2kBcH44SSM/OrprEmnTEb+Q==
X-Received: by 2002:a05:600c:314f:b0:416:88f9:f5ea with SMTP id
 h15-20020a05600c314f00b0041688f9f5eamr4865644wmo.34.1714858834043; 
 Sat, 04 May 2024 14:40:34 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:16 +0200
Message-ID: <fdddad2c86c88067062b137c2d2386e1be523428.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858834; x=1715463634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsElacefWw9CaqZVOKjqR0mJ1a/9TQmrHCvYDhy2avA=;
 b=OT/aXrwiUcFfMLVOhLWkVEM/D8MBfhx5SkfGJ16yYeXhvewpgLlToAUvou24tva1IM
 MHPziewOUlUglNeU3YP86WaVX3Qa+9Pd2U9H98B+zLJaps1/QMfDWPSady/BYvpNA3Pw
 xkG3nG/o/uJlLvpEA7V54FQJ+Ir2OBDnX5NEv+1V/eiCk/Imq/BKABiOkNJ7ekeN4TDD
 m8iKy/SrH9vxogtcgvJqvB6pupaCD8EIO2aJntrHdcummUtnZxHC4phZJ6umTyJANKX0
 wICdXikWnWcUhFAs7YBrKe5O8bEtUhFoUK18EVZt3TWqEQv1pCz7JRA18uXQbGWWbiBA
 YHDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OT/aXrwi
Subject: [Buildroot] [PATCH 15/22 v3] docs/manual: document new archive
 version suffix
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: add sed scripts for hash file update]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 56 ++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index a6385260a6..5a09c852c7 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -127,9 +127,53 @@ that such patches will most probably not be accepted.
 [[migrating-git-attributes]]
 === Migrating to 2024.05
 
-The git download backend now properly expands the `export-subst`
-https://git-scm.com/docs/gitattributes[git attribute] when generating
-archives. Because of this, the archive version suffix has been updated,
-to +-br2+, so the hash files must be updated accordingly. Since
-`export-subst` is usually not used, the hash itself usually doesn't change,
-so the update can be done with `sed -r -i e 's/-br1/-br2/'`.
+The download backends have been extended in various ways.
+
+* All locally generated tarballs are even more reproducible. Before
+  2024.05, it was possible that the access mode of files in the archives
+  were not consistent when the download directory has specific ACLs (e.g.
+  with the +default+ ACL set). This impacts the archives generated for
+  git and subversion repositories, as well as those for vendored cargo
+  and go packages.
+* The git download backend now properly expands the `export-subst`
+  https://git-scm.com/docs/gitattributes[git attribute] when generating
+  archives.
+
+To accomodate those changes, the archive suffix has been updated or
+added:
+
+* for git: +-git3+
+* for subversion: +-svn4+
+* for cargo (rust) packages: +-cargo1+
+* for go packages: +-go1+
+
+Note that, if two such prefixes would apply to a generated archive, like
+for a cargo package downloaded from git, both suffixes need to be added,
+first the one for the download mechanism, then the one for the vendoring,
+e.g.: +libfoo-1.2.3-git3-cargo1.tar.gz+.
+
+Because of this, the hash file of any custom packages or custom versions
+for kernel and bootloaders must be updated. In most cases, the hash itself
+will not have changed. In that case, the following sed scripts can automate
+the rename in the hash file (assuming such files are kept under git).
+
+----
+# For git and svn packages, which originally had -br2 resp. -br3 suffix
+sed -r -i -e 's/-br2/-git3/; s/-br3/-svn4/' $(
+    git grep -l -E -- '-br2|-br3' -- '*.hash'
+)
+
+# For go packages, which originally had no suffix
+sed -r -i -e 's/(\.tar\.gz)$/-go1\1/' $(
+    git grep -l -E '\$\(eval \$\((host-)?golang-package\)\)' -- '*.mk' \
+    |sed -r -e 's/\.mk$/.hash/' \
+    |sort -u
+)
+
+# For cargo packages, which originally had no suffix
+sed -r -i -e 's/(\.tar\.gz)$/-cargo1\1/' $(
+    git grep -l -E '\$\(eval \$\((host-)?cargo-package\)\)' -- '*.mk' \
+    |sed -r -e 's/\.mk$/.hash/' \
+    |sort -u
+)
+----
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
