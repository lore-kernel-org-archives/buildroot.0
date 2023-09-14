Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B10DEDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB92860F62;
	Thu, 14 Sep 2023 09:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB92860F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRJaV5Fg5wnp; Thu, 14 Sep 2023 09:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C12360F36;
	Thu, 14 Sep 2023 09:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C12360F36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD981BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6936B81E65
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6936B81E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyZWAbGu3JqS for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:47:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9D681E56
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9D681E56
Received: by mail.gandi.net (Postfix) with ESMTPSA id D20EB20002;
 Thu, 14 Sep 2023 09:47:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgiw7-008ADA-UU; Thu, 14 Sep 2023 11:46:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230902214032.3570167-1-thomas.petazzoni@bootlin.com>
 <20230902214032.3570167-2-thomas.petazzoni@bootlin.com>
Date: Thu, 14 Sep 2023 11:46:59 +0200
In-Reply-To: <20230902214032.3570167-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 2 Sep 2023 23:40:32 +0200")
Message-ID: <87edj1xf1o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/poppler: bump version to matest
 in 22.x series
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This commit updates poppler to the latest version in the 22.x series,
 > with only has bug fixes. Here is the list of commits between 22.10.0
 > and 22.12.0:

 > df568263c51950ceed6f1fb42f80e99a2614c275 (tag: poppler-22.12.0) poppler 22.12.0
 > 198dc1d0674c0a462668e6868c35b1ee0e731005 Form::addFontToDefaultResources: Be stubborn in finding a font we can use
 > a5952ab70716a2d4f792a943c2dcf3068f1d6885 Revert "CI: Fix Debian brokenness"
 > 8fcaa7c622d24761a9ecb3922f95d072077d6f34 CI: Fix Debian brokenness
 > cc665f757af6b87dd245d36e079dd44d8d2d2182 (tag: poppler-22.11.0) poppler 22.11.0
 > a296982e1d5b4968b2bd044d80647ae6f9267526 Do not include a poppler/ file from a splash/ header
 > bc4a0d9a2abfcd75d9b0ee4be3f7600905fe6001 Form: Provide Unicode marker when ensuring fonts
 > 111f38a722eedddd94faa52dda8c5e0da561fb41 Cairo: Update font after restore
 > 907d05a6a141284aee22fbd16ab0a2fb4e0f2724 Fix crash in file that wants to do huge transparency group
 > e53f5aae3bce7d09788f2ad62be998895fb9807b PSOutputDev::setupResources: Fix stack overflow in malformed doc
 > a4ca3a96a6b1f65b335a1ea362e6c202e46ae055 topIdx can't be negative
 > e471f8e09bf2e38df0cf5df1acecbcca70685573 Init all the fields of JPXStreamPrivate
 > 5190c0d4369bd9f501922585140be4ec736e24f2 No need to store smaskInData in priv
 > 6263bb90b09326103b10e4c4edfbc5b84c884921 Page label ranges can't start in < 0

 > Note: this version bump does not include the fix for CVE-2023-34872,
 > so we still need the backported patch.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
