Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E857C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 14:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF95B82F31;
	Fri,  6 May 2022 14:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cbsb8_O2KJd; Fri,  6 May 2022 14:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAE3E82868;
	Fri,  6 May 2022 14:54:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF6F91BF29C
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 14:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DBCD410A5
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 14:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71JiHECp93OR for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 14:54:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7DA64109F
 for <buildroot@buildroot.org>; Fri,  6 May 2022 14:54:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t6so10380910wra.4
 for <buildroot@buildroot.org>; Fri, 06 May 2022 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SksJ+mh5n5Zezmb/V+ls8T5YOe3axmVHUytdI4TecIo=;
 b=CzvWnoIn/y56fNbVRtF2D8kIfqGzPwWFAEmSUK9p9F/xuu/7f9O2YSA62ooVuDprT6
 yJiQRNslWdo070oFedVrckJZG4gP0h6hHyCGne6e9/nflDVBqQXQCBPaL104aclnLq8B
 MyJzLqw+ExWpd/5nxndFJixvi3WvbOdaKkXZ2TA+niZpfOTRIAZRRWj/4iyi3mMPJ1pK
 ycUR7s9c4wFas1tBNCKP/dIj0MVhk4wqodDxK4PGw0ZGVVIi+1+hcfW/HFN3EZ2qCCbl
 DY0VPAhyjYSZB+DWfXubojXvpsSB3mnzBNoEDQGzoqqq1u0WwGKWZeMmFvPJo69C8YtB
 FTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SksJ+mh5n5Zezmb/V+ls8T5YOe3axmVHUytdI4TecIo=;
 b=k8lTmNjIXXjHxDws9zbSclqhObfNNrtscb35MLVzK6uf/rbwraieV2O8K/cGr4DwuB
 efTCbz93JT9aNIq7oYbEBllE7XY0zu4ivViPA5m/wf6IKtxRBPVwVTNkJTR+oBN5nkGH
 XG4ksdcbQiU0rjtEQpYA00UGNsHfV7fwP+xN0U/MpP4buVVgLzUrtWfVY7KDkzga+Ts6
 rg6EPnQmNoV2gYJR7wsA0P76SWWm0+PBcDiM1kbS8wyK3gnVZI5pqrnItI1XAKJJQZKl
 oVsyRUe4nIvmeAgleqNdI4OSSW6OiDa0nCmDRdFEM4nHOVBUnVIpFTp8Um6fRuVQ1vlJ
 t37A==
X-Gm-Message-State: AOAM533Xxxg/xNY7eCHnOAC+n0LpNtGQdevLGlWRpXcCIJoTqzSp9EDQ
 IPJ4GA8QVfuPK4KE8oz0hygQIPrBcuooaA==
X-Google-Smtp-Source: ABdhPJxRePWbgKtd3M+LkWD6FMVConigXCF86ymdVFKR0yGxn17aW51fj/msfGuV7r0vMIWe7T0cow==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr2937652wru.426.1651848865347; 
 Fri, 06 May 2022 07:54:25 -0700 (PDT)
Received: from git-linux.eu-west-2.compute.internal
 (ows-5-104-102-157.eu-west-2.compute.outscale.com. [5.104.102.157])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a7bc8c8000000b00394615cf468sm5522464wml.28.2022.05.06.07.54.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 May 2022 07:54:24 -0700 (PDT)
From: Remi Jouannet <remijouannet@gmail.com>
X-Google-Original-From: Remi Jouannet <remi.jouannet@outscale.com>
To: buildroot@buildroot.org
Date: Fri,  6 May 2022 14:54:23 +0000
Message-Id: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc udhcpc default script can handle staticroutes but it
 missing from ifupdown options
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
Cc: Remi Jouannet <remi.jouannet@outscale.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUsOpbWkgSm91YW5uZXQgPHJlbWkuam91YW5uZXRAb3V0c2NhbGUuY29t
PgotLS0KIHBhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
YnVzeWJveC9idXN5Ym94LmNvbmZpZyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZwpp
bmRleCA1MmNiOGZmLi5hNjE0NjYyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2J1c3lib3gvYnVzeWJv
eC5jb25maWcKKysrIGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3guY29uZmlnCkBAIC0xMDIyLDcg
KzEwMjIsNyBAQCBDT05GSUdfVURIQ1BfREVCVUc9MAogQ09ORklHX1VESENQQ19TTEFDS19GT1Jf
QlVHR1lfU0VSVkVSUz04MAogQ09ORklHX0ZFQVRVUkVfVURIQ1BfUkZDMzM5Nz15CiBDT05GSUdf
RkVBVFVSRV9VREhDUF84MDIxUT15Ci1DT05GSUdfSUZVUERPV05fVURIQ1BDX0NNRF9PUFRJT05T
PSItYiAtUiAtTyBzZWFyY2giCitDT05GSUdfSUZVUERPV05fVURIQ1BDX0NNRF9PUFRJT05TPSIt
YiAtUiAtTyBzZWFyY2ggLU8gc3RhdGljcm91dGVzIgogCiAjCiAjIFByaW50IFV0aWxpdGllcwot
LSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
