Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B0606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z43b2iDj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49556405C8;
	Sun,  1 Nov 2026 16:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpBgR04Xrucj; Sun,  1 Nov 2026 16:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 50556405BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552306;
	b=tcgxLFzZEK0jabRNIYJiH19S/w9pKmb/YJpkjao731EKXuf3hLiFQi5g5CM7pxK8+lpO
	 2B9lMHDwMkkwGL+f6q9LZ8n8JQmJI6SLh1GKZr0JKR0PR8zodZOS4RoeUgodMWnNIP7Ii
	 hIPeKd4SAEKlCVuOe4dVR1B3zDYg4hodMogwr+KWf2A3YUbuQu3L6co4TP7cNXcJPwRWz
	 alIVqQRnvgefD1JFiTNzE3Eev3ulAfpJBfZ/0fJvoIlpIJcMHKpQi/SR9/yx5HzLGQ4ix
	 8g17qAKDHkygy7U0siphDxJbKZ7ApLx7FQgTaG5o2kM/nAAv/bR1xtK3n8bJRSxtJOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KBTfF9UWl0pUu8saT8xN3GAgQXQGsIHwTsg1a5W7/c4=;
	b=UTsb9zHUYKHlj1Bc+uIEEQGLMWceFmOfEW/S0fJsZx4W28I1dQJCBEQkKoqu4PAv8Xis
	 ygEs7qUsZh5/gS1BWW3VldfsJrKtwiKaeSmTk3XYvS2cDlryrTYVyZ5CvIgEVFQUbAqVP
	 Y3uS6P5xWGZgrHTI7mDcHgoQY/mgQHPVj0PlP1hdQnprasln80F2OsPS54oKNSwqK3dSC
	 TlUlRzgjw6doW2/HRLJO3qF8fDdzEww3rTLyv0NFeuS9VrXTz96dvCWlhiTSaENBxpRzA
	 hBNiuauKKrYiNgaQh8zHppoTEzOCwcJPiaXRDRQKxxC2Jv4wOskW8Zy+taGFwkFedfQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552306;
	bh=KBTfF9UWl0pUu8saT8xN3GAgQXQGsIHwTsg1a5W7/c4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z43b2iDjJgpY8N+5/4Qnzbzhdt+PM8AsJpLaD+UEwsYIIxae0YCfN1b7ehbR5mmpm
	 MZ0uA5DUUcsQdBKHgp5ltoULqjmZzOGLcszrEHqm+ZSnA+XXIaPnexOH6TtkxGNwZR
	 RFUg1TYi7zxe71OsAKgVqKPo1SiVpD5zT4Si6tQ9gRI8GxhoqereGntbWMu63y2ENe
	 aI35japA/E5vXF0oXZvlruOMHB8tS++RaxDR2WNJCx4g1LbbyFd+t+7TzNDzFIuZU3
	 PhKfZmN5pjPt2kKqxAgCNuGVgYHAEsRFjrZwGX6B/XPMV7AMT5/UMOgMG2NJJ58EIl
	 t8yGHbyEJHt3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50556405BD;
	Sun,  1 Nov 2026 16:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B353380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71259405C2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9sgjBo37JEh for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:58:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB001405BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552304;
 b=IcswP6di/jrwg8xdMNtonIKRLo7sIY+Ht+LYQPyrS8zNhSMbiInoD0d87BwfaHLoiO/E
 gQNw4DQ4catfPu7gBz9TaSWeEuIbpK90gRNjZ1DRz9Iz05sYx1pdVmzalF4iRBXz7MRMv
 /TmBv9F3UC3+E05egbl9UQK4T0DxJqVxAAMScBuEPH+VPOMlf76P8nbkH8icfLiTIqKNX
 1bGry+KSkuUF926m9UCnGWgYkbq6AfD0r00czBM+o90h1BapRccC3AEz3e1j3vSJPdz3L
 ASMDc7Gr44vy2PgeXl/SCk3Xdugx2XWwzwiFEONXWTaBkpACLtxkB6RtrGWfdK2PTYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552304;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YxUKEG1PdANMr0ipwwQwxrWeaXrT1Ax+reca1xNr/2o=;
 b=E6J7MqwF2vMJmo1buY0WIfUxCXmLukKVjKNuVeRmVwai+9Pxqr3ZyGGGgPsdpORzFU2a
 yFvsCb1KAH7XCOoZ4WJfCy3Yq9LXJ+2pxt1Ikmw/tyVLnyYxHwKF9tIHBCqxayJNvTfPd
 uQHonSPNfSUHSXpL4K4iPPtoleueHrnuUaD4jzrbEqVDg6r5+zNmQ9Bh/cXTI0/P6qO6P
 jMZReQl7pHbKBxXSXbdl+xMiZdX8kIo7XBjcazL9lPA/SFJbIjOPPsdyT5IaRbyQCrgkI
 so9d3Qc6sGM1THEAhNMZPds3V0svVxXpWOFw2rkbUPxGdGskDeVt1Bc7F6BXFnU8Mgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="CZMN7/kX"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB001405BD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4BD711A1355
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F7C660750;
 Sun,  1 Nov 2026 16:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C91551032912A; Sun,  1 Nov 2026 17:58:20 +0100 (CET)
Date: Sun, 1 Nov 2026 17:58:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Message-ID: <audvqMQ-Oez7K2Zn@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-5-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-5-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 5/6] package/opencv4: fix build with ffmpeg
 9.x
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 11:45:33AM +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>

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
