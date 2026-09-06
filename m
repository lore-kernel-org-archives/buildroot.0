Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C59C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA436061A;
	Sun,  6 Sep 2026 10:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mF9Ag2Cq31r; Sun,  6 Sep 2026 10:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 146D8605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788689670;
	b=L0ZZOsTEe1C41E0rdV5exD0Ao8CiOHPueEKsnzmIX+KEEufRC3dAUPWB00IvsmE4hwJZ
	 QDu0d55qhSp3k0wl/A6TOwj4ZmTnQ3ziAKQylEEWYwtw9uoDV44ol1specaYUXVfhIOX6
	 bxbRI0i7m5fL0+bHiurptAUf4vWP28Nzxy+RplPM7/hGN/AU8Knp28Th3uN8qq3Lj6gJZ
	 VjRAstIexlD/UPQ418xydOdWS2kKIAKVxu1MHqCQcRkK5akVxa+aPtcHT5jgwhSJxUqVF
	 dHuKaHGXg83f3WZirHu2oyDpb2dpRCJsUTS2+3R/l63k2QULqJXHIxLNZncxrFmqb1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788689670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=J16GIoUE2/Y/CKUhV+dDUoPRsg5WNRoP/ccFYm8GRbQ=;
	b=ntMRPPecJvjjocXNXGxl1+wX1pIR5+OenD/V9/KCmxBNvSlhit/pEFx8NkwwYmHqG5Zj
	 XqhmkpMicZKDYhpjyQmWKwRqX9aUZnULPMT6DeqqYTECR34eTWfu0+SQSp8vpcGVWNLI4
	 3MYMaIBZqhxP72GqEQEeh1NU7iVl214qB/hEPr8CWtGrSPSySDthgzA3QOdRyts26nQDT
	 QP6KcQJNv0hMASu2QreHWwJE4IMBB/Y+7SXsiIwLvA4CnIHaNORgwpNAQcJMVOcUfx3ez
	 vWFE/qsYsooug7G1XGeUAGyo2rwEJSN7Irqs5Har69vj5qBrc5ABocdymYBEw+ozYCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788689670;
	bh=J16GIoUE2/Y/CKUhV+dDUoPRsg5WNRoP/ccFYm8GRbQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nqi8n9quro4OtEjvYeCG/iE8zN5bPRqKd8P5LzzwLXuMBR6TRGve8K8i8Ab8yOEqX
	 cuiGRcYJIAqJE2uzFQmTcWYX4utIGfLLWkTE16p9Tdfwt/EllNlqkqcxDLNeJ0ousc
	 8op3r0j8k7tcQXM3fJkBA9xX4V2VW5r5OT9Bz1Ej6Gh+0Ai/sK4Yd5kM5Y3vjN0b6s
	 Bu/jeTpbh21gsa+obruwuWWOgMZaNxMkPTYJWxz6UHmX8cdRH0kzXvNjxI0Fb0Pohe
	 uKQ6mNLcatBjhdjXbYROxDMuksKrt50tYJ+pU9yViNNy7+BFfDRe+JtOS3UfOGX3xP
	 XXej/nkc94ifw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146D8605F3;
	Sun,  6 Sep 2026 10:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 866E5372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83FC0605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxvOyS6ML_Xj for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 488E8605EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788689667;
 b=h/tUAKihu4D4arMu3GOO35qHIwRa1YvAfohhhF9FjyBrh/ggHdOdodsf6IOUHVuykDDW
 auElI0Fm4qPf2gMynhN+U9W1G4tEHsr247JfzW4KpQth8z4wZTAweANe9PgFpWn6XY66Q
 ab8xmZ32CQfHmUvKnEmuO/HdqgJxV4YDZDqPWY4GSji1oNIqgtjtJbaZQgtIEL10hMyMT
 G+maj1v2/qFIJzhpckBohJsxPto2bUQGDUev1WX1iiaI+yzYhRxnFr+/XF8T7imFTSYCt
 SsorKrp+n2jZ6DPI0lXJPJmip2H3h4ldshUrMzbICEI173sCvsGBJdaYoP+fTaFLUxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788689667;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=jeNspZCEPXriMALX87Gj4B+ZYBlwI+4ufV10gt7PjMo=;
 b=QpAKgxfvsVuhYqZdkyAQVjwcPSSuGsVbbyTKWCoIl3ZnjSlypic65JkkrjBjJzdDrwDu
 UU7Ken2N8O+gu7fKwihbRF43iHgnS62q/lTQKL3eHDi32GQ6CGYkVAWPz78hDHnBP4Jks
 wrnYckxF52DypyaECk8QJJIQL5f+GBG8Bsy+fdSR1bvKu53QNUdW/LWn0yRY+EmdJcbGc
 b8RmEi+PE70oMiJXNXqtioTBeVwK30zPdknutZOV0pEdS3oigUJAHEBsJPHikrCRWkFOW
 TkRALjKcotIdr4H3lcmQrX9CeRSNNpdGOADTNn3me6h3xPj5IME8T3Cn+XyHJabwfsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DStdYGA3; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 488E8605EB
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A98B2003D3;
 Sun,  6 Sep 2026 12:14:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 12:14:23 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 12:14:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904161147.115283-1-bernd@kuhls.net>
References: <20260904161147.115283-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <a50ff3821d79714f6df6e180c9f13556@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/09/2026 18:11, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.23.3
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-x8r2-mggj-j6wr) Heap buffer overflow (write) in 
> the
>  uncompressed (unci) mixed-interleave decoder when the two chroma
>  components declare different bit depths. Both the written bytes and 
> the
>  overflow length are controlled by the file. (critical)
> 
> CVE-2026-XXXXX (GHSA-8fmq-r4pf-7m57) Permanent decoder deadlock through
>  a reference cycle between an image and its alpha auxiliary image. The
>  alpha edge was not covered by the cycle guard and re-entered a held
>  mutex. (high)
> 
> CVE-2026-XXXXX (GHSA-w7mc-p8jc-p853) Heap out-of-bounds read in the
>  YCbCr 4:2:0 to 16-bit interleaved RGB conversion when the chroma
>  planes have a lower bit depth than luma. Heap memory could end up in
>  the decoded image. YCbCr conversions with mismatched luma and chroma
>  bit depths are now rejected. (high)
> 
> CVE-2026-XXXXX (GHSA-4jqm-2x34-6f6r) Heap buffer overflow in the 
> SVT-AV1
>  encoder plugin when encoding a high-bit-depth alpha channel, and a
>  double free on its send-picture error path. (high)
> 
> CVE-2026-84451 (GHSA-hh47-fhqr-cj2r) Incomplete fix for
>  GHSA-73p7-m7gg-w2jv: the tile range check of the unci decoder (without
>  icef) could still overflow, allowing an out-of-bounds read. (medium)
> 
> CVE-2026-XXXXX (GHSA-4h82-g446-83fm) Heap out-of-bounds read when
>  converting odd-height 4:2:0 frames of an uncompressed (uncv) image
>  sequence to RGB. (medium)
> 
> CVE-2026-XXXXX (GHSA-9rj8-5mp5-26c9) Out-of-bounds read in the RGB to
>  YCbCr identity-matrix color conversion when the R, G, and B planes
>  have different bit depths. (medium)
> 
> CVE-2026-84450 (GHSA-gh5q-69gg-c964) A clap property combined with an
>  oversized ispe reached an assert() in the Fraction arithmetic and
>  aborted the process (incomplete fix for GHSA-jc8f-p23p-5hjg). An error
>  is returned instead. (medium)
> 
> (GHSA-mw6f-29j3-76f4) Several smaller findings:
>  heif_image_handle_get_depth_image_handle() and
>  heif_image_handle_get_depth_image_representation_info() dereferenced a
>  null pointer on files without a depth image; the TIFF input decoder of
>  the example tools had an unbounded EXIF tag allocation and a division
>  by zero on zero YCbCr subsampling; assert()s in the PNG input decoder
>  are now error returns; integer overflow in the Go binding's
>  ImageAccess.GetPlane(); heif-view now verifies the decoded frame size
>  before display. (medium)
> 
> (GHSA-8857-r8x5-7499) Undefined behavior (negative shift) in the HDR
>  bit-depth up-conversion for target bit depths above 16. Such
>  conversions are now rejected. (low)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
