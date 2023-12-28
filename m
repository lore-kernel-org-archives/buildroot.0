Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8FCC4706F
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 08:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2855F610B3;
	Thu, 28 Dec 2023 08:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2855F610B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8aPQ3MfErfI; Thu, 28 Dec 2023 08:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644FD610B0;
	Thu, 28 Dec 2023 08:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644FD610B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC61B1BF239
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 08:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B75417D2
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 08:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B75417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JEcMCxhrue1 for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 08:59:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65A7F41773
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 08:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A7F41773
Received: by mail.gandi.net (Postfix) with ESMTPSA id 444A440003;
 Thu, 28 Dec 2023 08:59:19 +0000 (UTC)
Date: Thu, 28 Dec 2023 09:59:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231228095918.43ebbcfa@windsurf>
In-Reply-To: <CADvTj4qyLnC=L0bn18cE6sNDEw9bWX=785E8ncJek9=G0VQxyQ@mail.gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-6-james.hilliard1@gmail.com>
 <20231225212415.3e6b7621@windsurf>
 <CADvTj4qyLnC=L0bn18cE6sNDEw9bWX=785E8ncJek9=G0VQxyQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703753959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hb1f8zNy8SgYbooklRuCsbYPpGBCLDeRHEvq8ffp/1g=;
 b=Se5SbmWSjvbIKLTqqJyrgqZ9VOd1cg2hu+KwG1FaBeoTRmHVw2e5C0sgDJgJQ03Yx+KC6I
 m5YamkIzD+JtO77KHsU6tQIuFnCTfT9xVINPPn9QtE0BZUwLpwp7xCxLtev6FuESrRhuiN
 KTIs+d92fuzBxYkfSnUPyZIGLbDS81IZWpvUxJR8iV7LbPnCTS4uE9DcF9pelNfSt6b9zr
 oZ1cwKLO7LfyntWZ+2TQgLDQMe+qVqps37fDI9ec5xcUpbsDzXDRDmMJdHjSO+M173mk60
 p0KM26Wx6cq74eqy27Eg2eaFdaZbdgW5fytslJb5yQgz9WcMb0/QRrPUlXiZRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Se5SbmWS
Subject: Re: [Buildroot] [PATCH v3 6/8] package/python-fastapi-sessions: new
 package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 25 Dec 2023 17:47:01 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> > $ grep -r pydantic *
> > fastapi_sessions/backends/session_backend.py:from pydantic.main import BaseModel
> > fastapi_sessions/frontends/implementations/cookie.py:from pydantic.main import BaseModel
> >
> > However, it's not listed in setup.py or pyproject.toml, even as an
> > optional dependency. Is this an upstream "bug" ?  
> 
> I see it in setup.py here:
> https://github.com/jordanisaacs/fastapi-sessions/blob/be4126938011abd709fa18e9d9fc8a54c66a2130/setup.py#L12

Thanks for the feedback. Yann replied to you about what I didn't see
it: it's not in the tarball from pypi, and I always look at the code in
output/build/<pkg>-<version>/, which is the code really seen by
Buildroot.

> > I see you're using plain old setuptools, but this package has a
> > pyproject.toml, though it doesn't define a [build-system]. Is this why
> > you can't use pep517?  
> 
> A package with no [build-system] section in pyproject.toml per pep517
> falls back to the setuptools build backend.

Ah, OK, thanks for clarifying this.

> We can use a pep517 frontend with setuptools packages, see:
> https://patchwork.ozlabs.org/project/buildroot/patch/20231126180840.2081945-5-james.hilliard1@gmail.com/

ACK!

Thanks for those details, very useful.

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
