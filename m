Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DD6606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AL2t/iyv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B43E60822;
	Tue, 20 Oct 2026 07:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFWZFFg1zZmI; Tue, 20 Oct 2026 07:27:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B040860808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792481240;
	b=NOLL6NKWcfKr+CLQl8Ljuthhk7IEsjkmHpPBkCnoF5qK+4C7N/faGTt1ue6+Fu2Chz6O
	 TE57y5qmiUz9/OLxki4r568KUNmfiqv6XGVwPET4pzfxHDCwJR5Ij0T2IuPyZ5149lt7f
	 vXNQh/wHmlErFYBDtjkhqtdk9DnznWPcEkHwo9nSazklRXq6MqYIol5DnNVlmU38lLtat
	 NZst5NdrbgrqXRwJVIb27A5Dy4eWjCIIbjY0id6CFqJGeqD9wefpo/clbciZcK/JKQ2HD
	 8bmr+ni28Qf3kGMw0pOMP9vm50BFwE3hIbsVes0DNhty8usXlI5s0UAZQkdJm7i5Drg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792481240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vu6E5z5BS+079/6ScVbBzPHNM40k4ZdHXpNwhBUgUYk=;
	b=sERKoMW85iQPI1pS76FK22hHSHg0J5kve7dZ0MikiQQYTOaQ13pq3+Ao2mzVKG7G0Oc5
	 yLL/0prtrETmse+rHx+23jfF0aIjy67/lTI7qycM+0ZGbdHPWSLH2U2DsyFR7QGG+yqNy
	 eWysg+vm6hv9AZa06BsUvUFiKI42jYLRffTDThsTJxbWOK1vDvXeAIPwH0v69p2C7JhmO
	 00x/WgBSB5AQtA2GnGEDxQFH7bTM2mRCc0vn161L2A96Q/xyBEvKJ/4sKtAW7LGqtMHZD
	 zwPhZMItzpXm35Be1e9AmI0bqbIlSVhTc7UO0oTGJxQ995LSocP6hwDh5ubvLSyAJKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792481240;
	bh=Vu6E5z5BS+079/6ScVbBzPHNM40k4ZdHXpNwhBUgUYk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AL2t/iyvUSvn8j5mN3RmuwKnIZ8NN2jC4FGd8+zQyxiBEN9gkpsPZlloGxPXI3HMg
	 haQ1XPzxzL6KU7juCjya9q8EaH7svFqKVpLTBiZdODPS65ekSji0cJd0/CdeAhhHzJ
	 V4uKFWHs1sWuFzVYj4yR6XLIfo5tM27RpR/xGhlWHt0+bEJWBlIcEDh93PIMI+sP2U
	 Jj7JIZoQrmfk8e9TnSUb267Cf5H6J8TJeXi/SC+V8kZYNgulWmPi0kBWbuhM5qzRfn
	 8xPUVoPFTErTmcsNL0qnWYsRxcNu2TOPGby1gCTFekyiOHNV07Qr1ieoGcNKTZYK6m
	 cK9AnISKIzHIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B040860808;
	Tue, 20 Oct 2026 07:27:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 916B823A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 772B940328
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_VNNeFgzLGT for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F0BEF4016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792481238;
 b=YfCT/wVMJogRYDgBQCQ0JukKZ/ah5ny+7VlY0SUegzpE6DX/CP17WQmpESQuH+Lhcupc
 TGpd00B3rRfWB4zF91BVii0eT+iHQnJZO2sJSKfoCwpgHekFXOZSKfUZYPhXYEcP1G89n
 z0c8qge+quw5T8vFej6yv5UXHe40wSAZoaVEOr/5lP95PyepBM54PxhBVcdgjFVm6QB6+
 rIzNbbIKNBfACYpcOArnJS1OGtppZ8mEMZQZrjlybCBoZxXUh5ppDgKliH8Gddi3HyIgP
 xWDvQX6Imw3Lici3RNiSyFlK+uEs+XbZURy85ZybC/rx7kk+JR9LtBzm3CKQbuuCojA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792481238;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tENRP5gMmEu6fAItoABgnnWedpCVuXHX6B8vICk7w2U=;
 b=MQyRg452F2K2guQV8ltaae3BP6Fh47M1funngv4pgCv5Yvo5caez/LwINYQHKNJ4fYwY
 XsoN6am6Y/67gL/q/6jbvwfXMujf1w9ndNiOd6nUvwLjRlV+QJUjYPJruyoFyNYHh61MG
 w+3Dyklkj0XFApv+Zyo9Iv8IX9UyE3lT4QwDbpdUfZv8cSfyuHe7jl+qcYhQQII5DrORi
 DLiKauaRt/+ZX9HMDlfwP7JcyPuXw4Zi5rimzZ1p1M60AtOWPR9W/4HCNsvavQF156o1T
 Fg+xhBR+ClGUoHD3MC1IJ1oXYC4YC7mHL7yoGtZaEaz5RIoLE0z/mo+PKxJuymdtTtw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FtDihIw7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0BEF4016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5999B1A1290
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DA1E606D2;
 Tue, 20 Oct 2026 07:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CBA510328CEA; 
 Tue, 20 Oct 2026 09:27:12 +0200 (CEST)
Date: Tue, 20 Oct 2026 09:27:10 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
Message-ID: <atcXyVZESLAFzjUs@windsurf>
References: <SY8P300MB0041329F1DE99C028DCA8064B5982@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041329F1DE99C028DCA8064B5982@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/btop: fix build failure on ARM
 Thumb-1 target
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 12:24:00PM +0800, Fengwei Tan wrote:
> Add a patch to add CMake compile test for -fstack-clash-protection, only
> enabling the flag when the test succeeds.
> 
> Fixes: https://autobuild.buildroot.org/results/573e0fc3178f8c9a0583bf86a678caa775410ef2/
> Fixes: a7d47860f323 ("package/btop: new package")
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Applied to master, thanks!

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
