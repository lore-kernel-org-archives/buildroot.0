Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA3A606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pfdRGRM2;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=GnhM7eMV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868F540603;
	Mon, 26 Oct 2026 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXFV4oMMbggP; Mon, 26 Oct 2026 21:46:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9973740604
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051171;
	b=Rp2uHsvxiXs2npZh2CKnii4UN5+C1Hbnqh2xy1i9QRubkO1jK4xfEZUfriU7qQAIThYq
	 PuMnYIw7Ntv5uTszwygfskHuKZqacp4glCcy11CCRMH15+7UA3N3LSBJW2jRzi3sz6r6l
	 9HuW/fempRqJLllPLZaZvV8WHkoj4dD8TSfGg5KV8M2ACDQlwMDQPQ9LbeOrgBYesWlLX
	 0ZeeFyDTz/RhgOoZOAhoyo8/194CwG1KhwOT6r4EGJqJkY3wRenIvfmDzwXu0i4TuY1YB
	 dHQ31SMOrp96Lsh6OdHf40J/jUaf7it8FTxSy9VLc5Y2F2uMppb88zFvfcjyI6xn9rA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ljNQTF30SRzg+FMfhJTJx3c5+iqlq8uF36oNWUZ45B4=;
	b=khPqjnaARu8ysiHbAxbXXwBgZJ1biGEq4CUCNpN6DYG7Mu8APCm6M/xFlh3u/jTIY40b
	 te76ab7CXYGjPJfTMc6/C8HvDdjPnOitmwo6jLsv009OTtTvaoibwnJCkhBGKWP5MKo95
	 yIzew2kdHQqQoGCu9C9FSorndj7quC8voIckgXALCkpGLwjudIdtHT5kjHBEXO709m6gh
	 4fx8aGhryYxEoKFPKBWKjCeZ7agvDGW3XF5swcWyTCx0s+6vL83gIOivIrDC8aRCy+QX9
	 onr2kejxzNVJASDL/xslcnXE6szveTrGB81E9CsrsbFyLt+xgurGqB2UPK0f5M3njhA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051171;
	bh=ljNQTF30SRzg+FMfhJTJx3c5+iqlq8uF36oNWUZ45B4=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pfdRGRM201rhobxu6jog3MDE+gI2QxQ60tlaTMUvOg/5oUxCcmr9cqbN1QslhrjzI
	 ATknRnuZ1yZeqtKBdFBegRQ+G3j9n/elZOsjl6cW9C1oDuR9Mp1qRKbpGy1vPTFjKr
	 T/Ewja6oCi4dS803P1e5he032GTBR5QJH+t+2gL87YYZj7r6gHoLnEDxFJoxF0HiLl
	 sVN7Lbmn8XHoskDLgKECwSN4Dk2iKW9c7TOYv7VP6IbRLaNkPAP7WGzRdWE2JWxo/I
	 82v9DRGEUpzefVx67y+IvVpPinEXffQ3RYdXZOpzgVZ1piBFK7OO1jE4fi7LIgwj7Z
	 rTvIrBze663+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9973740604;
	Mon, 26 Oct 2026 21:46:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09EAC2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E45E280CCC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUUxqz2cNJxR for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:46:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0173380AAA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051169;
 b=Nak7Pfi2ay9z08wlQKSURoZY4OZ/QK0Uma3za/slflzkV/vu3btJvCOcIKzNP283E/Hc
 6PJH9s6fIL+PZlTOpg1ia+PBwz2SrlL8S7NHpFjdnmIxX6889EPHLUim8K7XdRSeU79ek
 zw9D+EEEu6CCVRQF89debdx/ONvmmC01VeFs7XT87WhdT1YAp66411OVsRIwjNQ8tlw7E
 31WH03Ecqi5JIjMd2WjJ+8/oEG3CBo3glT4SdJBbL4vDhhiOSBK8T4mlcQwW/YYsNMjCD
 q1yZIqfEKWMCcC4YeZCo4HB65A/0vvwzVU4fS77r65GemHm6wzTjRNYPyQP0985Lw2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051169;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=FNIUg+f9kHkV8oURoLKYxAwd8IKWJmrYVjERCM5gzJQ=;
 b=hvajdmEO6xMTWELVEwQjIwvo6pfpMwnnh/BJ2HYoJjlQGb9GMu9o3BJUqSjiUdpWdn7J
 wjplI3aHPhYU3PRlJTZYZ9HQWIyRinVRrkjdYxKVp0xeiisqYzBtCuWXDi2t5ddfWqdoo
 grSmsMAT0XItMxAghyv7sou2vpRUOMbCWJqYloNpDFFoAGjZTMU9FAQR+2/KELa0M0BOb
 Pl+c3lTw5mAb6rkFLG/nEBNoEhyKTeZeuvRj41tNmBNWB7SQou/qVMKlHrfm33VnxfRLd
 FuId8ndHGtlm7VUpyRKnKtKCrQ9+sF2R2+SKSynqtixjadAaXky+Kj+PycwtejUln+g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0173380AAA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1793051165; bh=Ossgddd4xbDN6HeF48C9APrqAwyR5Nal7FzhhH13zwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GnhM7eMVRZxWDPHBy4OiiB7NtwSFHwl2cdhm5TTHPxHqMTmI87aiFlBCgZJDs55wl
 /PN1cD5v0U5NL0OILpTIc/I628D5VibgV3QzW1T5TRZ+ZwCT07bO418stPcFa9M4m0
 ynyAhTD/eqJUrsQHXctVHQNn92H1iS2Njr/I5RgEJvgGZf41cBgFoxRqBqj7suTav8
 7XiEdpEWRY1HWkIbaZEve7WF9VbRmnSfitdVrVOCuGKv0KW3D12LvC7Le7S+XVLh+0
 Q5dtTw9gmmozigU5yw1bVLjqPaQ50vmxohglW/rm+cBSizCQhhCW6Ht5uOJgvF6r+E
 ScCDJDvBUdYgg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D8B3831E0B9B; Mon, 26 Oct 2026 22:46:05 +0100 (CET)
Date: Mon, 26 Oct 2026 22:46:05 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <at_KHTpsxXu-Vk93@waldemar-brodkorb.de>
References: <at7t6Uwmu1T_lD8h@waldemar-brodkorb.de> <at8LDvBotiu7gDNY@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <at8LDvBotiu7gDNY@windsurf>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] perl packages for LTS branch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Mon, Oct 26, 2026 at 07:06:33AM +0100, Waldemar Brodkorb wrote:
> 
> > I would like to ask if it is possible to add my maintained
> > perl packages from master to LTS branches, namely:
> > package/perl-cgi/
> > package/perl-cgi-session/
> > package/perl-log-message/
> > package/perl-log-message-simple/
> > package/perl-switch/
> 
> Hm, why would they do so? 

Why not? The packages are really small and does not turn up any build
failures in the autobuilders.

> The point of LTS branches is to maintain
> them in terms of security fixes and bug fixes, with the same
> functional scope as the original release. They are not designed to add
> new features, otherwise it's a dangerous slippery slope with no limit
> to what can/should be backported.

Last time I asked about pam_pkcs11 this was no issue. The LTS
maintainers added it.
 
I understand it shouldn't be done for complex packages like maybe
Firefox ;), but for so simple packages, why not.

I speak here with my $work hat on, because we maintain the packages
internally and we use LTS. I just want to cleanup the stack of
external packages and patches.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
