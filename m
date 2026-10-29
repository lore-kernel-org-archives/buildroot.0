Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD80606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TiG30cco
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC3280F66;
	Thu, 29 Oct 2026 19:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoaMb6MuP8Eg; Thu, 29 Oct 2026 19:02:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 588F881010
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793300555;
	b=POTbXgXypcBpLU3NsX15ne6YPA5NHhG1gda8yoS5YuZhzE+I25MLbM5vzC5zjfLwxq6k
	 lkOb5wEUXkYu6ErKxe6fjEdWTWQHwbkRf1RGwy2FAT9RXJQD+j/fWdY43jwyMPo/zwMN0
	 9Y4NxNBnlJq3E+8vbIVzzSRH0+mDIxUAC8u5UJxIhNdxffV3hgs+pasxMaYAwyuwEDbnn
	 JvokUL//08T5WoLYoCdoLvCRfoeqpOMU03RwsQLTl2zyB6w3fPvPZabPu9qYx3xDsly1o
	 Hoo2hSlQNoh3ltZ3fk6ospoI2Ov5rpnpX4noYLI2iLJf0hdg7GBFj0Yu3hOwBmvFokA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793300555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xoeNFaDXn6AJBcEUuakt+qD3H4BQBpUUL59S2fw76rA=;
	b=FeguIrXwihUhQ3VKum3h0tL9caAu9FZEOfB9T8Zyf/dJcbmI3+sH2pdsv1eEEWYOaxLN
	 KLIvSlnBwfXaTB2x7oQ0Vo2vqRypRqWZy6Lcj8+KGZCok7wnpcDPA7SsOlfRFN6VOKoIj
	 ZhHx9L2sPpjjrQXmIVwMcXoWfqpH8ueMrgWqLNi5ZQN4oQ/hejPaU02z273gHyBxONPx9
	 cXmKO4dDWPIzyiOIKFPvQ5O/s5zqE7UhexXkRigZ6X3uUwiiyKLNxeP4fzeOVT14k6mtE
	 9HaQMKX8+ZUVjXAcL8O2+OaW49FEoW0CA0HGL5QcRh/UYVMMYYGfng6ao8uM2yxn7TA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793300555;
	bh=xoeNFaDXn6AJBcEUuakt+qD3H4BQBpUUL59S2fw76rA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TiG30ccor7K7UTbVCnmp0bNGc54IKUT2b5+cDsvArstlP+8pnCbjBfRLbIczkUnRo
	 hfezEH8tyZ5WYhECo5xF1AtELXLpm6lvfGFw/fjYlLABraAVhlV40SZhG03TZX8DIE
	 MYEA2otm3KdNsk6pLzrD7TWoEP7NjqMqc3q4EHJM0SaWEribG5vGfJNvyc5q+aYBP9
	 Td/tdO+IDNKwZMhZ5r7CkhfRRSKQGXmrqzbhXY48qGVj+Q64CB56RoNjMZfE5UIbcu
	 yAKRfQC1f2gK3QAhQZYZIK88SctnPgbeD+W33L8hBVE24ZPZu4ebtbGzPMza74TOUQ
	 EdCEimcOMtqvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588F881010;
	Thu, 29 Oct 2026 19:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5691B2E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 488EB400C7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x6HpjCBnQiV for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 19:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7958F40048
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793300553;
 b=FZbRPUCc4IdqtGzdo0s8CKaHJpS+ltuCwT1zwAkgDKq26czEdkpyug9PHMMl8B8wS8YD
 hTC2gMyhfcDAWG/f8tDjHEpcuKQa6cjVYOoLsIK4UOlnDVrknDoU8u2JmgZ33xIagb09N
 Nvv68knCYC5s6qH7wyOd3jsVDlkyjrS+Cl4lmY/d0qFM2h/WSpTckTCwvaUxnd654YCEj
 3Op9gQfTpoX6D3UJYSXNNQm7w2wlhFZIBYrjOvLBlXR7GU3Tmk1rwApf7YGi8MzoEm1gE
 LH7oTjc7OeCRmxd5YHTebj8fQwMsxFfxIOsfN5CtnwSpyv1x/finnKXqN3nUIFimqwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793300553;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rJZ2p1ipAQS/P0wSq1ghYj9/ev88qhR38jqSmzStlMA=;
 b=ncYuYpbOFi27MyrlJzLnW2Cqs27KOPXZgC1T23LW3fxP085qiHbdYJSAWhR1ooZ36fjf
 QbIJ9htr5JrpHHEyWoZ9RFDCfUIrH2MAy4gJ7WppxnIrn/YXNPgvMVxT7XYutwPAuoaE1
 f/QYTXyhOfmXlhFhmn6+sIu6UsZvifou2cyVRDAw/6EB9fMRxYsmvjadGgkkWpfzQDtjA
 YCOFEtffkct82q8cAFSOve7XebuFl26aNm7KL0ZQGlfyBzel/AhiN98s7sAoy6tUzMwjz
 kZSQZtc2pei096aNTg2qQUeb6GI7aHjnWg96y7jhkOX7OBIIUs0+7C4pNOMfHH6/L+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jpcUonSt; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7958F40048
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 266362003C6;
 Thu, 29 Oct 2026 20:02:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 20:02:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 20:02:29 +0100
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261028-wip-obbardc-package-dtui-update-3-1-0-v1-1-2ff61efecfed@oss.qualcomm.com>
References: <20261028-wip-obbardc-package-dtui-update-3-1-0-v1-1-2ff61efecfed@oss.qualcomm.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <b39f0313fd164e2926e999592b097fe6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/dtui: bump to version 3.1.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 00:00, Christopher Obbard wrote:
> Changes since 3.0.0:
> - Toggle tree nodes with Enter
> - Bump chumsky dependency to 0.13
> - Regenerate stale Cargo.lock (3.1.1)
> 
> LICENSE is unchanged, so its hash stays the same.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
