Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F017AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 14:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 874234034B;
	Sun, 18 Dec 2022 14:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 874234034B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZzlWcETP5-T; Sun, 18 Dec 2022 14:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3A3F401F8;
	Sun, 18 Dec 2022 14:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A3F401F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E53571BF3DC
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD88481450
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD88481450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDKz29aCCEas for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 14:52:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B54A81451
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B54A81451
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:52:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38B03FF803;
 Sun, 18 Dec 2022 14:52:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6v20-003wYZ-8e; Sun, 18 Dec 2022 15:52:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20221216080433.1997432-1-angelo@amarulasolutions.com>
Date: Sun, 18 Dec 2022 15:52:48 +0100
In-Reply-To: <20221216080433.1997432-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Fri, 16 Dec 2022 09:04:31 +0100")
Message-ID: <87k02okblr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 1/3] package/rtl8723ds-bt: new package
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
Cc: indrek.kruusa@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This package install the required firmware for enabling the
 > Bluetooth device embedded in the RTL8723DS chip.
 > The driver is included in Linux main tree and can be enabled
 > with the BT_HCIUART_RTL symbol.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
 > ---
 > v6:
 > * Added me to developers file

 >  DEVELOPERS                             |  1 +
 >  package/Config.in                      |  1 +
 >  package/rtl8723ds-bt/Config.in         |  6 ++++++
 >  package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
 >  package/rtl8723ds-bt/rtl8723ds-bt.mk   | 17 +++++++++++++++++
 >  5 files changed, 27 insertions(+)
 >  create mode 100644 package/rtl8723ds-bt/Config.in
 >  create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 >  create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 3a0e3c14ab..b52a065dbc 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -185,6 +185,7 @@ F:	package/qt5/qt5coap/
 >  F:	package/qt5/qt5knx/
 >  F:	package/qt5/qt5mqtt/
 >  F:	package/rtl8723ds/
 > +F:	package/rtl8723ds-bt/
 >  F:	package/sam-ba/
 >  F:	package/sshguard/
 >  F:	package/sunwait/
 > diff --git a/package/Config.in b/package/Config.in
 > index 914c3584e9..999feae08a 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -585,6 +585,7 @@ endmenu
 >  	source "package/rtl8192eu/Config.in"
 >  	source "package/rtl8723bu/Config.in"
 >  	source "package/rtl8723ds/Config.in"
 > +	source "package/rtl8723ds-bt/Config.in"
 >  	source "package/rtl8812au-aircrack-ng/Config.in"
 >  	source "package/rtl8821au/Config.in"
 >  	source "package/sane-backends/Config.in"
 > diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
 > new file mode 100644
 > index 0000000000..0a604310c0
 > --- /dev/null
 > +++ b/package/rtl8723ds-bt/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_RTL8723DS_BT
 > +	bool "rtl8723ds-bt"
 > +	help
 > +	  rtl8723ds UART attached Bluetooth module firmware.
 > +
 > +	  https://github.com/wsyco/RTL8723DS_BT_Linux
 > diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash b/package/rtl8723ds-bt/rtl8723ds-bt.hash
 > new file mode 100644
 > index 0000000000..1ec4e350f9
 > --- /dev/null
 > +++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash
 > @@ -0,0 +1,2 @@
 > +# Locally computed
 > +sha256  9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d2f4  rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz
 > diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.mk b/package/rtl8723ds-bt/rtl8723ds-bt.mk
 > new file mode 100644
 > index 0000000000..efd0a5bae9
 > --- /dev/null
 > +++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
 > @@ -0,0 +1,17 @@
 > +################################################################################
 > +#
 > +# rtl8723ds-bt
 > +#
 > +################################################################################
 > +
 > +RTL8723DS_BT_VERSION = 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
 > +RTL8723DS_BT_SITE = $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
 > +RTL8723DS_BT_LICENSE = PROPRIETARY
 > +
 > +define RTL8723DS_BT_INSTALL_TARGET_CMDS
 > +	mkdir -p $(TARGET_DIR)/lib/firmware/rtl_bt/
 > +	cp $(@D)/8723D/rtl8723d_fw $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
 > +	cp $(@D)/8723D/rtl8723d_config $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin

We normally use install -D to install files to control the
permissions. Committed after changing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
