Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC21EC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61418410D5;
	Fri, 28 Oct 2022 06:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61418410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qF2L0iyYaKzP; Fri, 28 Oct 2022 06:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28287400A4;
	Fri, 28 Oct 2022 06:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28287400A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 780401BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DA880C44
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DA880C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4dHi824FE-f for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:52:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4680180B52
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4680180B52
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:52:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 483B424000A;
 Fri, 28 Oct 2022 06:52:09 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:52:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221028085207.144e54b4@windsurf>
In-Reply-To: <20221026031157.658391-1-james.hilliard1@gmail.com>
References: <20221026031157.658391-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gl1MvJnhKaEhLngbofXpenxpYkvPDDlYOGmnIh4+/JE=;
 b=p0zcTvUlNnCvS4PH0Zx6FnDO2/3IgjDGP2lvTUtPPsJB/n6oAOwhJn00T38UHigQ3exUnT
 H0bnDrpwGDmQTeMQhQQHPoAU4CXWRdwDbkBo8Mr38v9sDP8/pk5JRIPCuvdkt00t0jHuEH
 OielgVjKXft6wXZu99yrA7Qyk9YJuPmkPmvc/2IlN/s2ZV30QSMxLnsYE5AgFxR4uZNC4j
 7UEIm34FhwfqTKWny7aW3ij3VPpFRYLYL1pmZnHjzzPFIhgpOMiRhVDt+tCv5OQtN/Ci6p
 Ny/9knUdWTB1b5queodD5fz8Tg508Hh/tcUa42+Bz7Rh3FJdnT8w7FJgdrwaLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p0zcTvUl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version
 24.0.1
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
Cc: Michael Rommel <rommel@layer-7.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Oct 2022 21:11:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate to setuptools infrastructure.
> 
> Add new host-python-packaging dependency.
> 
> Refresh zmq version override patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-ZMQ-version-check-to-the-ZMQ-versi.patch} | 37 +++++++++++++------
>  package/python-pyzmq/python-pyzmq.hash        |  4 +-
>  package/python-pyzmq/python-pyzmq.mk          |  8 ++--
>  3 files changed, 31 insertions(+), 18 deletions(-)
>  rename package/python-pyzmq/{0001-use-buildroot-zmq-version-instead-of-detect.patch => 0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch} (55%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
