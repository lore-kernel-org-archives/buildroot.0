Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE3CC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC04781A73;
	Sun, 24 Dec 2023 17:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC04781A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBwDAYtmczQQ; Sun, 24 Dec 2023 17:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F99F81A8E;
	Sun, 24 Dec 2023 17:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F99F81A8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF4D1BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68B581A73
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68B581A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pT0Vodvkuq9z for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:37:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF10881A6D
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF10881A6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id E549A240002;
 Sun, 24 Dec 2023 17:37:51 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:37:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224183751.21ff0de2@windsurf>
In-Reply-To: <20230825161754.398783-1-bernd@kuhls.net>
References: <20230825161754.398783-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703439472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EcDDDgQWkuP2o2vu0jrR75VvPuokQdnGcpuJhVqTTY=;
 b=j1BclSTV9wxwD83C5rUR40hriGqtSziEu0w2bJDmRDGCMljk97h2JbLi4xF29uoYQLFcbv
 S8mfi9yfgqLjZ2uH6nzyMv5O4xYi1Kh+3hxjhWAEELn6wz8zW70lsEZdIKezmXmDXp8dyR
 jGAOkQIvwZQP1WoGpLljQnPLhxnHreUqV0Fd5k70syWn/0EC6As7WkBGqt5NWypLqLXrG9
 U6Ejy5wJaFajz80Tm/9C3h2WDvtfgMwnUjPfB2gwYfJ+A0d+bT1dByVRp62Q9RiUoi7acW
 tqIrzGrEGXCyV5fmPqUtfs+m+Wg7N5adVoHzVDxLcW88RIOpdmSjxwftqeCX6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j1BclSTV
Subject: Re: [Buildroot] [PATCH 1/1] package/sentry-cli: needs
 host-libopenssl
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

+Adam, whom I believe has an interest in sentry-cli.

On Fri, 25 Aug 2023 18:17:54 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/b86/b8613dc343c9ebb1470075a72ad86137ddddf5a7/
> 
> This build error did not occur prior to bumping libopenssl to 3.0.9 with
> buildroot commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5
> 
> It first occured after a libopeenssl 3.x fixed was commit to buildroot
> with commit 8382f0eb41bc12098f032c12781fb488aa63d901 here:
> http://autobuild.buildroot.net/results/2df/2df940342007e1e3bcdc9defde3a8be1fef1a0b3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've done a bit of research and investigation, and I believe the
problem is a bit more complex, and actually was introduced by your
commits 8382f0eb41bc12098f032c12781fb488aa63d901 and
961dc9d397c136181982a9c3add17f737e1b9e82 which aim at fixing the build
of sentry-cli with OpenSSL 3.x.

Indeed, prior to
8382f0eb41bc12098f032c12781fb488aa63d901/961dc9d397c136181982a9c3add17f737e1b9e82,
it was possible to build sentry-cli without OpenSSL (it would fail if
OpenSSL 3.x was built, due to incompatibility, but it would build fine
without OpenSSL).

You can experiment by yourself:

# Check out Buildroot just before 8382f0eb41bc12098f032c12781fb488aa63d901

$ git checkout dff67170f73959e6826ec3e87e892747f8d3a5fb
$ ./utils/docker-run make host-sentry-cli

# It builds just fine

# Now let's do it with host-openssl built before:
$ make clean
$ ./utils/docker-run make host-openssl
$ ./utils/docker-run make host-sentry-cli

# It will fail because sentry-cli doesn't play well with OpenSSL 3.x,
# and we are before your fixes.

Now, let's try with 961dc9d397c136181982a9c3add17f737e1b9e82, which
after the two commits to sentry-cli fixing OpenSSL 3.x build

$ git checkout 961dc9d397c136181982a9c3add17f737e1b9e82

# First, with host-openssl:
$ ./utils/docker-run make host-sentry-cli

# It fails to build

# Then, with host-openssl
$ make clean
$ ./utils/docker-run make host-openssl
$ ./utils/docker-run make host-sentry-cli

# It also fails to build

So it looks like that the commits
8382f0eb41bc12098f032c12781fb488aa63d901 and
961dc9d397c136181982a9c3add17f737e1b9e82 rather than solving the
OpenSSL 3.x issue broke the build without OpenSSL, and with OpenSSL,
unless my experimentations above are wrong of course.

Could you have a deeper look into this? I strongly suggest using a
Docker container (as done above using docker-run), to be isolated from
a host provided OpenSSL.

Thanks a lot in advance for your additional research!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
