Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8973C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F82A84BB3;
	Sat, 23 Jul 2022 14:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F82A84BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N_C7gNuci2u; Sat, 23 Jul 2022 14:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D1B84BA6;
	Sat, 23 Jul 2022 14:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D1B84BA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9081BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63D0840554
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D0840554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRKxkoEoLsoT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379BB40045
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 379BB40045
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:58:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 079EC240003;
 Sat, 23 Jul 2022 14:58:00 +0000 (UTC)
Date: Sat, 23 Jul 2022 16:58:00 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220723165800.54811fe3@windsurf>
In-Reply-To: <20220528014832.289907-1-ricardo.martincoski@gmail.com>
References: <20220528014832.289907-1-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658588282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sp46Zjf0hCd5vPxGHsnswah8E6lUzuly1aGq39xnqS8=;
 b=euHQawCFOAUJr7eeIU3PPMF/RXloGF25S3l0cRgamMnAOwiJpO+p0243nNCuMrUh9suaTp
 8qoXw5nGVt6+wFdgjpwdwpS8v1WedigufZ0Ux3VGkDX4oHGILw3ivc+QRXzbxrve9XNBTM
 EIudv7OCvoBIJ2NWAdH+O80FNupcJm70/H2VM+yDQ1li26vhsh6DsH1f9XciizGnJKx8iO
 2OyFPAXGsuPWvfN56T1my8s0cjMYaFgbW8hwbe76KwBPzqpgqrl89a2O90Rh4jhK0UgQwN
 mUG52CGWwm7xu28gSz1mhi5IewsOojg2nFOyZKBu/IQGnGI8LgMfiSlwlshnSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=euHQawCF
Subject: Re: [Buildroot] [master, next,
 lts] utils/get-developer: fix DEVELOPERS syntax check on GitLab CI
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Fri, 27 May 2022 22:48:32 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Commit "45aabcddc5 utils/get-developers: really make it callable from
> elsewhere than the toplevel directory" ended up making check-DEVELOPERS
> in GitLab-CI to always get a false PASS result, since the job was
> trusting that calling get-developers with no arguments would parse
> DEVELOPERS file and generate error or warning messages.
> 
> There is need to revert that change, we only need to recover the syntax
> check coverage it had before the change.
> 
> Make the option -c from get-developers to generate a non-zero return
> code when there is parsing errors or warnings.
> Adapt the manual accordingly and use the -c argument in the
> check-DEVELOPERS job.
> 
> In the same commit, add a runtime test in order to detect undesired
> changes in behavior of the get-developers script.
> The test uses a .patch file generated against the buildroot tree as a
> fixture to check how get-developers operates when called to check it.
> The test also overrides the DEVELOPERS file in order to be fully
> reproducible and a -d option is added to get-developers in order to
> allow this.
> Since get-developers only looks to already committed files to compare
> against patch files, the fixture uses a package that is very unlikely to
> be removed from buildroot tree: binutils.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot for the patch! I ended up applying it, but with some
fairly significant differences.

The most important thing is that I didn't like the idea of re-using the
existing "-c" option as the way of validating the DEVELOPERS file. -c
is used to list files that don't have any associated developer.

So instead, I've added a -v (v for validate) option in get-developers
that simply does the validation step. I didn't introduce the extra
complexity of making parse_developers() return the number of errors and
warnings, since this was anyway not used anywhere. So I simply rely on
parse_developers() returning None when there is a validation failure.

See:

  https://git.buildroot.org/buildroot/commit/?id=47f359a615ae4772ea9d03a5134785aec230c317

Then I used this new -v option in gitlab-ci.yml:

  https://git.buildroot.org/buildroot/commit/?id=4ed7bca6a05a7878fdb73a973d098a6b64586848

Then I re-used your patch adding a -d option to get-developers, to pass
a custom DEVELOPERS file:

  https://git.buildroot.org/buildroot/commit/?id=7082b0585d5a231a062087d3e44007742b9165d4

Finally, I added your test cases, after changing them according to the
modifications I had done. Another change I did is put the binutils
patch not in the br2-external (it's not related to it), but into a
test_get_developers/ fixture sub-directory, like we do for package
tests that have test fixtures.

  https://git.buildroot.org/buildroot/commit/?id=9bb647297a6c48a7a79c20f4403be0dbea811a6c

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
