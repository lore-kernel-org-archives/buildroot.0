Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234E606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TBL0OFiF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9182405AC;
	Wed, 21 Oct 2026 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZk-6vkXRuET; Wed, 21 Oct 2026 21:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C11A9404C0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617719;
	b=XGzreLso0lUtXfyR21nzb+OPdp4yMgIdteEgWqhDRW6qszRzBGY0W9Z2puu10KIJdiSq
	 WuVHnX97uvCBCv/NtylmLss5sxkSynVu8vpkJwjwvPrjiFWc4KX/Dk5fa+uJIa6OPw8LN
	 aiCth1EOq72cdS9VpqbxfrFCAcEmTnniJQHtLTFNet4uwr/XH8EOMqtofjCiqsEKVOy53
	 OaGOEVY071pjNeiKYt/SCkJPLgDE3cdoHUHwZI03DQC/tJIpgHNXo9c1nNvSkH6cyjcpO
	 S46WVi2Gbao16xB/BN2GZFteySCRDWx3TEblJ1H+dV4TpKFxEl1C3WQeNMHwFJtgStA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=W8hfUEXths9NqQ3qGjmFolG53XpnBHqLZZwZvELozR8=;
	b=g/vhTk7Ni4ptpX9N5YKcuK8iKIA2Q5ty8vGAaU4MgF2HVwfHmnEamvrzYOUoXdrKZOQ6
	 PEvpYYUGXDKA3GiKX1E/VYFvIpz2D8/TkTjDQqeE6aekli/M0Xr7rTHX9p7wInSzq4BNw
	 meWGZDop0Yt2rX8LmjDctdPrv8+cX8nhfb0w2TQ5X9scU79BH6uCZakcnZCRR7/aQjCzp
	 8MQSpaWSKY/KePZLrASXmQkKuztoo9BtPTLx/dM2eHcOQOGtLRFiEWaTjU4g7d3Al7fWi
	 gGc1Hjid4xrgEjpOShN6YLMtkWW0xzl8yi96rE1DrTWDZhnTN0QBdgLs02CISvEFpJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617719;
	bh=W8hfUEXths9NqQ3qGjmFolG53XpnBHqLZZwZvELozR8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TBL0OFiFxQsZjJFlYYJI0DbSp+vLzOwaHIeVfllXBxdF/16mSe1kKo+LpJg1RoQ7K
	 vUpFrftoTkqsvJxIh57+ZosHK5gJhS9TRPvG55Z0avjgosRNdPUmvoqDsFcM4Y0z5Y
	 2VlHyNMM7EfildE+HCONpoJte8a6V221KqtZ1ZzXlM3GuEnTzXlFYMF4R5fk/9fDpx
	 Rzycn1sowTHpt8RtpETBD6BwVBQmDc+NqvIMbqXNxrP41GZXHpyP0wQ2/Hb+lqBDm5
	 CsEbdRcDl5eWFFuBnpK3CVv43K60JZifjMomoCydbIzDUJirZeRdFY50TFXlLE9iYa
	 a9iLhxoJx9ABQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11A9404C0;
	Wed, 21 Oct 2026 21:21:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 941E31184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 920468112F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWRp0d-YnHyn for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:21:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A9BC810F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617717;
 b=bRywbrI3GhGfBoXhsWiCcz16uysL+8WVcxXOKekYmRSMe3A3og8BqW5Bxl/0ACIWMlHS
 V5f/rRJGB6C3JMeoI7CTZHAfC/gh4QKI7u1org9k2UlUq7Ubgea9B6eVdYbSyjVOsylYz
 ALTu5r7DDDk+lcy1WTRSgvVVHmX5BA2egBDBUfQi9eo1W4rXTncF0NZtiE3LxETb4SvoQ
 DKXJ3F/IgUGQIL1bWMTGkmruGK6RMj4g5fEx+CsfbEKJELTdWNbIXdlfJa205JPpqnBuH
 owtVSDA+gXXkngozOXA4BaneuypbwwS8a6XUCGiq04iJnd9dAket0z0CuGl85x7dP+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617717;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rm4yI6HdKudKpKlO+ORBG6cVovWqCqh8HzjdX99zizc=;
 b=ox1Wn6p7cQhUBxFG4zptCtVF6RLrzpcU38CqxNnXeili+3O18dk+TZne6BxNqkJVIxMr
 tSX0Iikv28Q0RpImOezSiFTP5twaeH/Lgs5LBxTJEkaD0LbBLPA09iujRfIk+inYZknkj
 EY2y1eItSrutz4Dw6yMsLQ51Efex5ye/yVpK5AMV4/ZKFg1hoWt6+UTloRnaRqunwuHuA
 qR9mVefZ8HxcLMI7PwFjD0h8bI7GAcS4DK33H0Gz9XB4w8D9Ezi0W/o+SoQ9h2EZjTNRD
 Rq8BT2cwMaoLwrD+bEMvNJenGRD/9hXa8PMpbBMqSdPivsTY+4DBEHkmacrTHNOfkqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qkyh69xV; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A9BC810F5
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:21:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 658384E41296
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:21:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2BB93606E3;
 Wed, 21 Oct 2026 21:21:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CAA510328D6E; 
 Wed, 21 Oct 2026 23:21:49 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:21:49 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <atkstjA4-icjE-BI@windsurf>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-3-j@j-ernberg.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614155328.304282-3-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/8] package/libest: Drop java support
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

On Sun, Jun 14, 2026 at 05:53:22PM +0200, John Ernberg wrote:
> The package doesn't compile when Java is enabled.
> 
> It has been broken since commit 3c66f65a6a54 ("package/libopenssl: bump
> version to 3.0.9") from 2023, and was left unfixed by commit 8dc7445056d1
> ("package/libest: Add support for openssl v3") from 2024, which added a
> patch to support OpenSSL 3.0+ with libest.
> 
> No one has complained yet, so remove the support as it's clearly unused.
> 
> Note that upstream has not made a single commit, nor responded to tickets
> or reviewed pull requests since 2022. [1]
> 
> Link: https://github.com/cisco/libest [1]
> Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

This issue has been fixed since then by commit
7e34cd7c7e5094f99ee26b24493a9007b646c3f9.

That being said, I personally don't really care about
libest. Aleksandr, are you still using libest?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
