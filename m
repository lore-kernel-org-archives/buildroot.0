Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11822E73145
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784A96079F;
	Mon,  2 Feb 2026 08:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhXO3g5EWohM; Mon,  2 Feb 2026 08:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BAAB6076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770019912;
	bh=MMzjC3au92BqH1cMYWOeA+GGkMmWlBCrY7v6ZRcgDvI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJr6TRq/Oo/RtRBdzKCsS00Cf6EVuKAaVoxrSqJFe0eN5szdCH6OXUY9nXoA/PdfA
	 qP30tceHobkdyCzSisCpBtZ1OZgQYnHwQCSusRre7QQ++t/RbdZDBMsOBysbgMWEUo
	 8G2dvE2Vsxv5vsWe3HQnxWM/VS03V85NcubrMW17vXVPOwgFXjykvfGB6EPw7pjsTe
	 aYPnRQ64IwoU90Vvfw+309DzI/iepKpfiINeXcxG8xEw+S1SqlUU96U9fsdvpSavX9
	 3LVxAnttHu50B+BPCDlxm33X+IIiapNtbnxhBqJbfSsHUugy6O158fEEo9MhzaZO3i
	 DX1ISrBoVc/Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BAAB6076B;
	Mon,  2 Feb 2026 08:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87D80149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6355282896
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-HAIrRxeHhO for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDEA98272D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDEA98272D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDEA98272D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:11:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2016961100; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:11:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmp2A-00000005nbG-3BOF;
 Mon, 02 Feb 2026 09:11:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  thomas.perale@mind.be
In-Reply-To: <20260201205228.96782-1-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Sun, 1 Feb 2026 21:52:28 +0100")
References: <20260201205228.96782-1-titouan.christophe@mind.be>
Date: Mon, 02 Feb 2026 09:11:46 +0100
Message-ID: <87343j8szh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Mh7UVNrBmYFk93Uy0kQa53y0ZlNJK6QIhFa4nsTNt8vncY3cbj9GqJRm7xhcT4P+TuJNQvxGtT5oiZyI/fStHggt53PsWHk9pe+bJn0c8UKpH7rJZaQkStXcHtBsWMdqQkW9YBjQzdUA/UOTdXgJJhGlGE+3I7v7LxOYf51Cgkb/RUDvDYL+qz6Ss9oc0SAg5//Cuw6tDFMDRm0nst5iTbRCK5gmoupf7gCaMsZiM5ZiAtoVhriQA4jeoPifJ6QHM3JQaRPLuZi00G38yobzm054bypWyKK9ome39RmU56NuhGuyFTCk7DVTOqM4+AvSjVsZRDtwTC3K5NjtP5WsUw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XJBvHlo/G4RrbDuI08zmCvdF8jFAwghPc4/yOn5x8+4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Mh7UVNrB
Subject: Re: [Buildroot] [PATCH for 2025.02.x] Package/libopenssl: security
 bump to v3.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > This fixes the following vulnerabilities:
 > CVE-2025-11187 - Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
 > CVE-2025-15467 - Stack buffer overflow in CMS AuthEnvelopedData parsing.
 > CVE-2025-15468 - NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
 > CVE-2025-66199 - TLS 1.3 CompressedCertificate excessive memory allocation.
 > CVE-2025-68160 - Heap out-of-bounds write in BIO_f_linebuffer on short writes.
 > CVE-2025-69418 - Unauthenticated/unencrypted trailing bytes with low-level OCB function calls.
 > CVE-2025-69419 - Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
 > CVE-2025-69420 - Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
 > CVE-2025-69421 - NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
 > CVE-2026-22795 - Missing ASN1_TYPE validation in PKCS#12 parsing.
 > CVE-2026-22796 - ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function.

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
