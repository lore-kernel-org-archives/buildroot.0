Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EAB606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g5Z/6+M5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA2A80AE8;
	Wed,  4 Nov 2026 17:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiSTkQj8wo-e; Wed,  4 Nov 2026 17:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 191C0809CE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812566;
	b=IE3U36ipLm7MW8GxfWd5HdkdfC+6FKmKP0dBfKCBIBEK6F7NSGT7FKXMWM6t1hk64y6l
	 in3h+qik8OWyKP9zK83u53QepcpnGjCwTv4qJlwErNpPhsM5IUkViwLgZDKsZ/asuF+QU
	 1IRbBDLoE78BcBS1HYG6QVqaW9+8t9Dr28eUGu72+iCmgNGFUpgnOJlMbD84qhO/a/bD0
	 IbEX/O3cjx64XU3FEc6jwwQ+pgA9dL0n5fJ39LS580scD3z7cNkZ3o/OQIZFQWRtjxnBr
	 JVsHT6v0asUsUcqc0jjdl7i5PcQl0u5B6e8jrJJGYLeExDcqANBpFV3KxUryZ+qMo6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mVivAtSsA4zy5XQD64kXX6vpGLk7tR/5V5FwLBRtYNg=;
	b=D/oJKUv0dZZD8wU8jmBz2PWDJ0xgRBFIKDMnrLw6Q+M3VsOcLKf+KmVijk8Te5NXuIYE
	 1sLFNgurQv8/bbQeJHxA4btq1t7ggpe4JqvEainTxIblVPVjllWGkQDyXAXlM2hYV5qoB
	 kEMKV0EGPwuXKVz2tGHBJHdx3T7dnu0vltWg2vjaXw1IilmfQF4a1hS6QTkDZb9Wv/5cT
	 qK56O1CiTadCNYcogJOvxXeiiu7ypUVVPpZsnXrUWAToe9SNNEBITx+ZVCN2heAp1/t5j
	 q+OG0uL/Nm0PJJ/gk/dsu3QH2t+wVJcwmN+JFzhLP4oiuH5Uo+SqbgIAP/rz8Pzzitg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812566;
	bh=mVivAtSsA4zy5XQD64kXX6vpGLk7tR/5V5FwLBRtYNg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g5Z/6+M5AwqWPDGqA/RpNeck5hbM4PHWLFadJw0L1am0Rl/7/rFLhMuRUHaCpU1f+
	 YVWryk+Wm0G23ufJGuNAXJ64OyckoK3kiBTW41MnNy9WExPiYkM8712Y9ppakXxTuz
	 kjYYDexpMogF/Z6ck7V+YbdZahKuz2l4pXrgbE3q8SwfKzsXNTrKB8b1z9Wrssc6HU
	 uKKz6yN1xUNANbGyBOaCaQZWhGapSnHzdJnQpD/G1TbRCd+rBspwbInBs+wJeQS4+G
	 R2PYwwlGjrGNK+GnWunjNyZ12a8vES4kIqhpgPhkEy975Frd9dmWpSEftXo8yE9lQg
	 OMOMXUhM/EbQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191C0809CE;
	Wed,  4 Nov 2026 17:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72D19B00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A75809CE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSYmnyyzl5iK for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCB5C809C4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCB5C809C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:16:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C95442003E8;
 Wed,  4 Nov 2026 18:15:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:15:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:15:59 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102095913.3146796-1-angelo.compagnucci@gmail.com>
References: <20261102095913.3146796-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <50f97c8ac3d32e1277d91af41e7c8045@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/qt6: security bump version to 6.11.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 10:59, Angelo Compagnucci wrote:
> Fixes the following security issues:
> 
> - CVE-2026-82292: issue in qtbase
> - CVE-2026-95620: Use-after-free in QNetworkAccessManager HTTP/2
>   support (qtbase)
> - CVE-2026-96432: Null pointer dereference in QNetworkAccessManager
>   (qtbase)
> - CVE-2026-97845: issue in qt5compat
> - CVE-2026-100140: Integer overflow in XML parsing (qt5compat)
> - CVE-2026-101201: Out-of-bounds read in JSON document parsing (qtbase,
>   qt5compat)
> - CVE-2026-103645: issue in qt5compat
> - CVE-2026-103653: issue in qtcoap
> - CVE-2026-105923: Null pointer dereference in QTriangulator reachable
>   through VectorImage (qtbase)
> - CVE-2026-105924: NULL pointer dereference in QCborValue to JSON
>   conversion (qtbase)
> - CVE-2026-105925: issue in qt5compat
> - CVE-2026-105939: issue in qtwebsockets
> - CVE-2026-107457: Memory corruption in QMqttClient (qtmqtt)
> - CVE-2026-107472: Out-of-bounds read in QTextCodec TSCII encoding
>   (qt5compat)
> - CVE-2026-107479: issue in qt5compat
> - CVE-2026-107590: Out-of-bounds write in QTextCodec iconv-based
>   encoding (qt5compat)
> - CVE-2026-108081: issue in qtbase
> - CVE-2026-110944: issue in qthttpserver
> - CVE-2026-111487: Out-of-bounds write in the assimp scene import 
> plugin
>   (qt3d)
> - CVE-2026-114366: issue in qtwebsockets
> 
> Release notes:
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.3/release-note.md
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
