Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0FF606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fWcpiBvP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC22812AC;
	Fri, 23 Oct 2026 15:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG8AcndcYEbU; Fri, 23 Oct 2026 15:04:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9211812B4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767894;
	b=N26FmNQP3zNsnbG0Ja3FE+o+hU0DihE5gFm3uxg1AfaF3gXSI9EFxheuSdYeHAiHeejH
	 +s7qjv/ibaNF7qSlXkXTFADkJ5o+MnqVOi5xGAuArHZ1gK1m3yUYgnyF8SaFKRsISa2jF
	 D0RIVchGa5UbpPNrTX7+C0su937hPnaLAWiefAUmT5O3kHx8FnD7z01N1YYy55JRwvzGF
	 xEofBnf5CPATQMjIQ1R7uIJcRbYHQ+AaWb+oADHp/nkkViqYaDw9ohsOzY12wz3J2iMI+
	 qRj16wHrglcDw6rKWrWEBPe1FifM5u5EcvL/13qc5BviIln7gccrKMDsawq+Ntwy8+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8u62rBIskNT835TGPdzJkWFJ/fAHZwrCPhmvcV7f/dE=;
	b=D9PXXeo/jTux6Kie0s3S99boUFXMOqJq4IIsZyER7qGtcFyF4TH5925T2cvnNeGiSXNr
	 Dm7djO4/XoqKpv+oCp3+SgVz2hzE0co1F7upwBZa97xsKwlWzp6E6Xt2DdBfgmak/3XFw
	 s+bAdRNVoaq+BmGYO/uhrbtrxQAhpYem1eWdSsCN0HAI/Q+PEtboQ7Zq/RPY2/AMjp0TB
	 T6RcMHfgPjFDpmgr20gicpKl4J+nUTKEXNmtMF1IKg9zWyUB0dpOWyx/6U33oK3jnupm3
	 1eL9qD+IfCu/RwQBp/7No8sliLtM7d4kuIfp9lceDhuqaO6QlqbrR0gb/XsHpWzUy9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767894;
	bh=8u62rBIskNT835TGPdzJkWFJ/fAHZwrCPhmvcV7f/dE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fWcpiBvPzz22ne0YssbeCNTLJO3m5Mj+8wmzxNeSxsOUl/vMWfKbPT3kOnUmmFTqa
	 4tY0pfoze1eVgzx7vmahmZ5i9S6Dgmx1A0qNH4FiQEG1rNovhNNKg7MeruCG/owwm2
	 bApgGi0ZZcr2wSbuDiXNweaqoQwF4kP6Mq+/LHOj2NtO9Jvh4ar0rsyV8Kkhu9qbcP
	 eDoQ2xtv1/YcxUKPvYBf1yR+LR4cF5sGiHo9Ya13MZu4dZgy2BMl1KyrWia8tBwccN
	 hRPWR6g4J4fOtkfhEemvSJA+blsJhXLWPzVoSJevL8Ibz52D71GGpFZcylYVLVGwxs
	 EJ80IS/KNYHag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9211812B4;
	Fri, 23 Oct 2026 15:04:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1103C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7552C40982
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnMf3wvl6F2r for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:04:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A4574097D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767892;
 b=o2j+RrMGmwK/batqctRFBDZFmKoTqtweo6VKDawDT2mzas33+3kHHdlmdllUIOblOc9B
 /XkiqJ720Hay1OVHmP//u6kbkHAPTwzQTrw4X+2vb7CyD45qfxjvm6OkeuhCSHd5e/omE
 YTq1iPF/d8J/ErYSvefV8Rn53rjxzDKJzetCs4ARCR2IQ/ixJZ/wZfsKqipR/SjHD36uG
 gbmCPpPM/DqIbZ/FOJvVysDUvmApS+a7dOm7r/0SYLCgEGcV/EWZCKb36bQlu7AX5a1h6
 OLas8Txz9a2wgQ6dTibF1u3FsKRWF3Y/MyeUOSRMOx1bfa2PyZeOpWteJhg4fyKE+Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767892;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=News1YCi7WYIS6s4E+9qeAPkNbCsaC2WjV9yg2okVgE=;
 b=lkFALfaLJiCCol56NRatTPmWQUbmu8wusFaWoRYStj3dNdbKu410wLS+1iEmS8tqdSMe
 5R0yKbuxXIhqaAYhktEh9+5lgszqLczBcjvBi5At6guHjWcl2uXFh8gSnblcrufZFeElW
 8Zf0/CBJ3/O4KxI15CS6ITM9i+J4GqrtO7WPYH80G1GYG5aXuoBdoIJL976HdC9Ye/E1o
 TNnq3mB1izYx8OHQaRalMSAgif2S+quVTjmm7QLnW7emOBHwv2UClQS1zjSrYjbvm9rM2
 YiGu22/aC0DUcDUJygN2a8KqOGHfnuPDPIe0uflTQ4CBruNLaZLSf7WrTGQzn3MjSlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KDjb7P4q; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A4574097D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 148B413F88E;
 Fri, 23 Oct 2026 17:04:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 17:04:44 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 17:04:44 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Joseph Kogut
 <joseph.kogut@gmail.com>
In-Reply-To: <20261023145524.1751306-1-raphael.melotte@mind.be>
References: <20261023145524.1751306-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <c3ba00fb5815796f64fe0d9f22bea398@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: security bump to
 version 3.132
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTAvMjAyNiAxNjo1NSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBWZXJzaW9uIDMuMTMyIGNvbnRhaW5zIGEgZml4IGZvciB0aGUgZU11ZGhyYSBpbnRlcm1l
ZGlhdGUgQ0FzIChbMV0pLgo+IAo+IEZvciByZWxlYXNlIG5vdGVzIHNpbmNlIDMuMTMxLCBzZWU6
Cj4gaHR0cHM6Ly9oZy1lZGdlLm1vemlsbGEub3JnL3Byb2plY3RzL25zcy9maWxlL05TU18zXzEz
MV8xX1JUTS9kb2Mvc3JjL3JlbGVhc2VzL25zc18zXzEzMV8xLm1kCj4gaHR0cHM6Ly9oZy1lZGdl
Lm1vemlsbGEub3JnL3Byb2plY3RzL25zcy9maWxlL05TU18zXzEzMl9SVE0vZG9jL3NyYy9yZWxl
YXNlcy9uc3NfM18xMzIubWQKPiAKPiBbMV06IGh0dHBzOi8vZW11ZGhyYS53ZS1oYXZlLWEtcHJv
YmxlbS5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
