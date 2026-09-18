Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A339C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C808812DF;
	Fri, 18 Sep 2026 21:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9XPKfMjozZr; Fri, 18 Sep 2026 21:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2124481283
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789768243;
	b=HN/sbz3wBJrGW3bxPld0Qj0Vlw+LP2RIOtZadTsvQEdxNgQTK7GLp+eOUiE7KLcxrpgy
	 LyD9OrfU0rlE5EtwlYm47vdlPOOhLfn1nxFsYk+j7kAKc8bP52oEvGb0S3/u4MlL7d3Sg
	 suy9sKua1ZlsDAf3Xb7yNXQ1IwXv9/LT/ovoLSZftXA3yz5yQkofdCH/RZ2ukSXAFY+IU
	 GqjeTjOX3/gOozcXBVcmgpcW/OmqL9sUA+qq4IJzH4886/EcS6f0Xys4uwXeuZ1gNmtEj
	 XVuOWErb7qznXqhTFWEVqyHtwqVkror3n/8Rof0FTfOQx5WfKexFFwq1kbfZqLusWjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789768243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s3pZv1ShqqHsghfWowowl4v+N1VciTBbKD614rzO1QY=;
	b=U1KY1vxJlygbKR3WTpngEvFIOuvhk18DaV21bxorN1czKMSe2cevZviR2c68KKntzwEQ
	 aOfmDtCjwzxIDoKVvVe8EBbLBYCAwB8tBhHWF3CWgQZF2qyJcQyUOOPNQVY2ywEHxKR1j
	 k2bl4bvw6/YInM3eAJ4GexQa+ACQBhguZlozKlDiJLt3U4Z6h7Z9TlenILcRN7wizAWUK
	 7TVFYa/+o8CIFpSplUAZq833SYMcmthxk9SUcBx1aIfA5rT+sIFI3S3iPhhuu94qmknBd
	 VweKRRJc97r+iy6JjSRcCM9PdVFojkfxbDRwxBUhg0nOpWwkd1ho+/u/dxU38Nh7oaQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789768243;
	bh=s3pZv1ShqqHsghfWowowl4v+N1VciTBbKD614rzO1QY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IpXR1prjiuCy4/WeDfPyEwrTjoANT5MnHdA5M6R7IQy3csoE6SwL/Y//xQaPEgobt
	 wFbOduy5XTdob+MUWsa88itGymeJgM7KGd73WLPtbmBmbJiIF22b49zuLxUnGfZgjZ
	 UncK8VdrUM2AoTRFuFwtlOTUWfuw5nxG+2HHQQ8h9+DWVEZSffGCUcdVWxqjyxK66q
	 EQRCa+NIvaXM+L2VcmyvB1GfAeKt9ENylZ1ICzyMQ8nNhcHulmhuZhDyPq3hCtrJuV
	 8NAsiIg7nU0Cp0e8gQODyfqNbCNqwgt4cZscIYhUzI2kpuUETnjeqpwBG3dTk23Yhd
	 xp8nfAzkg9ETg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2124481283;
	Fri, 18 Sep 2026 21:50:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE6513D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4123C400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X4ZvfHN4tZg for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:50:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C4E6540022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789768240;
 b=KOzVoLFGYBY6T6nT9vWuhxEKtMJFnYYpZRxyv7f93tcNvjbf/8v+by0KZPkFSMCJ6gy6
 ac8XG6+V/lJotMumR8EBYUNEiqOWJCyGKbfeiIqUZP8V4tYaOkpCVuAMBvSZe7iBz7zW4
 cGRB8w1jLPUJ7LfSf94/p1hu+OMN2wxrlBQ30AamTwiFeeUTvFZnmP6t2IUZaKBMC/eBN
 UU3fRAA66GAmTaNgftwcz5RYy0Pf/t+6MDxgtkSFmRb9zIYJGJ3SlaYwrZj7y2aD7MTAI
 2CPT+jEkh/dV8qkp2uP1zI2BmOertKXlS1gfl2/Db+OF3qf1deWp7hFkfoOLpham0pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789768240;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=8hXR4uBdEOYxt5GDtcN+ZLSsiTpivsh2a4v7YObiaUY=;
 b=KKlZ+hGj1PqDbZJxRhvmVR9NoIo0HTIFijPjwjmou4XMXkJLkUJERkZacxXeYW0wvBJh
 AmpMMkF8rJNxF/XmhxKXgZLf9JMpKlZm6rXF1OmFEXSu9OWTx+yU73zV24zRV9kNlT7O8
 Zffp4Yf3QyLkyssbS7H1AHEw4ZlZQ/hunKUaO15phKMYja7L0OfBdeNSAee50koznEBKR
 BC51EdUTre8lHP4LLmyXB+E1PSMnUTbF2opD7wc0T3sqv46TyEPUSWfcJQR+cYZFclbvw
 S5/JaUeYIP2R2l3dHUpcZX1pPcdC0y1yZRBQYtMHVE239M35qIWbz0ud81YZw5rTaCQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DxzNiiz+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4E6540022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:50:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8A3391A09A1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:50:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 065A360649
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:50:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B50910328ADB; 
 Fri, 18 Sep 2026 23:50:30 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:50:30 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aq2x6HGQM74iI6Fr@windsurf>
References: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
 <20260907-fix_openscap-v2-1-28f8f6ee3248@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907-fix_openscap-v2-1-28f8f6ee3248@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package: openscap: fix build failure
 when crypto backend is not gcrypt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexis,

On Mon, Sep 07, 2026 at 03:47:36PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> When enabling the openscap package and the libnss library _but not_
> libgcrypt, the build can fail on the following error:
> =

>   ../src/libopenscap.so.33.1.3: undefined reference to `crapi_init'
> =

> The issue is due to the fact that the corresponding Makefile
> systematically forces -DWITH_CRYPTO=3Dgcrypt: openscap CMake
> instrumentation then searches only this backend, fails to find it,
> assumes that no crypto backend is available, and so does not include the
> crapi_object in the final link step.
> =

> Commit 7c85f3adf4a8 ("package/openscap: new package") took into account
> the fact that openscap isn't currently able to build if no crypto backend
> is provided (see [0]), and so made sure to force libgcrypt inclusion if
> libnss is not included. Since then, two fixes ([1] and [2]) have been
> integrated upstream to allow building openscap with any backend.
> =

> Do not systematically enforce libgcrypt anymore through WITH_CRYPTO:
> rather than testing nss presence, and falling back to libgcrypt, allow
> both to be absent, and so relax the libgcrypt dependency to make it
> optional as well. Bring the two upstream patches allowing openscap build
> without any crypto backend.  Those patches can be dropped once openscap
> v1.4.5 is released.
> =

> [0] https://github.com/OpenSCAP/openscap/issues/2310
> [1] https://github.com/OpenSCAP/openscap/commit/d12d820a9493b0a0ee1ad4b0a=
eaa87da28aa0080
> [2] https://github.com/OpenSCAP/openscap/commit/5b858d1786c025cbd50dfc284=
b252c3ee6dd99dc
> =

> Fixes: https://autobuild.buildroot.org/results/4c905c1b0ee384149c3d85e8f2=
ebf0af3a12c2ad/
> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Thanks, applied!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
