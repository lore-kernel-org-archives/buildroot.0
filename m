Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD97C61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5BD40598;
	Fri, 13 Jun 2025 11:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yE6_v8MxV52Z; Fri, 13 Jun 2025 11:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9EBA4054C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EBA4054C;
	Fri, 13 Jun 2025 11:00:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8FEF1BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D2F842BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMQm2uYZ60J8 for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:00:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8181281377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8181281377
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8181281377
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:00:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.113]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1v9K6c4Be0-00o72v for
 <buildroot@buildroot.org>; Fri, 13 Jun 2025 12:59:59 +0200
Message-ID: <59538a23-578e-45f2-8839-33d6cf26888d@gmx.de>
Date: Fri, 13 Jun 2025 12:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE-1901, de-DE
To: Buildroot ML <buildroot@buildroot.org>
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
X-Provags-ID: V03:K1:JeRxY3uULLIOVnpFm0OGfF1jyj5IWtnc+0a/lRAtAMGQLb3IDXD
 bJuYqHq0K6UWd1oS7oEx8Q0BhgI5Y1RNzq995zw5bq1hSEKSgHhwnW3WAoPv579EEZ1Hndj
 OWDAX8Ii12MGy8UqlLns0QiEO4ZZywcnjc5HhvFY8He5c+mSxy40JKN4PQEs/CP6dNfBFPq
 0J+29oiReb6yBrEmPxrNA==
UI-OutboundReport: notjunk:1;M01:P0:jzsjuC0FIRg=;GmQV5i0Xo7F6WxCaDzd8mDZ9sF9
 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
 Qi5WrY7Xv+2pk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749812399; x=1750417199; i=fiona.klute@gmx.de;
 bh=SgZRDN8RLoMPW1zHSnkqoKSHDAXyA95/HLeg0UV64BM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=D63SbJ7vCQILkWrTpksvTx/m7C4wrARGiEEEbc4XTT5FTdW2iI1q4/7gkXwSG7h1
 Ove52eRLDUTlubvN5sqlAH+hpoIj95E17gfmGmTAcmotry7aRl3btf4EGbxi755jG
 XlhcWgWKjFzAORWRwkpf6U34i1sjxPSjJlG0DCV4+cl2pi7A5GNuDbmmJFqJZUqVr
 79bOQQCICnzSXBG8BmM/zpZGrqXTIeAOFTn43BVqs57TGgZJrCBfpWwI6zyM+YTfb
 wMiAMG1+9CzhEbmT4EoU1Mnj4ekC70zIRU5IjAN9rS5FktkYaS1fuW0pUt2T5Stic
 oAHlu/21Piit/2r8DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=D63SbJ7v
Subject: [Buildroot] SBOM for Rust packages
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

I've noticed both "make show-info" and the utils/generate-cyclonedx 
script currently do not include information on vendored dependencies in 
Cargo packages (including Python packages using Maturin or setuptools-rust).

What've found so far is that with Rust >= 1.87 (not yet in Buildroot) 
Cargo has an unstable sbom feature [1], that might be one option (with 
the "unstable" catch). Specifically for CycloneDX there's also a Cargo 
plugin [2], I haven't checked yet how complicated it'd be to integrate.

Has anyone else looked into this? I don't see anything Patchwork at 
least, if there are patches or ideas I'd be happy to hear about them.

Best regards,
Fiona


[1] https://doc.rust-lang.org/cargo/reference/unstable.html#sbom
[2] https://github.com/CycloneDX/cyclonedx-rust-cargo

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
