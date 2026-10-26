Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650ED606A31E
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A73MIeNG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C25860737;
	Mon, 26 Oct 2026 21:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI881oHasM2U; Mon, 26 Oct 2026 21:33:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D4A6560661
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793050438;
	b=CHvkntXjE3bXtsNIumU7Nxs0rhrBXUoXWFilv2qzwpRGqr0rmEon6b7sRhA2F9C9uJsb
	 a9Ur/VfaMYOVuiDzDGUnxVHZsFJI7y4/V+GIrd+adk6o+NtUkVS2E1PA0suurqSlY025C
	 eYX8UfFhk1y5asZ8yHQnWnCT1TDLjyQfHbOTFpXsQNd1n8FfMPJNuuHDBcHfAenVAk/bd
	 m1tBvoNNIpQOXuiAq/OF7csKqdMhAvQPoAXvbx6v4ryiDilE5l7yDlpk+F40ZcRiW/OJQ
	 lMYxINLu84dH+n+WegmPLjPDC31UK0tVFKNe8EWdKY6oFeGaYF8/sQYoOw9KS9loaUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793050438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QY8a4jTGo7bxJA0Fl/62a4lSqQjdrA41lL7JX51yOOU=;
	b=U6u1Kba6mkjX4hZGU5srYAjM1Q64izAXXu4Kv4yqqMYHppA4inoKnf6UFOA71UFq0Ji5
	 mJin97SgyU+myo4Eiv5UragV+ZyTnIp8aqBF5vSoPxuHdX4yfCzIv6zn4FpZESZH8IFUX
	 5oKl2pkQHDti0nij0HZpi6twCm3S0+OM7nz/K7Zytimle5S5x48Hhp/oZZwN8s6wWevS4
	 4muw6yt48UrCHgnz5uibmkODAwHaJsmX186lRHVPukEojOqtY046ZkmUqvE7TbJGw/ZnR
	 Vdwft08TSjZutTWBBhCJmrmr+mnwNFhJiItFiqr/6T2BOMGiUA2Xjs8UQrtngTGqJ9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793050437;
	bh=QY8a4jTGo7bxJA0Fl/62a4lSqQjdrA41lL7JX51yOOU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A73MIeNGZaf0xPJrwGtMeqIvVCHU3PIa5CfmaIV9xkl3TnmlXlrHaJZripmlYmGne
	 /czHtSyQ00tQkhxhQcJORRt/TflAM+mavL9rRR0pazaVQX5f360RzJUTqc3yTcSrJo
	 868vq8tFsJ2WbH8QDI3lSXv2Y6SA7s1n6vFQ8lJl19vP0kiLXUO0/TPHtDty1lPenw
	 B4ZdfbmmbKXOm24ysGXnZtlJQZ15PTFLdN0qGz7EJ4GWApcFEJURuWtyL9tyqgzVEk
	 /oB3ZlCl9Sq8uNdKA9JMTfE/o9T9BKV1h7QgaR802+cJW5E7JO3P3XWWoWbJPnujhp
	 jJUo9G8QV80MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A6560661;
	Mon, 26 Oct 2026 21:33:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6662B3421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A06940075
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5-KF891jMTe for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:33:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CDD4740062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793050435;
 b=W1z3gUrCujE93qXIyWu2IfhVALcZVHLIp90ufTTpb/8SHS5k5j5YyH1ScXUIlOFBEtEs
 gHBMUgAd7YhmPoXOh+mXxlzSXDzXZdxWk0/envTd7BqZxaBhbz94YcRDdG97vNdEizHly
 FulSyL6LkogQZXPlz1gNzzlVYhwj4dZgY8AmOg9JkgtG2nt3v18OUBCaPuY1PBZdPyH0F
 3Kay5vH7hUuk2sZCL/a/LDSX6h7NNRxtN2ed8L+c6jcsXa8hHXLhuo6wV8BnhK5k0fA0M
 CDCX/IPg8CU0QHFWZV3cf+Vp4RvIxuTKkRCcWirphes8zx9ZAdbS+IL/FBY2/iANXaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793050435;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WdAkei+5MisRD4sgnKKAAwnH9juzDBSTPxlWN6Yu/ns=;
 b=fkMdcswzqBFaT6qt953RvaynHbQfNidx5+mBihYtn2Qfc21LxHR7ob1EL8Bz4cIKUoMo
 mP723bz0Vwr7KivIYW+lxRpQfRerxKazEVYMXTCpDwQ0QfFD3zfMJbVXH7wGQE/YIGsck
 A3Y4nRcwLcqscrsWGEoSDLfGcT6JPTSWgjAlnUDhHsMGDMCu4ks+X4dcw4ZNZnWhMMTfs
 u0Vus46Mt9eq/ZTeCZg5mMKbFRLq2k83niDyDkOwnLiHlMqZkVIaMNXwExGsNYrXwutw+
 CVbPna94/UCkJnqWmsQZwtLD3G1TT0h4xX5Ofm3rbLEoFJjUS8yD9zHofXTLQNVLwMg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DGCJIgbX; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDD4740062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8878F4E41324;
 Mon, 26 Oct 2026 21:33:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E4CD60740;
 Mon, 26 Oct 2026 21:33:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EE1C10329092; Mon, 26 Oct 2026 22:33:49 +0100 (CET)
Date: Mon, 26 Oct 2026 22:33:49 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <at_HMDJGVjaCwA7b@windsurf>
References: <20261025212123.4106996-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025212123.4106996-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/uboot: make binman dependency
 on host-python-pkg-resources optional
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

On Sun, Oct 25, 2026 at 10:21:22PM +0100, Fiona Klute via buildroot wrote:
> Binman needs pkg_resources only in U-Boot versions before 2025.10,
> otherwise the dependency is unnecessary and best avoided.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Thanks a lot, series applied to master!

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
