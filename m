Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C95606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cZqVaxbg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62E260BCC;
	Fri, 30 Oct 2026 14:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na3GBY69LzyO; Fri, 30 Oct 2026 14:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFB5E60BA1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369300;
	b=rdi4askVorr1B3KxjgjOB8zFWX+WaCqB/XwjMl4/r5Ksz7lWzd7GWJ0WbCJw2AaGjRFj
	 c7JccD299g3kUV1038qqaRecX/kzUSPqlMWr6Lj1twCcV0++4xmX2MqYfuleOqnt7MnAr
	 AEE5gZc3bpM2p/jOqgHUpiBo8MBU8wrUIZRfoMyNjA40ZyILzL5kdv+DIZb1SG+gKJUOF
	 yGzz0KqgQYTbG8FxSIdyNeGctC/yHrstfWUDtJdoIoeRYQJVQTGZjwRz/SZh+jmVbnSua
	 gD437NjlesqLZOxw1GXgwZOxaDcC7/TNmvksDoArWEtMqmenCWWMcKWGkwhjo6Bl7/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Fs1+niNe8eMovhxVftnD+/RKu69E/XR7gYuWH+t27mY=;
	b=ZWykrGXnUY2e5075gKplMQOb1qEjfeCVMiCT3G3LCZUyYRgVDB3gHOiNGXbr/aR98TC5
	 wXkoacy0B/HYIFrokgvja04wFu0nC+Fq0N6Vjw7M5LEEo/CdvZMwnwayLpBWtd2+11htY
	 hnD6TEOGhtZddKAZ86NG/ESVaGG9anPxOqPP370cSkDLDFpoQuqpb+HwIpYiX5ygNMj7S
	 Jo9plXziNuK9Ih+ID3MZMx2SCK3N74iqqe1DipzJhIIZxUTFiphbigMbqVDXtNHObXfy2
	 eut8HQKKA5EMQHkfPtuDVbNRh9mLwTR++kXtMpcmvNpy4+T5AMoXqGtu4vtOn+N78Lw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369300;
	bh=Fs1+niNe8eMovhxVftnD+/RKu69E/XR7gYuWH+t27mY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cZqVaxbgLJqbpkyWztNQ96/OXA6Wduz7/3pz3i7KAsSvag5Zt6KKLNNWC+OZtaeVK
	 4bYHfo8RhUaSYeraAotBCseHNg1S1SPZcwqK6tRuduHXFf8q4DFWwr4PKRlt1KVl9D
	 QYYDJrlSST4/Csx62pyu/VMZESKMs1cVfJdBNwz6JCkpL6P2Ib+8ufHx2/MUR9fwMM
	 UoUTMFSqjKAVfXKxw31ckY8d+ZMCdAbgPUJgjvJw4+G7c19YD/VpfLtyChkCVNSBpY
	 SgsLNoI2ezUo+5lg9B67A4rd/4x/1HZ0084BYer85jZgHL5TY9Dg82UUdquDZlDNep
	 etP0Otd/09Btw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB5E60BA1;
	Fri, 30 Oct 2026 14:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A229D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C18360AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYxH_KLcNP6h for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85A36607AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=bv0qW2BHRjtrpxSku+OEZTqoh6g20oeps02m+aOn7xfVhRa8pUzFQsz96jEusUcCQOlM
 P3BnHNc3P19GnRiJ9DwujyVZ6hjMbtXhZPr1/3XBITq7rNcQGrtH09KWC2Q+o/6evl9TR
 ZMmBedhHC70+l0txlvNnFGYcUIEbhLqUOi8cdCmdMRuGqwl47OTFHZdI9i8EvGSsIaTr6
 U/yQcHWjpsN83qveFTh5TAaB+/lirg2Y30tVl/t92YmGdg/7iDgrrT0l9GUBP4ZZmhBkk
 moD2hC9Z5Duhk26rQs7dAl+QPSyitdHs5zwhk4urUtu4ajMt24PngwIorJKu1rnxglg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RxfejmiemFKdAlN8HngQaTXthD3BVAE4ZC+ADFZsVQA=;
 b=HypsMKG+I9et4j5cyPreCoNdBdPtbyH80IHQuYqBYsiM9RpGWE5JRsiN27nOKewUaSjs
 mFPQKG9cNtGRuDfDUDcW2Ue6E9fGGAXTmzeoDnHl+ANPVrTWoVrYTYzoFHSwotZDIWQeL
 yInJCDTw38GdAVrpW+UeBYsXaZvX2isAYxLTJqfmnkSufYnzesDhaGlJSyQzgE+aFEvKI
 Wwa4PcGPtI/tHJPE5b8EH50SklKm/F6gu315ZCAFiQF84sk8j+78cxBdo7W15CjriHKBS
 7cnBpjCT1Ek8YCIRN/MkuEPkUUDpaNjxjdS/OJGgkc2C9lzYgB7UQ4wU4sJIbZFk4pQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A36607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A46F89D389; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 642613bf0be13863577b9ce70a32c2e13fdcab75
X-Git-Newrev: c58f9838f5bad3b8fc7886d7de3a44d7e39819ed
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.A46F89D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/containerd:
 security bump version to 2.0.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4844020828421962701=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4844020828421962701==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c58f9838f5bad3b8fc7886d7de3a44d7e39819ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/containerd/containerd/releases/tag/v2.0.14
Fixes GHSA-hc94-p972-ch66.

https://github.com/containerd/containerd/releases/tag/v2.0.13
Fixes CVE-2026-53493.

https://github.com/containerd/containerd/releases/tag/v2.0.12
Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7f0381b3074862c1f287a4a4036b6bd154cd4869)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 410e5d61e1..97d2691c5a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
+sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 630106b1a2..bf7ed45266 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.11
+CONTAINERD_VERSION = 2.0.14
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE

--===============4844020828421962701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4844020828421962701==--
