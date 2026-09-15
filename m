Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12DC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BD26074C;
	Tue, 15 Sep 2026 17:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxNHxQLeiOeA; Tue, 15 Sep 2026 17:05:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5E3C2606F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491923;
	b=Eo+wtWYVOBiw6qyIhk6krUixkdGxTaDvhCyybXqo9E8q+v08TSZntUNEKRe14ZosD2Wb
	 ghERTbc91qx6T/tw+h/1q/0ZIHY8KX9u1vjT56RR9TtXt376WCMg14Ed/hbBWzF6ha99T
	 Sls21LWS+aHjUHeLRL+PHV+mtjI1SemkSlkoNezVbD6IaWsySnwpiHZgrxt0r2WgL2pwf
	 SHdWjhWBRrNm0Cl51NJT8fsqUMyUylDMABfScmQYwZM75fqgINNv680zsyt89j59Y7jRE
	 XKJooiVO6K+HbDjbcHUgjo6T0kB6+bXc8jZxeuOqq6rS/JDaLmXpZYy61Z+2e1b+RTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=atCybMPsNvQG80x7/XDr/9C/c85FTKt9I2WQP/jbC4k=;
	b=OHyUkOmM4fIt3TyiiIf+GFlhbeAcdU+1alzNi2dZ7rO9WcgHtkX/qtgSrElaGxCN9ITT
	 9RT27o1Ip+ftprRRQnBOr5EJ41OxS0c5sEWFPhgNTSW5x4P4YCPyC83tTjTPPvilQgOwO
	 NJLY01lop+nrmcnrSzwkSn6f/GFBQjv98kQzhmxuaI1iIMaqI/IAUsWK6eCCAsPfvS3cq
	 X48JJOTAR7E4ygtDhHMFV9oHH4h5M0ohGAfqvzWVp+mj2U19dHXD8ymu9K/y9OcW8Rlgi
	 ML6fM10c+G0CpcwO/1pdPS63Rh+ZzwXy5otZJE1f43J0hYbOiDHnYwiCoC0epNVcbDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491923;
	bh=atCybMPsNvQG80x7/XDr/9C/c85FTKt9I2WQP/jbC4k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ryh41d/vGg1WEBI7YosDr6v+KyNxEi25PH0RDtUZjRFvogJ+aIRbK5OWV1u/VX8sB
	 y9JmGHlSM7PlpVC841K5ykLlb07AgffKiJ0gE++y8c1owdjsl+iBpXAA18sX1J+u8/
	 /0tnBaBeHh8eNeGP9QrAqsvwQREgOi9akAEQxHNR4BwEd33x27LtmA+Kjp8FnWNWc/
	 X6BG9x2eLoCCADMijswaSRgGTeP8ynecl8HLGuO499Gux98qIg6ZiBiGHFDKr/TIVm
	 hw7JQnymiNnJxglzAIB/W6hCmVjAqNHhEYrBczlKVGDe1jKP4PdJ/N500RUFO19OJl
	 jnGPf0mOiqJaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E3C2606F7;
	Tue, 15 Sep 2026 17:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F073AF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66CE680AD5
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mpdHGIiiiqd for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:05:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F10280881
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491919;
 b=BRJnh/0Z/sMLvbPtSFy6cFoZXZrX5ECIff6Wx5K/I91fMNTtzTFtea1TFn9ybAbXaO72
 Q2co5oOMM0lQ3SBDK4pNu5olC47xmWgfz5+Yu7oSnRDN7tl5iC7Y2SZw0t7RZv1qTncZm
 jXFNySf0HVE12X9COHjYkzzoPAm60hgBb1pQ4IPkm2/f4Fy1kInE9WmtCjng0+1UMi9CN
 rB0W1t16ZOUOIQJwNGtXQpb8nID30vMJJmvDxwBmwpSYwZ4JQMOeCA7llqzgHBlGKQj6i
 9ceK9vFVh4g84XwA87nJxeo0UDA9mNdpAbeIPDAK/SpD1eCrR8ZpgEyzcKqKwP1dj4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491919;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=9Z3qc4n04TxlJ5krtrkLFFCzqIrD/Te2GujFBB9eEG4=;
 b=BnuzND166SVFhCCeUVMX54qGT9lNB69ofntC9fdRvxT577g+yEP41XD1cB4h3lC0mr5F
 8iqmruPfJk3bqAWeT4WFUrMCR2fNMu3eEuJ6P49FU9w3GpvRqxxsuW67Ao9FuN/sPVJZf
 0kbPBH1hcPt9YrmsuGeYDhDpBhCeJtMlhBHwBLTFnoYaMNbyxCjGRikatWk7ylK1GZNrl
 v5bgCRdrUHB9N5McBM+v8dEjMLlW7VVipZLpH2q7HUw9ona0O3VLLrq6PejSq37BwpcO4
 a64JkiJG2/347q7vgss+JB+vaVaWwsY8HmNCkyELVSLObGwyjrVBxY/tUn3ypF4wroA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QNqIlq+m; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F10280881
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:05:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4262C2003CC;
 Tue, 15 Sep 2026 19:05:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:05:14 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:05:14 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Alexey Lukyanchuk <skif@skif-web.ru>
In-Reply-To: <20260915095653.279455-3-thomas.perale@mind.be>
References: <20260915095653.279455-1-thomas.perale@mind.be>
 <20260915095653.279455-3-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <0e61844124b137abf9efd42d477348bf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/zabbix: fix build without libcurl
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

On 15/09/2026 11:56, Thomas Perale via buildroot wrote:
> Building zabbix without libcurl enabled would lead to the following
> error:
> 
> /usr/bin/ld: .../src/libs/zbxxml/xml.c:515:(.text+0x1c64): undefined 
> reference to `zbx_vector_str_append'
> 
> This issue has been addressed in the upstream commit [1] and backported
> as a patch in Buildroot.
> For more information see the upstream issue [2].
> 
> This error is reproducible with the following defconfig:
> 
> cat >.config <<EOF
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_PHP=y
> BR2_PACKAGE_ZABBIX=y
> BR2_PACKAGE_ZABBIX_SERVER=y
> BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND=y
> EOF
> make oldefconfig
> make zabbix
> 
> [1] 
> https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/e8333ca2128
> [2] https://support.zabbix.com/browse/ZBX-27635
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
