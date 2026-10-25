Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A44606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YWcIkZYX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7958C80DAC;
	Sun, 25 Oct 2026 20:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QB2Sd14QcY8W; Sun, 25 Oct 2026 20:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F27C80DA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960786;
	b=F1TSOACfFArIrtUEU3HYQn0sxmylPzNvLv0uSoZWnEMO9M6JjOc1O0OkUDsXicSXCE8N
	 N6A6jzszMb+fHg4ec6iz9K1Txn3SSCz10v2PdcrbYfvWe1MPwWsa9B37fzFwmu0lQLmtH
	 2id9ZzzReauMw4uvRdZrwjc/nEV9/RNmdqkGsVnnC3D1vhKJ2tk1mlQ1Z+6TpChylQomL
	 nv91SUpSJGFUK7VS1C2BN/RBZ1RmGP2naSIgxTK0gm/XI445GSFDKuhDIJ8k8JYks99E8
	 eWzNVUZppYAnR2zLcqZS+WU35Ou9/8akJ/JYwJt5RI+a/kYTsJ73JXP0PO5S/QNNMYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fkv4DpVcRlpdLWNVO7Ykf+PxsVVmQ8UExlelTyJoRCE=;
	b=mvYHeYKaFwXWzf7fFCnQY/xS+QcCpmqoQ7pcu1UKH4rq+TxmxKQM8bSsTZ5CEaLo2VnB
	 Kvsm+O4XymUIvLFuQS61QKvvHvbKwFuK9XfcmXvifK+Mnyb6NzJjtupZc511rBqlm638L
	 Rm0OVViyNnh89pgKrA0wmXYm6l8vWm7QC8FPN+NXX5iL/TBzjPMuOr61PdHJpGbQb6ij8
	 pywup39E1xARL7SyCgk8UVJvpjLmReIc+N9e0pahDFF/fZ/CUSv40195ZCrl2C+fxpTt3
	 Zgh1/u5yF5JB5EPJg6GdmfQYvgYkBzpPirJCNH1qdf0sdyAQwl+p7DFrunTBKUJTK/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960786;
	bh=Fkv4DpVcRlpdLWNVO7Ykf+PxsVVmQ8UExlelTyJoRCE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YWcIkZYXCorHd54Axkjnt4LBtkFyU7hBU144N6JGjL0ENUsonRQLwswl3+L+LW+K0
	 bw1fnKF26f8OxWS3SHfGKWak+TBnB9JEsPJMD/hutwgJkh9Ln7j8vP4CvF/UuW2QNe
	 ZvxoHMAjMO/Yo1cHm+zUeNM6/Bi1Favo7d2mK2LWYNMJp7DPBLKkjRTCgg2SxoAOqy
	 vDNYezrZKFiwMt1+IipRPDPOSqc1rdiJGW6QX4GQlvBeJP5AIS+5la03I0PlaB+Z+S
	 xJ5cUHSAN7oql9rQw6GD176B7ivturzXkaolJglP5StxCGK5N3A9/V7Npoe/MqNYsA
	 sdVSl2MzFNxfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F27C80DA6;
	Sun, 25 Oct 2026 20:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF57356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77AC060601
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aw7pwmLxaAUL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DC9360612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960782;
 b=VNtswvePJkglaw3iBQ3e8BBpSKWD7lIiihNr66EFuU3xTz6kYLAWmNLhdAezNIsehPBl
 0gibzcvv46w2u8jecvh6Q1Q4v6YO6prd8C0eaUonlSNdeJeVCx1nngPqEZgFNYcyZ/CX9
 ifNrnM8d38T9cED/MqjOvCJC8fM/jX6KRYcx9jEDLwySk2NHwzL2Wo3/5Sdfy36XgGB9L
 ijlKfkGjHoSdCvIkJqVO9/FMnMmkVL42z0Znyqk+qp3vxU9+ClnUy3keU6rGWbJfvyrM1
 AVIihW6eCunV18i42GKf3rLaSQoLaJBT6FeZWyhG92Y5EF7skysxIsold6S/q8xvYeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960782;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YIe4wHgxWNvcXn5E4xyVv4WC2v9vCY/Mbg+086jDMg4=;
 b=GlRC3Wwlzgzb/4L90XT0dTTaM1o1p2Hxhs8hxLN0+Q58fJ6dV3iEsIxJv1GoVEbSh90D
 3Mds6daOeTjvx8/LEfQvD6880vL2PxGS1Kh5k6UPW+8IzBGpgXglJ7EeLTMbFu+QHFKrR
 Kup6gVVGaEyOpOLymqwOzNKKLf9Rl0LNcO9Gij3LbvxkKWPYXBc4XuXywen9dQuVeMH4M
 MT3E1o1stD5AtazLp6UbFbpUx0p0qSIqbhT5ThIyZ/3eA3uHennspNfFjdueWK8CIKJ6E
 MX/Km2XeS7Cl5Na4uUd8fx4zgRFJjveGu0hBilimvlyHFUqe+4N6YgaoyMzg0aXl2gA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Wq3hFc4V; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DC9360612
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8ED01C51478
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:40:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD15560740;
 Sun, 25 Oct 2026 20:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75ADA10328E76; Sun, 25 Oct 2026 21:39:38 +0100 (CET)
Date: Sun, 25 Oct 2026 21:39:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <at5pBAOlKB-uAht8@windsurf>
References: <20261025193152.2632299-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025193152.2632299-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-openssl: Fix build with
 OpenSSL 4.1
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

On Sun, Oct 25, 2026 at 08:31:52PM +0100, Bernd Kuhls wrote:
> Patch 0003 fixes the build error and needs patch 0002 to be applied
> cleanly.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
