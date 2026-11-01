Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4690C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PRi+wG4M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2517260623;
	Sun,  1 Nov 2026 22:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnbYn8OVrkBe; Sun,  1 Nov 2026 22:42:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C02BA6065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572931;
	b=XSQevkbDjDJ0N8DXej2PBU+gPpoCpD/L0UPEzXpnzPS7k36GdMAYdWh7DxixPzapKV0K
	 Awl2oW9+t7cMCLWcfB5+3JMIrPZVicwqmCO6r6SjVzJRUOYj1t/dRxoU4lC8gNFILbgwe
	 DTBqA3smO2IiS984xJ9k04DhkjELFU0oJKfaSVZLxGM4bgxOErehf+vcz3vdArbZUIM/p
	 5bEoDFKUJzw9cxAeisABcq8LJhd0P+tCY8wHHltjtIosgvGCiJrIVIexV+TYB/r8X3T4u
	 dPtZrOeV8XsdKSRUaGbT5Bmh0F2r/+dh712mI8D/sufOq5+0495WRpgLEXQhdtcUpBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K48PjufZETQCvHV15OisCx48Bz/72Ia+QonJvL7jzLM=;
	b=qYrLPrB4Sg9PgzUAqJIF/nElwulXkqWra/sfTqFlvTW8RJV10p9+MdqIiDZ6N8P9Nc4V
	 Fzem9Hri9AlfXBVxm0Lrfto5kUo66sRt9EV9a6JQmvW635exNMXVE8qVDBnbQHgNWdW0t
	 2PL7iNyfngV5zbzio+3av1D5mhEOrGESEyH49aVvWvbaqdeREuZqGFkqnZNRPrIndmJ8Y
	 KcyPK0EpYrr1wzmyvDUi59Uuk/WK4qj+SGJmRdlLOIaA904B+x9aJ7c1XvyM87904WKAH
	 VYVoOkZUB+Om2dMST/CZ/4NFmmE2t4Q0la5umMGfojXw73zrvdOjq/muDwItywoRMag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572931;
	bh=K48PjufZETQCvHV15OisCx48Bz/72Ia+QonJvL7jzLM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PRi+wG4MKTBmZ6pM2n2i+q2icJgXt7Gb9hmj+IkHGGLvIzb9bN4F4YShUlGRR9C4a
	 WMZjX66IZytQYq4y+ieJvEx9UPCR+78+EnTcXXRuhohpLdwwjy2ilLUB7mjyGQ/w6p
	 FcYe98bxW3TNEa0woPuVoe+U3SZZehmxiDUl/zhycdnFQBJx+eak2LIt+L7WLw9Mm+
	 ua3IT/40z3RAYC4Fy5Cs9svAod6pfkAclrKVoGS7UrVtAW4PYq4aAyBWRJTfymHAPe
	 4DxAdS1miw5NnBGimNZ2viTAv5gYIrA3StXdvEtKo4PEiVIWxWgs7z5NXSWnUpwICh
	 rzMZnWLUwrNKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C02BA6065A;
	Sun,  1 Nov 2026 22:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F3DE435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04E9A405C8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sq9eoeFYb72J for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:42:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B4BA405C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572929;
 b=g0bBbJhbv1XISWj1NfvDHddnuoyYZgtdxs3pH0D4QpZQBtA9xfCphqLYiksejXO9Yev5
 u6uW8jD8avI238AiF/zpYKfm/YgqMulsC/wXpbnQZlTCDxM4v5VQ0T5o1ppuXevW1Ru4n
 2UPqvW6izY9B9hg/73NVKvaEVHOH+DqxQR/udZWzBU8xIcCgPibqQKK7I4cI0L49xCtUW
 ZMaKD/BJg1/Vf7DLej+kMS8SnjOJrtSjpkZV7S8OfrE2iGgGr97kLHBExEXWw3p5bn3Qi
 HwGibLGEVTzeoBSo7mGkO3JY1aO7qvPGfIa/ShO3+luEP4+MfEdWfLJeZShD/kptNjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572929;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=jiJkplTFUiyBY2KgO4XDQv6oBtZ3TjbwVy2Jz5wM0Gs=;
 b=M4WLDAxEnb4Ii1McCq8+0M0WiAb2M3lUJL6vsxq4qCiU5Iw7yMsHjCEL4ih1RNN9NWgJ
 5TCP24xOA4jQ+s5ouP1zDzka/1kpHTbcc0oNOYw8CihHt5KZM3dUTrD5t114OfBCc8DP7
 Hy4oOkEC5cmgDQJa0bjLN3P9XteqWqt1zaeQBJUyTEmGyN84PoObBj7EnJgnopIMfd1fp
 AuKdR2FhTL+ape5cVilpBFgo8K3TOzPV3iSVn8zBWpHFCmXjp2F/kSh9Iy+uh1DpvLl+P
 F1j/9a1bzD+qzpGuchPhPBML2Z6LwQ2uLMoyf9qrx94ZgDmnxqUpEgBOQLZGv78Pm8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HBCWSvO8; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B4BA405C2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:42:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D7220C49F79
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D5D1B60750;
 Sun,  1 Nov 2026 22:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E5BA10329123; Sun,  1 Nov 2026 23:42:03 +0100 (CET)
Date: Sun, 1 Nov 2026 23:42:03 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aufAMnLVdbNdtqnc@windsurf>
References: <20261030113514.1090450-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030113514.1090450-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/newt: fetch from GitLab
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 12:35:13PM +0100, Yegor Yefremov via buildroot wrote:
> pagure.io was shut down in 2026 and is now a read-only snapshot that
> no longer serves release tarballs, so the download fails:
> 
>   --2026-10-29 19:13:23--  https://releases.pagure.org/newt/newt-0.52.25.tar.gz
>   HTTP request sent, awaiting response... 404 Not Found
> 
> newt moved to https://gitlab.com/newt-ui/newt, which hosts the
> releases, and Fedora also fetches it from there now. The tarball is
> identical: it matches both existing hashes. As the CHECKSUMS file on
> pagure.io is gone, note that the sha512 also matches Fedora's sources
> file, and update the homepage.
> 
> This is not caused by a Buildroot commit: newt has been fetched from
> pagure.io since 2016.11, and all maintenance branches are affected,
> whether they use https://releases.pagure.org/newt (2025.02.x, 2026.05.x,
> 2026.08.x) or https://pagure.io/releases/newt (2025.11.x, 2026.02.x).
> 
> Fixes:
> https://autobuild.buildroot.org/results/929378a23fb9a936487332a6c92aef78ee64d96f
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Both applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
