Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AE606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ApFktK0V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213F8812F5;
	Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2htJj1oYU-tV; Fri, 30 Oct 2026 15:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D98581780
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374089;
	b=bMED8FWLWKaIrmgpEZAz/zkPVxfQesM2r4WT04sHN3CiwP0UTNgTLzPG7cbXPcn1K6vM
	 a/nHs38wztadB1+BQoXSU416hlgWDNAwTdRAk8Cqbube1hj4rY0kKfOc/SQoWb74U3nyY
	 Og6Ai7GhNCJpjx+OkCGSZfohWDPpoRdW6gBHelOv+krIGclm4Aa1i4UZ6kuDTi9C+lNuX
	 z/skJ/bn7+sIgQbvlGjWlOppLVqKQ0EJ1cUICQagvyFsOxs0Q02qKAsdMi/JEauObisIE
	 JLuiDTVbpZI8c1kDQu4n3i18kJ6F7NBWcYAvQ0RTPTY9hoQTOyiugRTsDnoVJCl5UfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6MI6NOc8mk2Y1dZAXZojSV5sgDVURCW652swF1OOCg0=;
	b=bIU92xMSsesS/IR6H3ybmBtPHfpvWprnkPs3/UInkytRvkmJbC8grEDHeVN2GdA6uk2z
	 FHv660DVLDQ1BFMF0hsWG+5wKPiVHn3ppyqLpQbBp7I9TPtEvLgKocUOY9nTPonTnS7L7
	 6lgzgVtmMf5jpg1dFBEfhjR8IDan3JYZ8Ck29I76TNtHQMlEqIkB1ohHi4ZhAsndYyRhe
	 pE9G7Z8GKeG5kiWgqHaAes0Cai4KNh3vlbcit0S4WD2FrY+s4ttgLUoIFXINz1Jzn+KMs
	 yVW0cGPYfsQiK32rABCgxO9jp1XcEbIZfpZ2FiNzjlo4TIBfN13dKcbi8TGsZ25mMVA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374089;
	bh=6MI6NOc8mk2Y1dZAXZojSV5sgDVURCW652swF1OOCg0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ApFktK0VnrHr4PX2f4/j4l3cYS9piIkA1aSo5sZTPMKk+hZrZaUDma6EwinBzH5hn
	 zybO1P6epzgnr4lWtTu6ywzhYHm7vWIv+21WJ59J+1DXfPUgJ+uAw7n0jol9tF2Gcu
	 wn6nWcRPL9UU+6z98M9jpf3oNEIpsjJPaUmzjkOfZ+3BPAYBgHlkBCJOXTkwuaFGYL
	 v1UYcxbQGyWrfIxvHS7OTOqOiRBkQr/OpMpcbwcdXkzJTasnkfAucbRWmJPpZXTaBX
	 OSFYocrj3RtM8xRvjXdRHKe2e05F7VNOLuhXB1p2kGmJs7OxM9GtFBmo0v1I9NzDzS
	 zY2+642709+/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D98581780;
	Fri, 30 Oct 2026 15:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6BE235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A598260B0F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1rACueYUTOU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76F6360B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374071;
 b=HJ8kAduvKpoHp0kAl6ZaGKo+b25c3MvXo89+AoPbAW8xVkwpnWdryOMGBdV+7njNE9Xa
 2ewpGv8uSC2t4mAb12ph+3GHpN+EzcGYbmQ2WNq4AZSsK09bXOBloGX07o9uBv1VbSmVL
 6Nvf4gov0ywLAqdy9gNw16+L3FrZBPzBsUrJ6u05LgTuqLTIu+RjeFQbFLKuyEG8Vd2gv
 oBg8gz+nHttLOtn6wULYKmH+Y9UXds7lBFIVa7EOGuVFzA0zgVMDbM6kxI4AkUIQXxTYx
 lYOhw/X4KCDUaygtu3gvY+aACK5qgnB07iViBZl6hleTYox2wsgPYc3BgO3BuV9Cogw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374071;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=G/zrS+gvV9Hw4GJvAel/BmildTgF4Hg1GKdzW73aRtI=;
 b=SbANq4VnnWwcAo48Inok06sqESljXl0MTIhXrpkgK1ob4aMP2RZJqPXFE0IxlofcyrC7
 lTzgOj7xdq9+xnN96oQT+pD1JfI7vfraWddNu3TUFqa1pfgLyKbZ6PrHvhKGMAU2i9vYG
 ByKG8PceDesxqzGr7aiBG+zzuCojIfOxUfS8IcMCTqj25rwmtTKBPRaDquIFkfuu96I8V
 iYQFNe+R1bL3tMmscxkC4LRR13k/n/MWAqSufvXlLvFR7WIRHgNBXPzCVVkdSPSNLK+2M
 rnZbgUjCIvBrKILpY9GhlNJdVisJ5jK9tJJGil7BqZrDEil/U/8pxOME1qZsjNGi2Wg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K22x7oXd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76F6360B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8727175e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374069; x=1793978869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G/zrS+gvV9Hw4GJvAel/BmildTgF4Hg1GKdzW73aRtI=;
 b=0U9GdCom1yWzDMS3syYeea+rRBpxC7czbunZR61LqO+I2bX3YshEJFOodCkmlHR6kR
 c8RsvokoA/E0bgvFCfbngPhsQxUbh7+TM6HP6GbBwzDqkY3f0Fy/MUSRGM5BXRdnPg0w
 TArsL/0+ZfAcgqw3YbMQMZ5vIkmPg1i1uSvybnVur2OqKZhw+Xlt9OKVA5tJaytlsqrh
 APG+uIGJ31FFsmezUIUSJQ+/SDTkfy6uKWrBT0koSbUbJ/d7xx2T2bvb0V2xuCTXrAb2
 0GV/sMWhvCBUGxdzCBLw9ueoBBFQuwgcu3j5ibkbZ9huoduo4nTmeJ5yfN+hLAx7GXZj
 l3mQ==
X-Gm-Message-State: AFq9FYJRSUY5SsuNqjW2ccCs/Jr2aBbDBM2ziAexbCG7kUf9nDHAKOT4
 rGSeqrOmRSAJw8aU/vEsjeIY2KGULhydi2j0EOFxpAWy+338rK60khkdhxVeLabPJgPS0o6Nws7
 Syvv4oPw=
X-Gm-Gg: AYBFou3+LGaefYzrV1tO5Y7DXspiPhwbtSV3Up+vVHt234OOhnQuwh37mImJfq5ZrA5
 glOQ39MkIoOvaYg4DvQ86fYe7XykK1KFjq/T6k7y26jQUOffkci18sh8g5kSnYA+jiuHmZ95MMm
 HlCDWvght1DhT+P60bfkvCvNupQsfbEpF1EXPphCwUBRytffbjTYq8R4cIaQUnFOduwa0v2tcnL
 0gISuM2I+TuBl/fjvCpc6MOJ0m76Oq1Mpf8dSmWLFTKzYqyoDLouAAhP+i+SwfG1o34ngfnUD3g
 RywhBYlTT5u12nmOBuKqipOLGgoF3b2K2rtGHFuBZZnzG/4K1nZfc1Sm/v50eelMPg5GaYI+Cmd
 v9J12uVumbnsC67dOoFWSaW9dOcTXm/W+jAugZwzCG9SlgsPSpd8BxQtI1tN1WDMfiIL22PFKe+
 2XDjwZWCRpjKx1gRnKKdH+OprqO4NzlsQhlv3nz1MulZbzpwmDV5444O67ylxUAa30DekX8fmh2
 wqmwARLtBhvF52mp6Tm0JvI8srif8m1CE6b2tTmQw4YbuhGIHgw8joQm8/bfpR8rh5ZtEATKje8
 POpqu1e4XP496WFL223igkUihMXWjheoHJEZsdeyJqKhu7lNxHlCs6Yit6qUIWnK2ZL16SSA
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr59655755e9.11.1793374069133; 
 Fri, 30 Oct 2026 08:27:49 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f04785sm145292055e9.4.2026.10.30.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:48 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:46 +0100
Message-ID: <20261030152748.1906962-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021183533.2649298-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xxhash: make sure installed .pc
 file is correct
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The libxxhash.pc installed by our xxhash package is incorrect as it
> contains:
> 
> prefix=/usr/local
> 
> while the library is installed in /usr. This causes for example a
> build failure of libplacebo when xxhash is built before:
> 
> output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include dir /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include does not exist.
> 
> The problem comes from the fact that the .pc file is generated during
> the build step from .pc.in template, and we don't pass PREFIX=/usr at
> the build step. To fix, we pass PREFIX=/usr during the build step, not
> just during the install step.
> 
> The problem has probably existed since we started installing the
> libxxhash library in commit
> cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
> staging"), but we tested in 2025.02.x, and the problem exists so this
> patch should be backported to 2025.02.x.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/xxhash/xxhash.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
> index 51bf6ce855..fc2084c878 100644
> --- a/package/xxhash/xxhash.mk
> +++ b/package/xxhash/xxhash.mk
> @@ -31,7 +31,7 @@ endif
>  
>  define XXHASH_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> -		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
> +		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
>  endef
>  
>  define XXHASH_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
