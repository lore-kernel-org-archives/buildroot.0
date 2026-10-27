Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0C4606A331
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bpk24mUF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443D740721;
	Tue, 27 Oct 2026 13:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vUKhs0R8QJP; Tue, 27 Oct 2026 13:53:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4AB2940740
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793109199;
	b=lgx4bKwjNLlKPEOoxhWzW4J2LFGfW7WuDHnDgU2GV3jGVoJXPUCFXRkLwQ3XHwz8cljO
	 9ydaqTOwu9E3YuMofQTJWzlDks+kus/nBoliSdKZuO8BL6AlwAhv8eO0U3jE4121nMuy1
	 AOLJgu8p60wp+Q6Bz8zgYcxVpjl1TLHHIT0rFGYAWKVOJ7l9kbTPBzyY9VXJ7G5wiWzZi
	 b0p8GtaN6jj1IfTtkLg40cw2mpkBUntXrCJdCBmOS5zJgCUX/L6ZL7aJYnqfmZUzxy4G0
	 lTPxfMFcmWl5Lo32AcKSDWPWhALoHeIha2zPnCK+HCTcci606IIMjTVr5JQUiGPrK5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793109199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=rxFk0UCr50q9LEfuj3BNoajHdh0CkDRd0L4IQQCRXMQ=;
	b=qhbLTQCQ81CcdiwEMZcywdkQNsYvYIRcCNlf7BQS/NB4XVNXyl6cbHxvaanC9CBPOj7X
	 1JDHbrKw81MHWuMoCZeKCJgSZH1Gqr+0aac8qHLbnfSW7K4hoIhyl1qhuHpNhiibRRMjA
	 XJ6N3G/YlaZJ3W/k11Kzx93qo6KVfVLnYCLeovvwGigWOKh7SxLwwSHafGYlpcO6omymW
	 JdZSyc9Z5iTcMvRY6Izy7/kFc5RSnbpoxVz54q+FuunIi1PktbKc2uxehNeLNNg+aXg8A
	 nAKCtsOtwBBcsKCe+3tBrailiepRbrXNd66aSZ7pgmud1cwLVDseiGFhIMp6cwsKZFw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793109199;
	bh=rxFk0UCr50q9LEfuj3BNoajHdh0CkDRd0L4IQQCRXMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bpk24mUFMy4WNJi1r/j2KqBGEFcrnfGFBrV70JLASY7QBPgnhVgAbLFbyxgngTmu6
	 ygfJkIkk91x6uBHK0TcxtlAq9Q9KLt0vtSR6iqki+a6VSGmAagEtxwJiC/IUmb0QXh
	 AcC9cpeg0M6XhyZjNPCQGgO+1m1ZTNpL9g8pa5nUztl+a7+VIMz6zn1w8sf3+okSOq
	 5bZ/jn0djfApTX2Ejxa7VAI3XcnCbLoGWuoJZ+0jX9BhFDWD+nSjDxU/kbeDtb2JSi
	 m4P9sQsrbyBwkJDliVXOAIYfRuaogCT+sFyef9TlfrQF8KAT/jUacK26sNUfdzlA1r
	 a6eTf+wGbz9Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB2940740;
	Tue, 27 Oct 2026 13:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 824974BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6504080C0F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GZFC1KvP35l for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 13:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53E9880BE0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793109196;
 b=j+LeHXZxYNiEYOfPkSghk0YmiE379u9aK0r4inXVGOc3HIqYQsqnospNDaCrb4F1LoVC
 YWeaaO4OYJIuC99nlWvquQQ4IiGusIgMGoVXuVbW9EWOlQlX+Mnwzz+WGXiFXZ+UsJuK6
 ymKNvPS69KO7czD2IlTaaRwCUUttMpnZW63TWIy1RPDVN6VjLJKZSCp2uJ/Fs+I5FOv5S
 3Uey17eyf0ffbw6GadM0WMSmjpjsIbCE6oC86N5qhF2cKilRy1KfLz27bcsKSVWJjT5RZ
 FN7B7R1x19HzyKy8zuoGveWlpEAk3ejZPsSzXfMvhYu3cvFjONNLACf09Tw+sYjIFvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793109196;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=cf4hwkCi2d0jNE42C0hzM4uI4/ifem61abcFy0tinKQ=;
 b=FDGFrQuMIqLg6zyLVq5YOkkjuwEmNcvED7CoCUCocapappbJma/BXrDpdM3P3sZvDNuH
 lMP2k6Av2qt8kWYBfEtnEPuGuvvuD902E9AEz+BkiGXNx2/Dvpyf785j3YfZWxjjLoVnl
 hQIlR070M71vDvPA26K4cPr0LszGXFUmJX8CrCs2OZFSB0cLaRUX9pMKC6Nma8BD9VQ7W
 fzl10hq/V8xuQyTkZwaxbOkOVTeVtblo/W/GMPAjmUB75dY9bMc9gddwGuWs2+RNcilLP
 pmR44gn8RLOcxj9DrJMjf+8N8E81CxPQuQvT0bn2DU9o54BZ0hA74hV3lsmExaZ3OMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bEhnXS7c; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53E9880BE0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C8BEB97A2D8; Tue, 27 Oct 2026 14:53:05 +0100 (CET)
Message-ID: <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
Date: Tue, 27 Oct 2026 14:53:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <auCcCZK-kGH25_uM@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27/10/2026 13:44, Thomas Petazzoni wrote:
> On Mon, Oct 26, 2026 at 02:49:53PM -0700, Florian Fainelli wrote:
> 
>>> If we were to merge something like this, we would need to switch to
>>> out-of-tree build completely, not just for the specific
>>> <pkg>_OVERRIDE_SRCDIR situation.
>>
>> I wonder if this makes sense however, not arguing about it, but trying to
>> think whether it brings anything?
> 
> For me, it's mostly a matter of consistency, i.e all packages and
> workflows work the same "way". I'd find it odd that specifically for
> the Linux kernel package, specifically for <pkg>_OVERRIDE_SRCDIR,
> there is "special" mechanism in place.
> 
> You're focused on the Linux kernel package because this is what you
> and your colleagues are primarily hacking one, but I would imagine
> that another very significant use case of <pkg>_OVERRIDE_SRCDIR is the
> development of end-user applications, for which the Buildroot users
> have the same need of quickly iterating between making changes to the
> code, building and testing on the target. They use
> <pkg>_OVERRIDE_SRCDIR for that, and would also benefit from
> out-of-tree build.

  This series provides exactly that: if they set FOO_SUPPORTS_OUT_OF_TREE = YES 
in the .mk file, then FOO_OVERRIDE_SRCDIR will skip the rsync. At least that's 
what the manual says.

  The only inconsistency that FOO_SUPPORTS_OUT_OF_TREE is only used if 
FOO_OVERRIDE_SRCDIR is also set, not for "normal" builds.

  Regards,
  Arnout

> Even though I admit the size of the Linux kernel
> code base makes out-of-tree build even more appealing. But I would
> find it strange that users experience a different behavior of
> Buildroot depending on the package for which they use
> <pkg>_OVERRIDE_SRCDIR.
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
