Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB39C32772
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A4F81ABA;
	Mon, 22 Aug 2022 08:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A4F81ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AowoqHOx_iON; Mon, 22 Aug 2022 08:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC7A81771;
	Mon, 22 Aug 2022 08:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC7A81771
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14CEA1BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0E9781771
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E9781771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVreJp7Y3fES for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:26:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD2E81589
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECD2E81589
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:26:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 657456012E;
 Mon, 22 Aug 2022 10:26:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 10:26:20 +0200
Date: Mon, 22 Aug 2022 10:26:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220822082620.GY2167049@scaer>
References: <20220317170317.308827-1-theo.lebrun@bootlin.com>
 <309973dc-6f2e-1fb4-aad3-5b77c44570db@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <309973dc-6f2e-1fb4-aad3-5b77c44570db@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661156784;
 bh=Qwbb8DdCKDHmIC69IGq20nEacftrvOrawElx9+GGQ1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VffZf3Yxvfwpf95GqBo6equkYXgyFFHTnryypnrWgYz9Q7JMSKZWNXCPmKbtm88dD
 CM+r9CyFseYwkHREJghlYKrjRrF+KkeO5P8B+cg16uiZx40Ycqz5GBX6QW+9tSiYVU
 Hq+tZg4YuQqhzgQkH7GCwzeE06idC4VnySNF41Dc7A13vK7D0pyDOU6Qk4PptXiDVb
 9bLEgIHm598jEGU03/uG40W1lK72XIKeYAmVi0oNwzV/XapIhg4rL9Y592RpMjLyzC
 kB6PPVYRvxG7Jm0ZzpvbeQ8M6LA7TU2+GJpMq60DLXPabxvXeDElZAZLIdkE9QpIc3
 hlQorCN39QJHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VffZf3Yx
Subject: Re: [Buildroot] [PATCH] package/signal-estimator: add new package
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
Cc: theo.lebrun@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-08-02 22:30 +0200, Giulio Benetti spake thusly:
[--SNIP--]
> >diff --git a/package/signal-estimator/signal-estimator.mk b/package/signal-estimator/signal-estimator.mk
> >new file mode 100644
> >index 0000000000..24120b36da
> >--- /dev/null
> >+++ b/package/signal-estimator/signal-estimator.mk
> >@@ -0,0 +1,19 @@
> >+################################################################################
> >+#
> >+# signal-estimator
> >+#
> >+################################################################################
> >+
> >+SIGNAL_ESTIMATOR_VERSION = v0.0.3
> >+# Using Git as the package depends on a submodule (an old version of cxxopt).
> >+SIGNAL_ESTIMATOR_SITE_METHOD = git
> >+SIGNAL_ESTIMATOR_SITE = https://github.com/gavv/signal-estimator
> >+SIGNAL_ESTIMATOR_GIT_SUBMODULES = YES
> 
> Release 0.0.4 has been released and it's interesing also because for
> this new version they have added a tarball:
> https://github.com/gavv/signal-estimator/releases
> https://github.com/gavv/signal-estimator/archive/refs/tags/v0.0.4.tar.gz
> 
> So I would bump the version, use the tarball instead of git and
> SITE_METHOD and remove local patch.

Version bump and patch drop I did, but I kept using the git download
mechanism, because the tarball that you point at is the archive auto-
generated by github, so it does not contain sub-modules.

Regards,
Yann E. MORIN.

> >+SIGNAL_ESTIMATOR_LICENSE = MIT
> >+SIGNAL_ESTIMATOR_LICENSE_FILES = LICENSE
> >+
> >+SIGNAL_ESTIMATOR_DEPENDENCIES = alsa-lib
> >+
> >+SIGNAL_ESTIMATOR_CONF_OPTS += -DBUILD_GUI=OFF
> >+
> >+$(eval $(cmake-package))
> 
> buildroot/utils/test-pkg -p signal-estimator builds fine
> 
> So please provide a V2
> 
> Thank you!
> 
> Best regards
> -- 
> Giulio Benetti
> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
