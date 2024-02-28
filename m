Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B7C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 11:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5E060A48;
	Wed, 28 Feb 2024 11:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc92rhbp-lh4; Wed, 28 Feb 2024 11:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9E460A4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9E460A4D;
	Wed, 28 Feb 2024 11:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 242CB1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC6E18226C
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUTX4c6pcnDr for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 11:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1FC1820C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1FC1820C9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1FC1820C9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 11:47:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DC861BF207;
 Wed, 28 Feb 2024 11:47:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfIPN-00HSly-1O;
 Wed, 28 Feb 2024 12:47:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240116085546.3624229-1-peter@korsgaard.com>
 <87zfws4i00.fsf@48ers.dk>
Date: Wed, 28 Feb 2024 12:47:33 +0100
In-Reply-To: <87zfws4i00.fsf@48ers.dk> (Peter Korsgaard's message of "Fri, 26
 Jan 2024 09:27:11 +0100")
Message-ID: <87a5nkresq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Commit e88823d667cf0 (package/refpolicy: fix build with smartmontools) added
 >> a 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch patch, but
 >> forgot to put it in the version specific sub directory - Breaking builds
 >> using BR2_PACKAGE_REFPOLICY_CUSTOM_GIT as shown by the TestSELinuxCustomGit
 >> test:

 >>>>> refpolicy RELEASE_2_20200818 Extracting
 >> gzip -d -c
 >> /builds/buildroot.org/buildroot/test-dl/refpolicy/refpolicy-RELEASE_2_20200818-br1.tar.gz
 >> | tar --strip-components=1 -C
 >> /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818
 >> -xf -
 >>>>> refpolicy RELEASE_2_20200818 Patching

 >> Applying 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch using patch:
 >> patching file policy/modules/services/smartmon.te
 >> Hunk #1 FAILED at 143.
 >> 1 out of 1 hunk FAILED -- saving rejects to file policy/modules/services/smartmon.te.rej
 >> make[1]: *** [package/pkg-generic.mk:241:
 >> /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818/.stamp_patched]
 >> Error 1

 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/5929796183

 >> Fix it by moving the patch to a versioned sub directory.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
