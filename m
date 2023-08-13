Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE214C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 04:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511404054E;
	Sun, 13 Aug 2023 04:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511404054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSgWTVwN_vHv; Sun, 13 Aug 2023 04:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F0E40600;
	Sun, 13 Aug 2023 04:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F0E40600
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7ED61BF21A
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 04:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFA981842
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 04:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEFA981842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IF-dH2uie2Uu for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 04:59:20 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A2C81839
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 04:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A2C81839
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a43cbb432aso2731155b6e.3
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691902759; x=1692507559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rbbg+ZQ3DH11FbTx5BGh3MEEgE8jFqeBIeY0ko1eCdw=;
 b=XiLdaGMtbQaqhlwK5kfdvVML0lqRNkVNleCCSvKKUGuPdVS8C5LfZ8M4cSLQhEJ3tG
 UIZAM3yFlPscVvfNLMGc+U/Uqmti5AJ0V72LQCmoRksEimgPLnmX1+NiYlg3r5/zvZS+
 3/kcXYXu04zlcRNvEMjw4onk2hHQdOiA4R528Zl9nWYdA1z+Iv60vmBMWq8kDxJAkUvr
 B8SO3zyt8fHxBVnKyPelvOA7W9jyZ+oJ2pnw+IwEsSE/Jq5jPBLc/6GZ70jzHjV+T0GU
 PNCNvD3UULVdU3ZiMJx+YuMj4uQj7asTNspzhD7SHeZuX+ckmBroUAe2m12XQwOhTyic
 lEXg==
X-Gm-Message-State: AOJu0YxRYGR8OuiC6GaTDGfxvkDOEiEqGvXg+x6Bp2qWe+UpmCmbUdHx
 hv9Lf9KWxm1i+6hbtg+SL5/kGI7vVHw=
X-Google-Smtp-Source: AGHT+IHke4dgT6HoPWIXWNBvC0zC0GovpjpMErA024WhXFy1M6PGIOT4Tgl8ByLzUAHt+iA88+In8w==
X-Received: by 2002:a05:6808:234c:b0:3a4:39e5:5c69 with SMTP id
 ef12-20020a056808234c00b003a439e55c69mr6262445oib.53.1691902758753; 
 Sat, 12 Aug 2023 21:59:18 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0568080bc800b003a75593746asm3326127oik.57.2023.08.12.21.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Aug 2023 21:59:18 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:59:12 -0500
Message-Id: <20230813045912.10404-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691902759; x=1692507559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rbbg+ZQ3DH11FbTx5BGh3MEEgE8jFqeBIeY0ko1eCdw=;
 b=gQuaJR5ho89OVdqmCo1G/KwVMZkgW74DEFc6KqAtdSJTEWgkjlyZe5rIZ3rAaBWbbV
 cLUNFccfSHNeg0X1cgSH1K98ozMzVdS3JOTkCS7AaixIy8LLReg/glRvFwOQrm2JWoji
 PXeoAXzTUku6Nn2EcBr1/+nrB5yu4Dwbt6DSElCFGjKxFFvQ6IcXEfWFq4G9g+U0J0sq
 7lvKegoeVywoN/XGZODLQLWaPKEsksAt0LXTRGd3syNMRUv/ABzz4Um3G+Wb/8yXqSp4
 4guX/7Vfy5kPlIQB93YKt3fkZB6zdLrY/5Ij3E4sHkTSquzDLnQKS0+f74w1I1tNr9wo
 0R9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gQuaJR5h
Subject: [Buildroot] [PATCH 1/1] support/scripts/gen-bootlin-toolchains:
 generate BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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
Cc: Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously, gen-bootlin-toolchains did not add a `depends` guard to
limit the available toolchains based on the minimum required GCC version
for the user selected CPU tuning.

Now, the proper BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard will be added based
on the version of GCC provided by the toolchain.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 support/scripts/gen-bootlin-toolchains | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 23ebfbdce9..4344221213 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -338,6 +338,8 @@ class Toolchain:
                 m = re.match("^BR2_TOOLCHAIN_EXTERNAL_GCC_([0-9_]*)=y$", frag)
                 assert m, "Cannot get gcc version for toolchain %s" % self.fname_prefix
                 selects.append("BR2_TOOLCHAIN_GCC_AT_LEAST_%s" % m[1])
+                # respect the GCC requirement for the selected CPU/arch tuning
+                depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
 
             # kernel headers version
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
