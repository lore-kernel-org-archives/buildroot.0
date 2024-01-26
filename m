Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E451C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A876584D29;
	Fri, 26 Jan 2024 08:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A876584D29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MM-2lsN4hHej; Fri, 26 Jan 2024 08:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01FC684D14;
	Fri, 26 Jan 2024 08:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FC684D14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9CBA1BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCCE54367C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCCE54367C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtvFTjWm3Qqu for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:27:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32ED9402B1
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32ED9402B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBB9520007;
 Fri, 26 Jan 2024 08:27:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTHYN-007uW0-0Z;
 Fri, 26 Jan 2024 09:27:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240116085546.3624229-1-peter@korsgaard.com>
Date: Fri, 26 Jan 2024 09:27:11 +0100
In-Reply-To: <20240116085546.3624229-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 16 Jan 2024 09:55:46 +0100")
Message-ID: <87zfws4i00.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/refpolicy: move patch to version
 subdir for custom git support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit e88823d667cf0 (package/refpolicy: fix build with smartmontools) added
 > a 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch patch, but
 > forgot to put it in the version specific sub directory - Breaking builds
 > using BR2_PACKAGE_REFPOLICY_CUSTOM_GIT as shown by the TestSELinuxCustomGit
 > test:

 >>>> refpolicy RELEASE_2_20200818 Extracting
 > gzip -d -c
 > /builds/buildroot.org/buildroot/test-dl/refpolicy/refpolicy-RELEASE_2_20200818-br1.tar.gz
 > | tar --strip-components=1 -C
 > /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818
 > -xf -
 >>>> refpolicy RELEASE_2_20200818 Patching

 > Applying 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch using patch:
 > patching file policy/modules/services/smartmon.te
 > Hunk #1 FAILED at 143.
 > 1 out of 1 hunk FAILED -- saving rejects to file policy/modules/services/smartmon.te.rej
 > make[1]: *** [package/pkg-generic.mk:241:
 > /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818/.stamp_patched]
 > Error 1

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/5929796183

 > Fix it by moving the patch to a versioned sub directory.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
