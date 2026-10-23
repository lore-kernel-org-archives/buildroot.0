Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A74606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LaYVChaj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61B9811DD;
	Fri, 23 Oct 2026 07:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmPtaoMa4aOQ; Fri, 23 Oct 2026 07:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C064811C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740942;
	b=D5UkC1gaGJMgvYZJkWHKwkdQ6ukw0K01W9DuNLfqzt8viGXErHoIf+qhb2pWNn8b9fAD
	 NbO4ve5zrGMdFdyRfub/q904Bv2T9JLClbsB9rd9X525gBy++64rjGeLn2ORAgNLCSERg
	 1aBHQ1AJtddM+KlVVpmX5n01AqIjy9Uy5ebXmCXqz8H/vpmzzq/WyA/UxDIv3rKPmq+HZ
	 OZAb6zpYBM6HLPRKGyFhWWpI25X8fwnoDETVGnJ5m2ZNjZb62K0354r3dzfykkTZ6Xdtd
	 bMSWCrvaAdtYqr7Irh5QCHVRX+g3PoPecM3t20sQJoc5MUtFxn49AFPUBAELxj6heuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ej6tkuqni9WdDi+stENe4B+GTyLJvfLwPO+sTCOAJQg=;
	b=LjH5lq6+Q2+bZMO8k0v65Z9ThWICmPsrwXN2jFEUQmDmI738LJA0M+/IUALfgabTju6W
	 otae0ihFyEcHF7OYnGYRdXG3FCwrmYEWOlgvDHW5jshcELrtb67uKehw4jGdqwt0lhgBd
	 jwa1f9Ztl7+m2iPdvSZvDGMT7hBRvHg28ELcDW7hfJ+0a7JBIYtLYsulLAHZDGlJaKeNL
	 ORqdAweFuuZRG393NIMP2DrLF/Xj2S01EXOKpASOwMxX1c+dheMiwt9b13ylFOnAg7d67
	 EMqfWK5iNfFMOzy71Ez5ALNanwtqUngcAYA3MdRMnQqttQGN9yXipG8FO8/mF44UwTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740942;
	bh=ej6tkuqni9WdDi+stENe4B+GTyLJvfLwPO+sTCOAJQg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LaYVChajsBbgnhumjPVmdCmHJkqIFawi68UZWi+Vh8yKSJIqBI+DG97TcsIEO549k
	 j/V9jnMEq1lkb0oVWdZXOPveIdED3ITKucqMplUKpkRJDqvp0f2YZozFc5O3j3u7d/
	 iwpO1HMdrUa6x4/MlQU7LrQ2VKjO306hgyyQB1LZHDkVJ+FYLpp04OuWDa7eE2RbPH
	 Ad+BhW9Mg1iFFlWowNpw1mvFhQ5sqbBjuAA3Z7BX59c214LuRKIjKSf99pDjBb7MzG
	 bg9K2XfXB9V95YQX0x3SXYN3O2eijO5/PWMpzoFGn9BgXwn6QqaylzmSTdL1rNK8Ww
	 RB38RXC+CySxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C064811C1;
	Fri, 23 Oct 2026 07:35:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D933E356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE72C60650
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 976vNsOHv6gw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D9516064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740939;
 b=DxEBKA8WaG2crutf83bO7U1GcsrCI/f2qYxD8whUHp2/Ti3HTIxb4rRv/w++wDVfjH0z
 Ej5L7GPe0QMOlgYp6LzrRie3HhwThJsla6lHGfnQkH81CfUNltYfInXi72OdZEh9X/NdP
 S2+TCELD+BW+/AhDdqvFMu9eDaz0eP5t2gleL2BFmftL/H8ZCpkkHfiIE4bPUtk8WxOz9
 D3zwLCdUXXbTqlQ8nX+tyLQQZ/+ZRVpMbJVArnOdJvZVbcvtq4OA8nrCdVPBbZzvslhxs
 OqcjIZA+Iewnuxy6uC3huY4M9PLBUeyAYAOfz2jlAbipmUdMiYPWaELbnxOn9itBhXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740939;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6s+9fu5nFpwguk8+4dgAyc6Wad3rVEdfJqGhrvEFhbM=;
 b=C73pCFqaLo5A/lIBpEIeG890nrTaZEAWJB6K5h4JV8Vk/xvkXH7LmEdc1doSJM++giXU
 Bw412WNXpHB/CZ/5GbTO31khMejBFfSxjyl8Le/Ex1U1yxOiQBrpxJu7ZgeDCni2qrHVU
 nwgsdROIbNg0k6UM1XhHjBH2PWE00EcffdJDxMrf96a5eIuPGAppjaUbKYPFlMPq8Ey5v
 Y0BPTGAY4OlzwzcXAet/rwnNjBsNsVj7wuJVIzHixJjZY0zRpYcDtFO9E5mJDYI9zGFYj
 qMH0te5kGLjiuLWSkSNpqGuqMb2Q/wjLhyfEGfJdCKFHFWCkoXpEV4HIz6uOK5DjqpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qp7rFp1C; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D9516064E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8F1CE1A12ED
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6269160398;
 Fri, 23 Oct 2026 07:35:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3307110328EBA; 
 Fri, 23 Oct 2026 09:35:35 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:35:34 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <atsOH2BI10KVAnRX@windsurf>
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de> <atfRLgIqqBBd6TuN@windsurf>
 <atfrauVhAXrHeul4@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atfrauVhAXrHeul4@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:30:02AM +0200, Waldemar Brodkorb wrote:

> Thanks for fixing my bugs and applying!

Could you have a look at the build failures caused by chawan and
propose some fixes?

See:

    arm      |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/35f6ff053723bf0d16ac5b425cf943bac01a4418 |
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30 |
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/553aca94416bcafabfe23d34d6907bdb9ebb84c3 |
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/41cab338af1c162d9d1444645020a20b2b0c05ae |
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6a6cc4babb214f27f4f0e69ce915bf39d05042 |
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6401afa998d5e131614bda67730a79526da784 |
    or1k     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b |


All failures:

  https://autobuild.buildroot.net/?reason=chawan%

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
