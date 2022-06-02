Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA8C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6161D60B71;
	Thu,  2 Jun 2022 16:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1n9DmM5uve3; Thu,  2 Jun 2022 16:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AF860AE7;
	Thu,  2 Jun 2022 16:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B81231BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B545481D19
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XOiVb8JErZS for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7783681CBA
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:51:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B19110000A;
 Thu,  2 Jun 2022 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654188663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bapWWFRxKgyoN1HLjUGdHrags+jd9eilz2U71tlMZ+A=;
 b=Leeq7zepswKumQqN4ErReURmn9aLu21GptmitPS9Cwp8kL61oo1hl8pL95cBgzCYf/KK/U
 ZiOb+0oBBySgaxFM+BbWBmqltLJuFBPe0P0bd5Ti7ocNGHb+P6pnvGM4Ox3p7/PEVDBfj6
 w0GsItyJFRb0/0KYF2XqjQGepPN1RJKYYke9lVBg1wUR1jf6elWkmSZeyiDuPMQCRZE5s7
 HEDIxrt1+xSHRk+C+hKXkOndPbH3SfZSc8DjP3EIiJnEanfwNVmR9umrjmZOYTvGlSgHuz
 o/N8cffbzeaHEKPhXZpvktNI4DYl/oWfjzq2QKhjO2Oa0Y4BajkJh6ga/17HIw==
Date: Thu, 2 Jun 2022 18:51:01 +0200
To: "Wood, Chris" <chris.wood@lmco.com>
Message-ID: <20220602185101.0032249c@windsurf>
In-Reply-To: <26ef81b5fd6d4cf7ad2e0f1a8674ce7d@lmco.com>
References: <26ef81b5fd6d4cf7ad2e0f1a8674ce7d@lmco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] SHA Hashing of Licenses Causing Issues
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
Cc: "'buildroot@buildroot.org'" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

First of all, thanks for your feedback, it is definitely useful to get
feedback on areas where Buildroot works well, and areas where it works
less well.

On Thu, 2 Jun 2022 16:04:53 +0000
"Wood, Chris" <chris.wood@lmco.com> wrote:

> I have encountered numerous issues with trying to run a software
> component licensing deep scanner on BR 2022 v02.1 source code.  I can
> see that you are trying to exercise comprehensive integrity on the
> component licensing for which I greatly commend you.  However by
> removing all of the Copying and Licensing files from the source code

Could you clarify this point? We are not removing the COPYING and
LICENSE files from the source code.

> and replacing them with SHA hashes the software licensing scanners

I don't see where we "replace" them with SHA hashes.

Here is how things are working:

 - Source code of each package is extracted in
   output/build/<pkg>-<version>/. No license file ever gets modified or
   removed from there.

 - Each package has a package/<pkg>/<pkg>.hash file which contains the
   hash of the license files contained within that package source code.

 - When you run "make legal-info", a lot of information gets collected
   into $(O)/legal-info/: the license files for each package, but also
   the complete source code for each package (including its license
   files). As part of this process, the hash of the license files is
   verified against the hash stored in package/<pkg>/<pkg>.hash.

With this in mind, I don't really understand why you think that we are
"removing the license files and replacing them with SHA hashes".

> are failing because they are looking for licenses in the form of
> SPDX, OSI and other license formats and there is no (to my knowledge)
> Industry standard that pattern matches hashes to the licenses as they
> are represented by either name in a recognized "license name" field
> or in the text content or format contained in the OSI, SPDX or other
> industry recognized repositories.  I looked for the cross references
> in the BR distribution but the subdirectories are not present.

Sorry, but I fail to understand this part. Could you clarify with an
example, perhaps?

> Also the training materials are also confusing the scanners because
> there are innumerable references to the word "license" and then an
> example file name such as "FOO......" in the numerous examples and
> documents.

Could you clarify which training materials, by providing a link? Are
you talking about the Buildroot manual,
https://buildroot.org/downloads/manual/manual.html, or the training
materials provided by Bootlin at
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
