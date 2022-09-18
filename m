Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE36C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB43A6FB0C;
	Sun, 18 Sep 2022 10:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB43A6FB0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDAL3eYsIL4o; Sun, 18 Sep 2022 10:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED74960E2B;
	Sun, 18 Sep 2022 10:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED74960E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E84161BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D6E60E2E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D6E60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXn5QIMafcB1 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:03:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FC060E25
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2FC060E25
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:03:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4EE6100005;
 Sun, 18 Sep 2022 10:03:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZr8j-00BWyw-VI; Sun, 18 Sep 2022 12:03:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-5-angelo@amarulasolutions.com>
Date: Sun, 18 Sep 2022 12:03:05 +0200
In-Reply-To: <20220705073206.1442280-5-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Tue, 5 Jul 2022 09:32:05 +0200")
Message-ID: <87mtaxgfty.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 4/5] package/ifupdown-scripts: add wifi
 configuration when enabled
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
Cc: br015@umbiko.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Add a proper wpa-conf line to the interfaces files to let the system
 > bringup the wifi interface and the related wpa supplicant.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 > Changes:
 > v3:
 > * add "|| true" lo let the command exit without error when
 >   BR2_SYSTEM_CONNECT_WIFI is empty (me)

 >  package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
 > index 5ef032142c..ebaf234143 100644
 > --- a/package/ifupdown-scripts/ifupdown-scripts.mk
 > +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
 > @@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
 >  		echo "  pre-up /etc/network/nfs_check"; \
 >  		echo "  wait-delay 15"; \
 >  		echo "  hostname \$$(hostname)"; \
 > +		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
 > +			echo "  wpa-conf /etc/wpa_supplicant.conf" || true; \
 >  	) >> $(TARGET_DIR)/etc/network/interfaces

Maybe we should do this unconditionally if we overwrite
/etc/network/interfaces and wpa_supplicant is enabled?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
