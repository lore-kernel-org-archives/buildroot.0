Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6CEC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282DD40994;
	Sat,  4 Jul 2026 14:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5FC0-3Lwu5d; Sat,  4 Jul 2026 14:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A212840986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783176176;
	bh=lPWJIti1Ut0q3/INRJhThO2KtRA9hi95iVUsKELkblg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UMRZkcdgEFO1gA+JwozUOKsB+ky5C4lLi1wYMjVdnSnnlmOMGkbzZUR1naBqckx+y
	 K1g02ii0K1o7xjaXcuZTeubMu75o6JQE6EbSFwKoTpaP9nBSmuamNVLt2B87pS8Zkm
	 GK9WwJQM8gz7jWNW9BOFf9XQaIFz+iB1ggamqd68chJ+cKAN9W9vXvHVvU2DWmnKzE
	 Y5G3bIfaVjG7bp+VGTGY9G5bKJu1Vqlc8WDD/a0qWNZEWbUITESreQLrIDevLa6n8U
	 RR55VtYUghl56SzTswcsb5w599AlKW59zIrDILE/dKKv1to9PMD/eZD5xUOzrjF2xx
	 6ORWCOWzw8Ovg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A212840986;
	Sat,  4 Jul 2026 14:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD9E14F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5119380DE3
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKvY50fcuk4Y for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 14:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44BF980CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BF980CC3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44BF980CC3
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6650013F8A2;
 Sat,  4 Jul 2026 16:42:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 16:42:48 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 16:42:48 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jezz@sysmic.org>, Sergio Prado <sergio.prado@e-labworks.com>
In-Reply-To: <20260630212717.604030-1-thomas.perale@mind.be>
References: <20260630212717.604030-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <1f84da0f5bc76ceb14f8ed8996813f87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783176171;
 bh=gE/l9Q8UpL9rbjiQJ1EQgtVTZqBQWcudAFP7robCgnQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZTRpSa5yHuyCJaNxnbrrrIndEotxjbY3BCzZh2Q2xkClL0TxBJfUQCEV5IdBycmVh
 ti6EjDmecnx2w3VkeeTzwDtAqIrbjolRQtD6d02l/rGdYDWwJBERqxSHXWOdqVrtdq
 UA7WCZKlxYBJpug28ZpJoONiW6bNGVjNDLAwQYI32xnWX+Dtp74/PnEOfMpc1IUa2q
 +08QUxVRXf8T1o+0ii2JYXlMe+04AC/14cU5Mx+7UopoFmQWovptKht5oDE1XAOtHX
 D/Y9LiUEe/iiV9A4+OpRynHz21uRez9gYjk1Y2LcVZA8Hnw+nlf6DA3UwGXfXklWji
 VLdTv/su0bhHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZTRpSa5y
Subject: Re: [Buildroot] [PATCH 1/2] package/strongswan: fix build w/
 wolfssl 5.9.2
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

On 30/06/2026 23:27, Thomas Perale via buildroot wrote:
> The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
> content was merged in the 'wc_mlkem.h' header.
> 
> [1] 
> https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
