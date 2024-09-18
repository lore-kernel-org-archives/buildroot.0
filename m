Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF2CDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ECF4400F5;
	Wed, 18 Sep 2024 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72PSr8CDMULY; Wed, 18 Sep 2024 20:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624CA401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624CA401F6;
	Wed, 18 Sep 2024 20:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7615A1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6196240223
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC71eIgL-9PL for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C9A5401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C9A5401F6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C9A5401F6
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:29:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E1621C0003;
 Wed, 18 Sep 2024 20:29:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sr1Ih-00DT9e-2N;
 Wed, 18 Sep 2024 22:29:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 18 Sep 2024 22:29:23 +0200
In-Reply-To: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sun, 1 Sep 2024 08:45:08 +0200")
Message-ID: <87zfo4n1ss.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/armadillo: temporarily
 update the site URL
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
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Following an email exchange with Conrad Sand, one of the maintainers of
 > the project, I learned that version 9.900.2 has been moved to
 > https://sourceforge.net/projects/arma/files/retired/.

 > This patch fixes the package download error, waiting for a subsequent
 > patch that will restore the previous URL to bump to a more recent
 > version.

 > Adding the .RETIRED suffix to the downloaded tarball generated the
 > following error:

 > armadillo-9.900.2.tar.xz.RETIRED: OK (sha256: d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05)
 >>>> armadillo 9.900.2 Extracting
 > buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED | buildroot/output/host/bin/tar --strip-components=1 -C buildroot/output/build/armadillo-9.900.2   -xf -
 > /bin/bash: line 1: buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED: Permission denied
 > buildroot/output/host/bin/tar: This does not look like a tar archive
 > buildroot/output/host/bin/tar: Exiting with failure status due to previous errors
 > make[1]: *** [package/pkg-generic.mk:213: buildroot/output/build/armadillo-9.900.2/.stamp_extracted] Error 2

 > which required the addition of ARMADILLO_EXTRACT_CMDS to be fixed.

 > Finally, it was also necessary to modify the tarball's hash.

 > Fixes:
 > - http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 > Changes v1 -> v2:
 >   - Don't bump to 10.1.0 but update the URL site to continue to download and
 >     build the current version (e. g. 9.900.2).

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
