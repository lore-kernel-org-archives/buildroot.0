Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3973AC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF91041568;
	Sat,  4 May 2024 21:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRihGh_B_spc; Sat,  4 May 2024 21:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991B841F56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991B841F56;
	Sat,  4 May 2024 21:41:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9811BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CE44082E
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RP-rIyC9hAo for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FD7F4155E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD7F4155E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FD7F4155E
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41c7ac71996so6602885e9.3
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858837; x=1715463637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i5QKz/cP8z3PQKu+lBa1tF6KywyAmKqKxXjDbuPv/F4=;
 b=myeVu7cB5h2OrmFHscRW9QIxR7l06r/qL2mFD6IVXCx4dC4aJsVuValAHRdSHfrROi
 OQGfHYXMAtVA7YiqPvab7DacVmOnpFwgOt6FvyWnUTne5t4Xpcr4Qi9ZokluaTvHvUpF
 QjETFPzqDQC9V8SEdS4qkZDhBkk2bfFj9axPnsYV+k8dNoMeQg9h1/xIHNUt1Ub+S90P
 9K9OQF3YWZWMwqVXfEpELhv5+UgT3BLk9Xj+yxhnkT86EJUJV0zh1zj4Gv3xooLeikWp
 0/T6UMLMspsK7aqxD4qsgXdkRa/kgYGa/GSQTyK+z4Y7NZuwkMQun3m/wWUy9f48cxaE
 g9yg==
X-Gm-Message-State: AOJu0YwbQc4I/zBm5K/fbYr5tAwzIJFNgCHSLrB2CRtZF/ss3JGfwDPv
 7cFBtRgXVxBk6j9He0588IDeFwUTddRfifVVjXVsaQ6J6YqAUp+HTSuDIQ==
X-Google-Smtp-Source: AGHT+IH9RpARihOJqo/9cXymzkpN9Zvpky/hMkgpoYhVXDh2SvraRkhzsuVYOOs2j8OD1m9/1IN6Ow==
X-Received: by 2002:a05:600c:3541:b0:41a:9a6a:41e1 with SMTP id
 i1-20020a05600c354100b0041a9a6a41e1mr4874678wmq.29.1714858837169; 
 Sat, 04 May 2024 14:40:37 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:36 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:22 +0200
Message-ID: <14348f068242aa4697bdbdd571c305bea99131f7.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858837; x=1715463637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5QKz/cP8z3PQKu+lBa1tF6KywyAmKqKxXjDbuPv/F4=;
 b=c5FqEffcuYuMs9zFSIgVov0LXPyzNtMvUEjhOadD5BFXuiICv4jyZLFRHKI42WxyXS
 ndeSP9YJVOm/wEtO/V30vNhel5rjScugyPbuzv7T49BZYGC+v1+sHb7+QP9Gcv+nNmbC
 DKEv1nMYrhg0V1uELomRkpVC66gaSQMAmiPsiBePWduWB4DsL4rbbDjGmAwEozdXnFzK
 WPwD9x70878ErQwpGZCKGP1ZDVZ4eyErWnYcsqHbS0oIzjQJhqDp7B10i1bR1IA6BOwu
 OVZJtpaFOZ0nXJnZYh7awb1eIFkoqars8ueCDvV9NrOA5E3Fzb0c5NZh+Hpx0C24N35W
 lmYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c5FqEffc
Subject: [Buildroot] [PATCH 21/22 v3] docs/manual: update archives version
 suffixes
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

Since tar *will* generate different archives, virtually all hashes will
change, so drop the blurb that states they usually would not.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.adoc | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 5a09c852c7..379d13c51b 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -138,40 +138,44 @@ The download backends have been extended in various ways.
 * The git download backend now properly expands the `export-subst`
   https://git-scm.com/docs/gitattributes[git attribute] when generating
   archives.
+* A newer +tar+ version, _1.35_, is required to generate the archives.
+  For compatibility reasons, +tar+ 1.35 changes the way it stores some
+  fields (`devmajor` and `devminor`), which has an impact in the metadata
+  stored in the archives (but the content of files is not affected).
 
 To accomodate those changes, the archive suffix has been updated or
 added:
 
-* for git: +-git3+
-* for subversion: +-svn4+
-* for cargo (rust) packages: +-cargo1+
-* for go packages: +-go1+
+* for git: +-git4+
+* for subversion: +-svn5+
+* for cargo (rust) packages: +-cargo2+
+* for go packages: +-go2+
 
 Note that, if two such prefixes would apply to a generated archive, like
 for a cargo package downloaded from git, both suffixes need to be added,
 first the one for the download mechanism, then the one for the vendoring,
-e.g.: +libfoo-1.2.3-git3-cargo1.tar.gz+.
+e.g.: +libfoo-1.2.3-git4-cargo2.tar.gz+.
 
 Because of this, the hash file of any custom packages or custom versions
-for kernel and bootloaders must be updated. In most cases, the hash itself
-will not have changed. In that case, the following sed scripts can automate
-the rename in the hash file (assuming such files are kept under git).
+for kernel and bootloaders must be updated. The following sed scripts can
+automate the rename in the hash file (assuming such files are kept under
+git):
 
 ----
 # For git and svn packages, which originally had -br2 resp. -br3 suffix
-sed -r -i -e 's/-br2/-git3/; s/-br3/-svn4/' $(
+sed -r -i -e 's/-br2/-git4/; s/-br3/-svn5/' $(
     git grep -l -E -- '-br2|-br3' -- '*.hash'
 )
 
 # For go packages, which originally had no suffix
-sed -r -i -e 's/(\.tar\.gz)$/-go1\1/' $(
+sed -r -i -e 's/(\.tar\.gz)$/-go2\1/' $(
     git grep -l -E '\$\(eval \$\((host-)?golang-package\)\)' -- '*.mk' \
     |sed -r -e 's/\.mk$/.hash/' \
     |sort -u
 )
 
 # For cargo packages, which originally had no suffix
-sed -r -i -e 's/(\.tar\.gz)$/-cargo1\1/' $(
+sed -r -i -e 's/(\.tar\.gz)$/-cargo2\1/' $(
     git grep -l -E '\$\(eval \$\((host-)?cargo-package\)\)' -- '*.mk' \
     |sed -r -e 's/\.mk$/.hash/' \
     |sort -u
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
