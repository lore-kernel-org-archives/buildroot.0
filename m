Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE7606A852
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V1CKara4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 753F36080C;
	Wed,  4 Nov 2026 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EBuvjM__eTv; Wed,  4 Nov 2026 20:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EFD4607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824323;
	b=qrg8wmnM4cf2bJmuNfifiEJIG3UoU3gL8L4YWEvY1b5tGL8v2fUrGWkDHGXd++hJJLqb
	 +9lvyFS9M01nARv6B6MJKwITIldXPcbdGT4je0QXTSusoGgaqbvbCuGSxZF98GYkkdouR
	 /PieFaEusr+0PWCTOyzaTiOXMqi0tT00k2+vXRmJ8abjaJoZnZJsju+qromLNd8VK4/Ps
	 Gk/V+oW3FpdPOCAH5oaGhUMleqN+StT24kHyBZWpp+QUaGTwE0FU5Nj4ty4TDIb3jRlGG
	 PK4FTk6vo33tQb/Is8lz0E73wtc4g/RIKjK6Bki8MyVnuMHcEkpU3OCfCTzRwHatVnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TW8E7i2mMo5Z434EoIaZthvKdENRVM0rEuU8/aM/Q3I=;
	b=jcO3VlskYxhjuhndjtjUVdubaNEFecDh1yYv6G+wn2doa4jxeDzDs3LAbJr76WtXJfIs
	 TfS34beZAsx5i5W2NFWGzofY9YGstaueSs5boRqZNXF5LwbNUQEPHWRlwtVCHkSdyTWtC
	 7FgvrwrRZ1ZjRtUqZzWU8JhJtwEA/BtI/YAlBouoyIVfEbrmo4bLnjF/x2h0CIt8KfDxE
	 ABEZIkxIhfVoInmEcQ4OE90MIfDjpJEZucNCsb6jNCokRh/mvPnMwFaXHGXhJ2AMezffi
	 YsvwX3RZjRaW7qC5OczFDXeVfSTkKNPT8ooV85V64/gbgioxfkdgfXzNAu7UN6bZqRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824323;
	bh=TW8E7i2mMo5Z434EoIaZthvKdENRVM0rEuU8/aM/Q3I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V1CKara4KlK/DhBo3T/JUKyZR5iu2ma/Y6OFNNgkW3qdhbVTpAoGXvIXe24ceO1jx
	 7i0kebuOQgBsjk1S1wchp1AF0tPzLf/jwBilBHpd9avZpZRfV1yXRUK2LQtopU/PRA
	 yDQ5skF2QSXTCHach4XE8Xoo6NDQGqa/ngDdCY7R8XSUQTkD+N/faojBHuVYH/7YI2
	 sUV1wiOr2blgxGqVNKz56qJiZn4peQzh086jn/5r/uCnUejm1lOsAh+RVPFz164y2P
	 GMcYo74qjqnE8p3w9NkOfe5tow6qgzqg3BCTIyQaLw6ODQ5Dcpef6kctnOMbbI0W3l
	 J2IzuuumcOq6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EFD4607F7;
	Wed,  4 Nov 2026 20:32:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E2D49C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C84607F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUymwr2H8_zF for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:32:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72483605F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72483605F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:31:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A09F6C8F474;
 Wed,  4 Nov 2026 20:33:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5E65D5FAEB;
 Wed,  4 Nov 2026 20:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BD9F10329206; Wed,  4 Nov 2026 21:31:53 +0100 (CET)
Date: Wed, 4 Nov 2026 21:31:53 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, fontaine.fabrice@gmail.com
Message-ID: <auuV_PCwJYLlCadf@windsurf>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102160505.1754919-1-thomas.devoogdt@barco.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: add missing direct
 dependencies
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

On Mon, Nov 02, 2026 at 05:05:03PM +0100, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas@devoogdt.com>
> 
> GTK links directly against libdrm (mandatory on Linux), cairo,
> harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend
> additionally against fontconfig, x11, xext, xrender, xi, xcursor,
> xdamage, xfixes, xrandr and xinerama.
> 
> Add them to LIBGTK4_DEPENDENCIES so that they are always built before
> libgtk4, and select the corresponding Config.in symbols instead of
> relying on them being selected by other packages (pango, cairo, ...).
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

I assume you verified that all those dependencies are not just direct
dependencies, but are also _mandatory_ dependencies, correct?

Because for the patch on libgtk3, I think you got this wrong (I'll
reply to it separately).

For the time being, I've applied this patch to master, because a quick
look at meson.build indeed seems to indicate that they are all
mandatory dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
