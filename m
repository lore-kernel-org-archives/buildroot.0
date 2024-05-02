Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E25C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 11:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7740B6062F;
	Thu,  2 May 2024 11:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_d5L-IpEqBL; Thu,  2 May 2024 11:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E77E6066E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E77E6066E;
	Thu,  2 May 2024 11:29:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 730311BF2A9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E21F8132A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRE3Vy7RovOz for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 11:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51D448131D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D448131D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D448131D
 for <buildroot@buildroot.org>; Thu,  2 May 2024 11:29:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 801A960004;
 Thu,  2 May 2024 11:29:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2Ucl-00Aaxb-2F;
 Thu, 02 May 2024 13:29:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240303173851.788985-1-fontaine.fabrice@gmail.com>
 <3b2522a2-a2ea-42c0-b7ab-f8e33eca5b6d@mind.be>
Date: Thu, 02 May 2024 13:29:15 +0200
In-Reply-To: <3b2522a2-a2ea-42c0-b7ab-f8e33eca5b6d@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 7 Apr 2024 17:44:42
 +0200")
Message-ID: <87zft85u5w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libtracefs: fix musl build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 03/03/2024 18:38, Fabrice Fontaine wrote:
 >> Fix the following musl build failure raised since the addition of the
 >> package in commit b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is
 >> found:
 >> ../utest/tracefs-utest.c: In function 'test_uprobes_instance':
 >> ../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
 >> 2492 |         char self[PATH_MAX] = { 0 };
 >> |                   ^~~~~~~~
 >> Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
 >> - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.


Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
