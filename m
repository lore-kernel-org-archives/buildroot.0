Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB97C88E75
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 14:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFB480841;
	Mon, 14 Sep 2026 14:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTdbVUdvoHym; Mon, 14 Sep 2026 14:14:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C3CF8086E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789395295;
	b=KEHdqYwuj0OT3/7GVL479blwsvFvpLeousR7i3/xKsGFRX+fMiZ8khPCI+GV2GQ3x3fb
	 co0jHFylXQxU+t08pQ3H6IGrZ8DvGrQznlacF4uhxaPj/WiHF3OzWW8L1ZMNid1Y34q/r
	 iAxIGZ4kqV3L01E4MeZ2piA7kJz8KeFBzG2yjGdC6JfAS1we7XWQRmxtyvIZyVYlao+1u
	 UuHcmxBTh+qCJyswnzDksy7wc0RB0TuQl+rwFT2Bvoz33X275BevqcZbYAnh/YE5Mty91
	 cNCvBqvZdQwTe9GUwYc4fNuu+TLUcKgouL94YF1t6GUDnJg7XbB7u3cvcndWAdpwcgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789395295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3u0VTF12Vuv/pgnVlPrCr41CcMMsro76ujbZIGAJnO4=;
	b=ALDU73CHnLvy1Yjk31t6AJfJgOtbMb9N7Pp1OpoEAESTTlkGVtm43+9uO+7gVIh4bPpq
	 foJORCVlCW7Oc+kUMzYwEt+jEDTh24oy+hNCXsnbTeGHX0g/6AfMDT9Z8OFkKbKUcybkh
	 e/fbzIHj+UIPQmkEU6AidNYD0tntC2iF3k5wL7+VHkfA+vjyyg+BfopKy53dXAKmS8hLd
	 lBSkjmhTOHrclQi6+9dqNtORhSrwo1VJ2Hmyg2GZVtidIzrjfCptojYscU2PdSDynbj0T
	 3VErl51p3qyheKh5EGuIkZr8boQtWzswkRMG5aJfgp6kpfVshvV12mayZafcJA096BQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789395295;
	bh=3u0VTF12Vuv/pgnVlPrCr41CcMMsro76ujbZIGAJnO4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jW9kdvRuqOJ2Xf/69gOjPgrxUldIuy5KUiu27ZFFG08Ue9MRYTwwUwSduPGtkc5WO
	 BzUwHBTRYR/sUzP3VZXd524Y3eK82lISma8Z8FniIvHJDJeGz2JbmHW9P7Lep5bzHL
	 71noornAmu7aJLVBpRVD/p7k+LvDGsQCKOkw1bjZ+XB7h1tyW+xZuy3sN+wp6QjyvZ
	 uWw+8viXwvlONup4DOGVw17l0SsPF5y9S46JzbZn/Z5GDv+wxTSEr5PS/UwPcBJXAS
	 YkBdxaj1Gmvt9w7B90g1ALASX+3ctRInhMV33cx85QOh0C7FzX4uUgALJYn+WRjfyc
	 thFUj8+KmnfLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3CF8086E;
	Mon, 14 Sep 2026 14:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1CA29B
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68901606E0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ggXH4pibLmM for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 14:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16132606CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789395292;
 b=bLpfqQqQ7l6saXVWFOCMhMFJ4d+6EQr2elv5D+9zQlPrnMjwqqCOeE+F4/dhrYUtaJns
 TcqATQ1F3DtlbdJNiHR6U3uFkJGIyat1bVOc5vqgbZBccZPn+NXm3L/+tq7BUXEJ7x3/L
 LZdZ3ea852Fc+M1XQiNL9ZTAUVvm1rWDmwOHd6FxLwxVkfraB57uN57urZSCZGThy4vOr
 9cl8Aj8UJ+hQ0uvwHOrnwCWV6A9xAy8bh2iVNolqLaEiCOfbnOqN26E3wqed6W83HYZRm
 2+66szBl7/IHiIGMmFJJx3FTaCAqoQ3EhgEQtTSC9WLEQ5LfE+Gu9myPZlIJ/Seu0LA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789395292;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=l5VsKiZa8A44X+TSiay4UTOU6FQFbM5HrKq5IlaOkL4=;
 b=iS03Ti2kxjN0UMtUfomDZ1xMVjJ6bQyh6GvxkvCSRNy05sFmSgLDSY/LnicMYTP/FChj
 DbMeGa0RWxdNhyzhBJ2voPPebdhqB8ZgZASfx/NFB/yyua39KGwdagqsGe9NDwUhMrGL2
 JirPOCcd17ktYHr87mx8MGdrg84LmTGEmEh9AFReBpMpTCI6XS4gI19BXfZ4x5vYrwIzv
 xgG8MyF4O4Qnb9DqLFdkf7dJCBSLa3AXzs3aX/FkDV6L7ZM851yQNgL92xOkOwnyGWXlR
 DLlk6bHPb7jQe2h5yhv5yZ5mLT/QaJ+FLqvgN0tsqYqKSUp89zzW1mwHUdrYAS/Q5qA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c8lyvY2v; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16132606CF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 14:14:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49e78adf099so13489375e9.2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 07:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789395287; x=1790000087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l5VsKiZa8A44X+TSiay4UTOU6FQFbM5HrKq5IlaOkL4=;
 b=EB14zupzp6usEvwhZBNqmw6iAjHR/ZRtV91LsvwDpPvGXaCm7WE92H0Icrclhymw7z
 IjUehq23ibln8aIYrChf4XiMYEBF1BbjZrscDP13IIkiC62lI+WyARhMJsX+QMRt9htK
 kQ0C+7YsS3BpnjRP9waDMGQSN0T2uO5H5R43VamhED2OmjZde0yPSEiHABhzLJfSOpNF
 ZLlPhd8kYPuP7qtyweO6KfRpWqB/6pQbmqIWV9OQ/QG30z1sFZFPoDIb/rTmsAyco5Su
 EL8rHp1n9LiyxCwBkgYFBRyf4IDS32VbCgyNCnBbkzP53RLT0lYz/qIRYs+uoKyri7+y
 HPLw==
X-Gm-Message-State: AFuF++mTGOdWJungFuiXuCrUCU99oWGsBGUyotsIJAb1MnMaSvYv1gWy
 2fjupW7xvd+PXJt4iEbOqaaFb8YYGO3xPgeljHPB/jg3Jk92IPh7WYgsLqPpMmH3s/8bMT85/XJ
 cywh0deg=
X-Gm-Gg: AYBFou1fEmXhOO8an2rvzcHCyC7TtDle6/MMH3O+j8LpW4WVFKQQ6kmUyEc2SKLddJp
 PJEgKcjnLNtw2EhQMoCICHmu52rcy/j+wB6OveeR7IhfYrwGM2BMRA2mwiT2Ezb/PiLczNF/caH
 6P7K3i05eBg5Fhg6TClu2FpFXl73WkXuq1W7sPW7+WtGUR7jqN8TOOCpesdQQa+tFaxpa9r15ch
 dB7CNlNuDJ760R+c4g0/77vVE8fGKZWY+iokShZ9M4lt0HoMOzj/eQulNKagy0Uz83XbeeK2C0D
 9lmBaFaOc4kgupIMze17RNJjxEyYXDVIMVkT1wHL/2cIFPx14Hh5Dg8XATZBbMn7Tqh+AjDqb9J
 XNSdzOcmVfpuKV2G8uzTBaQrvEMho8+Jn2oIb8PqsNqCHNP7PJt4SBIDmuLvhxMJpXrPQ0dgVcv
 WwcpyesVBik5kEbciUOFmq/11vJmk8auVfCpi057g0LuhT+gWRPg1oYPTMzrzIjOu8esWsapsqD
 Ezem8+yx/Z16pvZjCOGGDU8AEO7Y0I6pavH3CDk
X-Received: by 2002:a05:600c:4f87:b0:49c:fc6e:8caf with SMTP id
 5b1f17b1804b1-49e7a66b278mr32552765e9.19.1789395287220; 
 Mon, 14 Sep 2026 07:14:47 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7d27c88fsm2387735e9.2.2026.09.14.07.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 07:14:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be,
	raphael.melotte@mind.be
Date: Mon, 14 Sep 2026 16:14:16 +0200
Message-ID: <20260914141416.130674-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/xz: add patch for
 GHSA-5qpq-xqfv-j9pg
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
XZ Utils: Invalid write if a decoder is reinitialized after allocation failure
See https://github.com/tukaani-project/xz/security/advisories/GHSA-5qpq-xqfv-j9pg

There is still no CVE number assigned to the issue.

(alternative to commit 6f125a653038c9460b515b1f0d4c8c4be37d88c3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...t-safe-to-reinit-after-alloc-failure.patch | 32 ++++++
 ...-a-filter-chain-initialization-error.patch | 98 +++++++++++++++++++
 package/xz/xz.mk                              |  4 +
 3 files changed, 134 insertions(+)
 create mode 100644 package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
 create mode 100644 package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch

diff --git a/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
new file mode 100644
index 0000000000..e948cdee8a
--- /dev/null
+++ b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
@@ -0,0 +1,32 @@
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Wed, 9 Sep 2026 14:14:40 +0300
+Subject: liblzma: Make lzma_lz_decoder_init() safe to reinit after alloc failure
+
+If memory allocation fails and the resulting coder state is reused,
+ensure that memory allocation is attempted again. However, coders that
+are initialized via lzma_next_filter_init() shouldn't be reinitialized
+after failure; they should be cleaned up with lzma_next_end().
+
+Reported-by: GitHub user christos-cantina-security (christos-spearbit)
+(cherry picked from commit fe4d763d566a38ad61d4c5022520c25578a3a464)
+
+---
+Upstream: https://github.com/tukaani-project/xz/commit/0917f6d0f03d9add15dda27e0bf2ebfc22aaf67a
+CVE: GHSA-5qpq-xqfv-j9pg
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/liblzma/lz/lz_decoder.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/liblzma/lz/lz_decoder.c b/src/liblzma/lz/lz_decoder.c
+index 92913f225..18669300e 100644
+--- a/src/liblzma/lz/lz_decoder.c
++++ b/src/liblzma/lz/lz_decoder.c
+@@ -276,6 +276,7 @@ lzma_lz_decoder_init(lzma_next_coder *next, const lzma_allocator *allocator,
+ 
+ 	// Allocate and initialize the dictionary.
+ 	if (coder->dict.size != alloc_size) {
++		coder->dict.size = 0;
+ 		lzma_free(coder->dict.buf, allocator);
+ 		coder->dict.buf = lzma_alloc(alloc_size, allocator);
+ 		if (coder->dict.buf == NULL)
diff --git a/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
new file mode 100644
index 0000000000..97aa9a5541
--- /dev/null
+++ b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
@@ -0,0 +1,98 @@
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Wed, 9 Sep 2026 14:14:40 +0300
+Subject: liblzma: Clean up after a filter chain initialization error
+
+Filter coders are initialized using lzma_next_filter_init(). If filter
+chain initialization fails, the entire filter chain should be cleaned up
+with lzma_next_end(). lzma_raw_encoder_init() and lzma_raw_decoder_init()
+have always done this via lzma_raw_coder_init() in filter_common.c.
+(Separate cleanup is weird, but it must have made sense to the young me.)
+
+The following decoders initialize LZMA1 filter directly without using the
+raw filter chain API. This avoids needlessly pulling in all other filters
+when a program is linked against static liblzma. These functions didn't
+call lzma_next_end() after an initialization error, which left the state
+available for later reinitialization.
+
+  - lzma_alone_decoder()
+  - lzma_lzip_decoder()
+  - lzma_auto_decoder() [*]
+  - lzma_microlzma_decoder()
+
+[*] lzma_auto_decoder() is only indirectly affected due to the first two
+    functions. lzma_auto_decoder() itself doesn't need a fix.
+
+There are also encoder functions that initialize the LZMA1 encoder
+directly. They don't have this issue because the whole lzma_stream
+is cleaned up when encoder initialization fails.
+
+Reported-by: GitHub user christos-cantina-security (christos-spearbit)
+(cherry picked from commit e5e63d50eac1b4357a5a7a0abd3c5f99a5c47881)
+
+---
+Upstream: https://github.com/tukaani-project/xz/commit/0130b7524227d0bb9f405ecaf0af632a767fa735
+CVE: GHSA-5qpq-xqfv-j9pg
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/liblzma/common/alone_decoder.c     | 8 ++++++--
+ src/liblzma/common/lzip_decoder.c      | 8 ++++++--
+ src/liblzma/common/microlzma_decoder.c | 8 ++++++--
+ 3 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/src/liblzma/common/alone_decoder.c b/src/liblzma/common/alone_decoder.c
+index 78af65157..b2b049b5c 100644
+--- a/src/liblzma/common/alone_decoder.c
++++ b/src/liblzma/common/alone_decoder.c
+@@ -151,8 +151,12 @@ alone_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->next,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(&coder->next,
++				allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->next, allocator);
++			return ret;
++		}
+ 
+ 		coder->sequence = SEQ_CODE;
+ 		break;
+diff --git a/src/liblzma/common/lzip_decoder.c b/src/liblzma/common/lzip_decoder.c
+index 651a0ae71..30c50286d 100644
+--- a/src/liblzma/common/lzip_decoder.c
++++ b/src/liblzma/common/lzip_decoder.c
+@@ -238,8 +238,12 @@ lzip_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->lzma_decoder,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(
++				&coder->lzma_decoder, allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->lzma_decoder, allocator);
++			return ret;
++		}
+ 
+ 		coder->crc32 = 0;
+ 		coder->sequence = SEQ_LZMA_STREAM;
+diff --git a/src/liblzma/common/microlzma_decoder.c b/src/liblzma/common/microlzma_decoder.c
+index 882cb2c80..a7720cc2a 100644
+--- a/src/liblzma/common/microlzma_decoder.c
++++ b/src/liblzma/common/microlzma_decoder.c
+@@ -108,8 +108,12 @@ microlzma_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->lzma,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(&coder->lzma,
++				allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->lzma, allocator);
++			return ret;
++		}
+ 
+ 		// Pass one dummy 0x00 byte to the LZMA decoder since that
+ 		// is what it expects the first byte to be.
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index c07152ad92..5bbcc95e62 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -27,6 +27,10 @@ XZ_IGNORE_CVES += CVE-2025-31115
 # 0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
 XZ_IGNORE_CVES += CVE-2026-34743
 
+# 0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
+# 0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
+XZ_IGNORE_CVES += GHSA-5qpq-xqfv-j9pg
+
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
 	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
