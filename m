Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDEC606A330
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GWr2GaAR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Al9XxJgD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA054082E;
	Tue, 10 Nov 2026 11:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddg8JXuoMUVn; Tue, 10 Nov 2026 11:39:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6979F40813
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794310754;
	b=fSj4FvNM6X5wUglvVHl7QIKY+Tha1z8/TjYeoYSl8juCvDVGUTMpETmrG3SlI6YcdBr0
	 noHqiAgqpQ1fKzbiypV5Rfph1PI6TEjdmkJPB1z1VqJCeb2MYAfok7ePBCqvsxPgVikfr
	 fUw5R+83HVKxrnRcbp6QSk1KLguqYvQsCHe2ijvwaPfibjDVutXkZOr7AzTOfp9THWCUS
	 chv1yz9Da/Cqo/FGVaGqnzxH208OJ4HRs9y0i0TkpulahTkepuLyb21PSU8MSa9+bcCsY
	 nmU0HdSPDeEcxCAqM7UQqnjb70k3ulK3PVM19oy7NmETzaGi6+vssLZHsQ4DGslRrmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794310754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MD7Z3TtT9QC7aBmYOn3s7we2mF11U1AMibSXODic3J8=;
	b=SX5Gjkism+kAy/34s+ajy/sK20+RLlyMPfZ2Zf7kU4N+s/OjqqxIZuSkCK4Cvc1QCg2y
	 /W3Fg8lM110t2w8A2OJVi3R0wamiCEuDT+kX6ZeMQx9hNyyptDHNGJStKYcbXf8l3qjmm
	 1TtmfU0gQrK4LQlPmdhnDnHkVyRxl/U6UkKDq+AwZ91WObEZGCW68dl7PoCHUB1lHyLJA
	 L7QRPFthIug3UlgnWwxfdb6G0KeOkRMiJDURkCHon4wQkS47m66LOAT8SKMcymo9hXK42
	 rT5YHzSbiO6bKz80uuI56N7oQE0UB/wmzQ77QZl4H5/rDScf+eY6EF52gYs/D12FbmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794310754;
	bh=MD7Z3TtT9QC7aBmYOn3s7we2mF11U1AMibSXODic3J8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GWr2GaARWpM4euLwRIpwON7bAYcfgJE3OYDiTLjLyCiFWwuHf1Uovnear356Bw3fi
	 Xa18kYrhTUmiS0smKDRZdHyDvo6kFB079005giEOLs7FcrlWqOyhqFZNqxmf7U6ako
	 zwHzN3Zo+cPQxDC9baAEuxNFbwk1Ndmf5tJkb1Bn6LM/LpPAS8xOJjz5gnGpAhOWWm
	 IdQEXMcgiqTiGfOmhxGqy9EhyT9M48sv8tC0QJEWQH2+GTjTxH9BdQ+6KfaIOvQ9uE
	 H54XB0KtN0eiS4QfiR9CdLTxLNYylUF4bA3W3+bL6bkffsjqwyCHHZ2ZuFi1USF66v
	 YxyD3xgb3bH2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6979F40813;
	Tue, 10 Nov 2026 11:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 461B9CC4
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEB94032F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqlfx6Awf9kX for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 11:39:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 07EC64008A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Al9XxJgD
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07EC64008A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:39:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6a642495d81so2928780a12.2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794310748; x=1794915548; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HCBirm8yMNpEV/tPN50HKG//XHGk3wOzfvOvLep/5dA=;
 b=Al9XxJgD9ZFnTm/mjiv821KOABMestPePqS6dYk0tv6tgc0x/pHGoNcGk3zzLgdO8m
 UKC4H50z5qH+Puc+H3P3NbajVh+tC/UXwJd1LjXM4wC6DTwtDCZAj+92w2tS6frmCiCk
 o69bN7YBiqioS+9+orE8lgh1pwmu81adiRdvun+IE1zm0DmZ0Eq8cLw0fgeczRZ0Na7M
 6M8YcCNyJeYjMQKfVDcF8SaYHd2PUUIIvszl6pAsrLH8E3Gz2LNLuEff2gQmLxusqPmd
 CclD5/9Hy2g5emc4Nl02wX+rW/qIuqXmkbhZBxjlSyKHw6tuADRROq4PmeCKIyQ7zWIf
 087g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794310748; x=1794915548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HCBirm8yMNpEV/tPN50HKG//XHGk3wOzfvOvLep/5dA=;
 b=p2BF5gUL9fHU9HHs3wH1HUEe7TPuPBwSSoT7Xlf/NoQe5lvT5WSxaabQ0NGi2/5kMv
 476rBqEKQrUNESfxc1oDyK4WgVe8vOjPp7rnxFWzOZTlEhkOEHiIIppW/8kGLRDP2ANP
 +t9jrLjhPkRTq60j2ixe/OtoTyKRq8nY/3PqpSNidJdFVpNXZFhaSjqc6+EaKXRksJho
 GEdV4UNAsHBBYpDFaTyt5EV1HakNcb9fHJGHgkGs3oWAbwmWBpugPVGjxZeiJPHNJvUq
 CqT3yq6Ki+Fd5jogj3gL3VXXb/h5VaPmEy6Pf3fd7fFk80IJhE9L1Q3OYnmJ5UgHOkoj
 8z5Q==
X-Gm-Message-State: APuU4Z/KGGXzt9ulLHFPQjd3UfzhwCxehzJhkfFYo/zF0iqjmEOvR6O/
 dQLhXnvrWrZykIBqfe88RPrkUCLnuhpkSzyO7aLBRj+qKPhqjjLQ4ZF5AH/xSA==
X-Gm-Gg: AYBFou0+vu3fQhp5wccSMzvsTWlSXb1kqXfMLTeF5VAlZn1t1Qu8c6DC2UhHqXHS+KR
 TnCk1IMr+TaO8+vQKnVUxRA5YegXv2r2bkLT0c1uXn9IaxqZPw+4bUYMyNeD9rbyiSDRDLxfKvU
 H/I5dyGhTMnU6za5AgDd1KSaq5do8a12TceSfcalL8LTSPdw4SShtD5IcbelhELSyxDVvA1wcw+
 b8r78UPYtq/MVoU7L1fo1ApGUbxGmNpbTzKpUQkqUtxHGdDpGjkA+o6w0mNTZdBhYVQX/AQjMVZ
 Wx2ixVu63wRN/Oj6fsyJANZlQWOyrNWYEEpP11wDeVsxBSXcz4KPf2MXjhtj1ejCYy/vo1ykBNI
 H/l8tjyP7Ojj/flkhEfqNXmCydkaNmMzCuaMCja/9FoNriOg0duxjqM2K0oBGcUMRNtXOMoTzil
 uzoQtc7bIYwk9vno41oTxYkM9dzmCVlv8ISQKz5ISw1QT2LprlFTA0wP5O/82nQ5hi1vbdwb1Pk
 vq87HgNrtHuOvch5oBc0B3/rXK1Mh1gRjbyx50pPvTrtOhUhjnaTdyY9z+vgv0JV4LAOP+0/qXP
 u6qu+UUBQ7GQRTANBanG155kGiw2nY+KS+ON020rht+UH0JbJPbtPPIGmEPmvefeGPyAVC73Wpy
 Dy+VKuQrF98mb/cSZVH7ZJkjQyFTKfJ4=
X-Received: by 2002:a05:6402:1eca:b0:6b5:76be:62e0 with SMTP id
 4fb4d7f45d1cf-6b756b064c7mr2062405a12.35.1794310748363; 
 Tue, 10 Nov 2026 03:39:08 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7578ece26sm992865a12.24.2026.11.10.03.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 03:39:07 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 12:39:06 +0100
Message-Id: <20261110113906.1970390-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/virglrenderer: fix i915 backend build
 on 32-bit platforms
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the Intel (i915) DRM backend is enabled, the build fails on 32-bit
platforms:

  ../src/drm/i915/i915_ccmd.c:267:63: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    267 |          struct drm_i915_gem_memory_class_instance *classes = (void*)mem_regions->regions;
        |                                                               ^

drm_i915_gem_create_ext_memory_regions::regions is a __u64, which cannot
be cast directly to a 32-bit pointer. Backport the upstream fix, which
casts through uintptr_t first.

This issue has been present since commit 76d4a9b297eb
("package/virglrenderer: new package"), which added the package with
the i915 backend. It therefore affects 2026.08 and later.

Fixes:
https://autobuild.buildroot.org/results/72c81920e6d1fbc36de8930f4ad2f70f88c4cf29

Fixes: 76d4a9b297ebd4ed15000bce62873049b9e75f5a ("package/virglrenderer: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...m-i915-fix-build-on-32-bit-platforms.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/virglrenderer/0002-drm-i915-fix-build-on-32-bit-platforms.patch

diff --git a/package/virglrenderer/0002-drm-i915-fix-build-on-32-bit-platforms.patch b/package/virglrenderer/0002-drm-i915-fix-build-on-32-bit-platforms.patch
new file mode 100644
index 0000000000..69039d329b
--- /dev/null
+++ b/package/virglrenderer/0002-drm-i915-fix-build-on-32-bit-platforms.patch
@@ -0,0 +1,43 @@
+From 8d6123bb9e3b1959077bc3792a9163f85c78d0d4 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 7 Nov 2026 09:33:13 +0100
+Subject: [PATCH] drm/i915: fix build on 32-bit platforms
+
+drm_i915_gem_create_ext_memory_regions::regions is a __u64. Casting it
+directly to a pointer fails on 32-bit platforms, where pointers are
+only 32 bits wide:
+
+  ../src/drm/i915/i915_ccmd.c:267:63: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
+    267 |          struct drm_i915_gem_memory_class_instance *classes = (void*)mem_regions->regions;
+        |                                                               ^
+
+Cast through uintptr_t first. The value was assigned from a uintptr_t
+just above, so no information is lost.
+
+Seen in Buildroot's autobuilder:
+
+https://autobuild.buildroot.org/results/72c81920e6d1fbc36de8930f4ad2f70f88c4cf29
+
+Upstream: https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/8d6123bb9e3b1959077bc3792a9163f85c78d0d4
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1712>
+---
+ src/drm/i915/i915_ccmd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drm/i915/i915_ccmd.c b/src/drm/i915/i915_ccmd.c
+index 2db97ed15..cc07e2802 100644
+--- a/src/drm/i915/i915_ccmd.c
++++ b/src/drm/i915/i915_ccmd.c
+@@ -276,7 +276,7 @@ i915_ccmd_gem_create_ext(struct drm_context *dctx, struct vdrm_ccmd_req *hdr)
+          if (ext_size < 0)
+             break;
+ 
+-         struct drm_i915_gem_memory_class_instance *classes = (void*)mem_regions->regions;
++         struct drm_i915_gem_memory_class_instance *classes = (void *)(uintptr_t)mem_regions->regions;
+ 
+          for (unsigned i = 0; i < mem_regions->num_regions; i++) {
+             struct drm_i915_gem_memory_class_instance *class = classes + i;
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
