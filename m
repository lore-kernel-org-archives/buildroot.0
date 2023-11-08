Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 07:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F4A40640;
	Wed,  8 Nov 2023 07:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F4A40640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tyd42-mQysQI; Wed,  8 Nov 2023 07:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B798240642;
	Wed,  8 Nov 2023 07:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B798240642
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE3F61BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9497B41706
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9497B41706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0ZZRmXMpRQt for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 07:09:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89B6E410E4
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 07:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B6E410E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A514E0009;
 Wed,  8 Nov 2023 07:09:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0cgV-0007Qu-36;
 Wed, 08 Nov 2023 08:09:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20231107221745.2722636-1-christian@aperture.us>
Date: Wed, 08 Nov 2023 08:09:07 +0100
In-Reply-To: <20231107221745.2722636-1-christian@aperture.us> (Christian
 Stewart's message of "Tue, 7 Nov 2023 14:17:45 -0800")
Message-ID: <874jhwvi0c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to go1.21.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > Go version 1.21.4 includes the following security fixes:
 > CVE-2023-45283: path/filepath: recognize \??\ as a Root Local Device path prefix.
 > CVE-2023-45284: path/filepath: recognize device names with trailing spaces and superscripts

 > https://go.dev/doc/devel/release#go1.21.4

 > Signed-off-by: Christian Stewart <christian@aperture.us>

Committed, thanks.

Can you also send a 1.20.11 bump for 2023.08.x / 2023.02.x?

> ---
 >  package/go/go.hash | 2 +-
 >  package/go/go.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/go/go.hash b/package/go/go.hash
 > index 9499f50964..74b18a9b38 100644
 > --- a/package/go/go.hash
 > +++ b/package/go/go.hash
 > @@ -1,3 +1,3 @@
 >  # From https://go.dev/dl
 > -sha256  186f2b6f8c8b704e696821b09ab2041a5c1ee13dcbc3156a13adcf75931ee488  go1.21.3.src.tar.gz
 > +sha256  47b26a83d2b65a3c1c1bcace273b69bee49a7a7b5168a7604ded3d26a37bd787  go1.21.4.src.tar.gz
 >  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
 > diff --git a/package/go/go.mk b/package/go/go.mk
 > index ef27f32835..7bd7866a05 100644
 > --- a/package/go/go.mk
 > +++ b/package/go/go.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GO_VERSION = 1.21.3
 > +GO_VERSION = 1.21.4
 >  GO_SITE = https://storage.googleapis.com/golang
 >  GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
 > -- 

 > 2.42.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
