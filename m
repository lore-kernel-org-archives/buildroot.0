Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90DAC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57D4143743;
	Fri,  5 Jan 2024 13:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D4143743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIlPGzGFFAYZ; Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4902143739;
	Fri,  5 Jan 2024 13:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4902143739
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E90A1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B4C9614D2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4C9614D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fE4ZlAbMiya for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9A0E61499
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9A0E61499
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14671C0004;
 Fri,  5 Jan 2024 13:01:49 +0000 (UTC)
Date: Fri, 5 Jan 2024 14:01:49 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105140149.1a0822ac@windsurf>
In-Reply-To: <20231227113045.1141473-1-fontaine.fabrice@gmail.com>
References: <20231227113045.1141473-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2RPkVlWVQ8CPVnmu+sBLW4wpurYPpurQ5+9Kiy/v84=;
 b=iU2n/I1ugrbNz3hTmlmXybxdGSIRt9FOIxHZM9kPwGM2wWHLrIMDvuaDrFhyfcsmiiMOTX
 pqiovFD+332pXRRYNxvIanglEqt8UsacPdyNUZH2nNVrAAGpwN3y04A1R/tX6ZiNZuvv2G
 b90ywpFOGanHMvsTaG2G5U8r4AStzoU2jPEiQLDb2352OgydTouaJPCOeXrQVV4FVOXa4L
 dM5fZG2hAJqiuswVw4W1EKa+0WI1fQSkdVMKNEwNWDEampTRP6DmLhtepawmaKpQMnCIxY
 JRjJwTiLOc8lYsLFpn43rFl/kb6RlLytFamkQoYI0Uyee8GF1ieVQbugf5YePA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iU2n/I1u
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: add trousers optional
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Dec 2023 12:30:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> trousers is an optional dependency since version 1.11.26 and
> https://github.com/randombit/botan/commit/1752f0d522eef9a4a703fccf702b4b026c1c1d01
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 5 +++++
>  1 file changed, 5 insertions(+)

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
