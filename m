Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C10C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB40403B8;
	Sat, 18 Mar 2023 20:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB40403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lomb7taBTt89; Sat, 18 Mar 2023 20:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B60401F1;
	Sat, 18 Mar 2023 20:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B60401F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C26A71BF332
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6E0401F1
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6E0401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCrO7Lgs1zPB for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 20:55:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD33400B9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DD33400B9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 20:55:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1D97240006;
 Sat, 18 Mar 2023 20:55:37 +0000 (UTC)
Date: Sat, 18 Mar 2023 21:55:36 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230318215536.02b74732@windsurf>
In-Reply-To: <e258bff9-5090-414d-bbba-72d15c12d4c5@gmail.com>
References: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
 <e258bff9-5090-414d-bbba-72d15c12d4c5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679172938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exWiEcf/qXxI/oKt8N+/jZ4T+4KHBjGieD6nMg4iWEc=;
 b=OUmEkFu/D++W/aoWau0zBQk58x3AC8+D2g53IwyHqd775S16x9s6HclCuXhfqhzy8gqtD3
 WjFk6HBFBM2UYTgU9+MPCsNw/HULkpBTAv3yCRhQwFsw16KwPJ/uyIkQErhwGdTn6VXtBy
 HFEW5qF7AI4AYMuml4qcwumJjEerV7Fh608aXDUcl8VUPgsZ+AXTI7RMsWH086Fk6lkNIs
 N3/ndbTsauEEvhpTyj+Pn1QcL5YhQ2VNiT2Myo3piAQjpAwdwgFgft46c4uZ5lu9/oDF/u
 hRYURE6Rzm3KwA/MBcKCzp76KOO89HTcrbEEUhvbAqLxXFCHqi9XnCQ8TMOgcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OUmEkFu/
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: fix libsemanage
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

On Sat, 18 Mar 2023 18:52:27 +0100 (GMT+01:00)
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Besides that, should I not get an email if a build fails in a
> package, whom I am the developer in DEVELOPERS file?

In general, yes. Except here the failure (see
http://autobuild.buildroot.org/results/e528e07874815d7f1cb951084ec985d76fe22d2e/build-end.log)
looks like this:

make: Entering directory '/tmp/instance-11/buildroot'
Makefile:576: *** libsemanage is in the dependency chain of shadow that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
make: Leaving directory '/tmp/instance-11/buildroot'

and the autobuild script does not have logic to interpret that as
"shadow has an issue", so this build failure is classified as having an
"unknown" failure reason.

The autobuild script is able to detect the failing package when the end
of the error log looks like this:

make[1]: Leaving directory '/home/thomas/autobuild/instance-1/output-1/build/bluez5_utils-5.66'
make: *** [package/pkg-generic.mk:293: /home/thomas/autobuild/instance-1/output-1/build/bluez5_utils-5.66/.stamp_built] Error 2
make: Leaving directory '/home/thomas/autobuild/instance-1/buildroot'

Of course, this logic could be improved to also understand the "XYZ is
in the dependency chain of ABC...". If you're curious, the logic is at
https://gitlab.com/buildroot.org/buildroot-test/-/blob/master/web/import.inc.php#L244.
WARNING: ugly PHP code behind this link, make sure to wear appropriate
eye protection equipment before clicking the link and reading the code.

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
