Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790ACC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E4B60B18;
	Sun, 19 Jun 2022 12:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E4B60B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFjgQT8j1G3B; Sun, 19 Jun 2022 12:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDD560797;
	Sun, 19 Jun 2022 12:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DDD560797
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0FA1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183FB82505
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183FB82505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s75uN4QkyEyh for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:36:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24AAC8133A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24AAC8133A
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:36:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42129E0004;
 Sun, 19 Jun 2022 12:36:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2uA3-006Ebr-3x; Sun, 19 Jun 2022 14:36:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220617204210.12026-1-fontaine.fabrice@gmail.com>
Date: Sun, 19 Jun 2022 14:36:15 +0200
In-Reply-To: <20220617204210.12026-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 17 Jun 2022 22:42:10 +0200")
Message-ID: <87letsu8xs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iptables: drop duplicated
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libnetfilter_conntrack dependency is wrongly duplicated since commit
 > b835171cf9db23095c669b872dbaa15fc1e99898

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/iptables/iptables.mk | 5 -----
 >  1 file changed, 5 deletions(-)

 > diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
 > index a54194a8c3..682e23a091 100644
 > --- a/package/iptables/iptables.mk
 > +++ b/package/iptables/iptables.mk
 > @@ -19,11 +19,6 @@ IPTABLES_SELINUX_MODULES = iptables
 >  IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 >  	$(if $(BR2_STATIC_LIBS),,--disable-static)
 
 > -# For connlabel match
 > -ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
 > -IPTABLES_DEPENDENCIES += libnetfilter_conntrack
 > -endif

I think it is nicer to instead drop it from the "main" _DEPENDENCIES
line for consistency with the other optional dependencies, so I've
committed with that change, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
