Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAF8C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2016605EC;
	Sun, 13 Sep 2026 07:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaW2Q19c_uY5; Sun, 13 Sep 2026 07:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBCD2605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285801;
	b=oBsNYtXOVcPGMr/ta7+tDddbGt/BKCF4M3SBsMIAz6DvXJeOOfDHbtVvMGOpJ5ne3cfw
	 HVxChTASJcOgkhe8w4tyn6GF34qEi2IFL+s797MTTgFE5fIcOAC9guvPNcarkKSMeBSXz
	 Pu+kITT04d1md3zUhR41Tf2QaqVTBv0nz/0wmXf35NPZLcIzKbj1nb6mzmuyD2ThA/XZE
	 olYWlfLlPovaWIJAzFte05r+gzpBia5bXDXKWqjuDIEzPVfMuSjW8goicn/TFgax2CfMx
	 p0GSu9ZINu77cRgi5IHD2PAA6DFTNdDoDRz5kZpZkQKTjLNRjJwguYr54znO6DDN49A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=GAaz2zx5O/oaOZDuQqhtMZctxrVLDmsiu22bUCl12kc=;
	b=jH5bpE4DaPxpEsqSBIE0Dq5Aio5KBKRJHpd9JsR7xz7XyDevnUwbq5EFiCbBVd3so/MO
	 ycL9TEn+UGGdz4uni+Ew6IOF0iNiF432s7zVe3c+bIMOWX2d7dSTKu1y0rar4fpBrSpii
	 0dZvdFDNqU9VWIUAKmSPJio/ZpyGsCEDZdPx6giGjn9LZ0qLOxcKkrwFWVQjKD4WjNky6
	 l+7Ro2QrdkeEbHxvKWSrkwfrIedKnpRGIvCvWnD/xPZeFAo6ehjUMACxOHDpaaHDYNEBa
	 0Q/kufIe3jDWAwOwTTekTwiYLSr6E9w6ltmFsX5soRoH5P6LuFyZoFqK+LnjpVwZ1eg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285801;
	bh=GAaz2zx5O/oaOZDuQqhtMZctxrVLDmsiu22bUCl12kc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KS4BBBH1kVnGyRv+D64DyRUZmtXJ8jKiZt65dEn4YnBk3Dd5anAX7V7ThS8xeB3IF
	 9ChREO3WjrlxyWL+A44rgKpytZbArBFJhSNf5jhZm1bChXAnjYfCoDtRVZTHwoZfe1
	 e/b5K1A6MS+SX1yeFekJUVCQ51AhqhbIUwSO8IUpOkyy6qkXUiEO5IKNocVKa9FKXo
	 i7RU+UETOBG/aH/KBN1BRs3SZ5ojR0KynFVJvAT6bd0Ld3qUoq4EANH1QdHOxTlDuQ
	 uBH8h/+mgxn6VW3qmSBClhfLfrb1qpXL3VitOInE5S2o0t/EITQmV+FmeOhDdFRGqX
	 suYWSjQwMaHSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBCD2605EF;
	Sun, 13 Sep 2026 07:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B048109
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB44400AC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-8JMS3PIqml for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:49:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5154040022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285799;
 b=IKDM/etys1ErAAKH4khTxGNqLqnIXuEfi//E6gbHYyb0D26AzEShb/caDu8Nfyp33iDk
 F4exmuutJs/C2nus581Ytab+AHez6lZ5nT+33wrNtAUqsOinqWGccZ0XY9Q6Q0/e49z81
 acnPtn9NMgeWpJhxIdwYePGe3Y0Gs5ffldqJF3vDEVPVLwkYuuJT80Ns0Cs3+Rph0o/yK
 lxjMfraoteiIsoJjazZ0FAUnC03CzQCdBiJ9WoRvewoZHbTOVESZrcRwsaQ5787ZPHFQo
 qI5dyQTkqTWKeTywKcTildMsj39BCrWu1jPmH5JfyAJbsQoucM4pfu375ZbA3zkW4UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285799;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5gwpi91/MA2fCRRIOTCCtu3SgVe93/VkAGmo8pHH/Z4=;
 b=aR9XtNca7zhe+5LbRBQO11Dn4TVbi1KqalffknzdKugAMV39EGAdaLbxx+smibbcAfZA
 MZXbaV8OY3mlXYhjY4yM7TGQFG1AyaoPm6cAwG5etvwTciuyC/QmksQ71k7HDaEb3V1A4
 jRz1zy2GWGIsb+OgHQOBXuTHPiHrd3jCV9/zClx1k4dhcJVdxt/gA3mL12+0fPgkG2w1L
 y8IFjScM5y+3t0P65pLWTMC+rdL/L8MJA7O4QFOBYQPEu0jgM9iRTR4A0oP27U0VXlpwC
 B5et34RK/L55KB7D3qlUh90oEXom0SImwwDGx+QOdVXAsRjgjE0NUK61JfN64d+T48g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nNIFHhOM; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5154040022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:49:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4638E13F8B5;
 Sun, 13 Sep 2026 09:49:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 09:49:52 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 09:49:52 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260912204646.1547505-1-thomas.petazzoni@bootlin.com>
References: <20260912204646.1547505-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <72a11b33f062792ed97743e85682ee07@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/go: use
 BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS in
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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

On 12/09/2026 22:46, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS redefines the conditions to
> determine if a host go compiler is available for the current host
> architecture. Instead, make it explicit that those conditions are the
> same by re-using BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
> 
> No functional change.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
