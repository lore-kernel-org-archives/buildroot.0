Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689DDC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 061B481BA8;
	Sun,  7 Aug 2022 16:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061B481BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdPg4P8Z831P; Sun,  7 Aug 2022 16:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6E98149A;
	Sun,  7 Aug 2022 16:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C6E98149A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49AF21BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC4E4151E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC4E4151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IfcGW2vlrZV for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748AD41517
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 748AD41517
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:12:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E09221BF207;
 Sun,  7 Aug 2022 16:12:21 +0000 (UTC)
Date: Sun, 7 Aug 2022 18:12:20 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807181220.7688111e@windsurf>
In-Reply-To: <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659888742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIJtIj7lloFnCFLDhQXNfcs55Lnbky9YcMAAgxz7q6Y=;
 b=FG+FIqxzZ9eFNWT+NInuYSPpZ843n04eGUjvk3zYJbNxYRHINKEppM7pDWmw4drvq9pZ4j
 mi00P3MLy8lkla9WL4zufqMRo8pn1Uql/xtEpAUNz5b4WWKmvyKffHxz36kVoofBIoC0Yk
 ByOaUSAfG43i5WQY/xr7S8Hx9IbInZr1EPdfTkIzWYNAY383EeLk1xX0oQF418t8nL6qgn
 7/qDpHMtwlDtH1JA5TneNYD5Neaj+sEoYHrYEl3SbTW+qLxh3H6sLDGckrmTTfzB0SiYgb
 FPAvJKSwPXOTShgQxR6+5LsNQfmDIoUY/A+/LMuWRbO9pj7EPYLf2bro/t+dgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FG+FIqxz
Subject: Re: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

I have applied, with a few changes, see below.

On Sun,  3 Apr 2022 19:19:52 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> From: ecorm <ecorm@users.noreply.github.com>
> 
> Added missing python-autobahn subpackages required by python-crossbar.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>

Fixed up the From: and missing empty line, as usual.

> +if BR2_PACKAGE_PYTHON_AUTOBAHN
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
> +	bool "Twisted support"
> +	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> +	select BR2_PACKAGE_PYTHON_TWISTED # runtime
> +	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
> +	bool "C-based WebSocket acceleration"
> +	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
> +	bool "Non-standard WebSocket compression support"
> +	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
> +	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
> +	select BR2_PACKAGE_PYTHON_CBOR # runtime

I do see the cbor2 dependency being expressed in setup.py, but not the
cbor dependency. Also, I only cbor2 being imported in the autobahn code
base, so I dropped this line. Of course, if there is something I
missed, let me know.

> +	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
> +	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
> +	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
> +	select BR2_PACKAGE_PYTHON_UBJSON # runtime
> +	select BR2_PACKAGE_PYTHON_UJSON # runtime
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
> +	bool "TLS and WAMP-cryptosign encryption/authentication support"
> +	select BR2_PACKAGE_PYTHON_PYNACL # runtime
> +	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	select BR2_PACKAGE_PYTHON_PYQRCODE # runtime
> +	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
> +	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
> +
> +config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
> +	bool "WAMP-SCRAM authentication support"
> +	select BR2_PACKAGE_PYTHON_ARGON2_CFFI # runtime
> +	select BR2_PACKAGE_PYTHON_PASSLIB # runtime

The other thing I changed is to sort those sub-options alphabetically
by their option name.

Applied with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
