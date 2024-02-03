Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D924C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB3941F8F;
	Sat,  3 Feb 2024 18:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB3941F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMLbbJSS9ofd; Sat,  3 Feb 2024 18:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C861141B87;
	Sat,  3 Feb 2024 18:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C861141B87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB1B71BF990
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5A1560BE0
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2L4S8MjkbOeG for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 652DB60AFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 652DB60AFC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 652DB60AFC
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:31:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 823FE20007;
 Sat,  3 Feb 2024 10:31:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWDJN-009GM9-31;
 Sat, 03 Feb 2024 11:31:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <Zb0RQA8kV+RXOd0h@waldemar-brodkorb.de>
Date: Sat, 03 Feb 2024 11:31:49 +0100
In-Reply-To: <Zb0RQA8kV+RXOd0h@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 2 Feb 2024 16:58:56 +0100")
Message-ID: <87msshu9d6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2 v2] package/asterisk: bump to 20.6.0
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See here for changes:
 > https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 v1-> v2:
 >  - use separate libjwt package instead of bundled one, suggested by
 >    Peter Korsgaard
 > ---
 >  package/asterisk/Config.in     | 1 +
 >  package/asterisk/asterisk.hash | 2 +-
 >  package/asterisk/asterisk.mk   | 6 ++++--
 >  3 files changed, 6 insertions(+), 3 deletions(-)

 > diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
 > index c52456f8fc..662f070dac 100644
 > --- a/package/asterisk/Config.in
 > +++ b/package/asterisk/Config.in
 > @@ -10,6 +10,7 @@ config BR2_PACKAGE_ASTERISK
 >  	select BR2_PACKAGE_LIBCURL
 >  	select BR2_PACKAGE_LIBEDIT
 >  	select BR2_PACKAGE_LIBILBC
 > +	select BR2_PACKAGE_LIBJWT
 >  	select BR2_PACKAGE_LIBXML2
 >  	select BR2_PACKAGE_SQLITE
 >  	select BR2_PACKAGE_UTIL_LINUX
 > diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
 > index 246f4219aa..d50955dd2b 100644
 > --- a/package/asterisk/asterisk.hash
 > +++ b/package/asterisk/asterisk.hash
 > @@ -1,5 +1,5 @@
 >  # Locally computed
 > -sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
 > +sha256  088dbc08916e21528dba364f5452b2090b066dbba4548b32ec10af138d4b442f  asterisk-20.6.0.tar.gz
 
 >  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 >  # sha256 locally computed
 > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
 > index d1f3ea82d3..869e4128ff 100644
 > --- a/package/asterisk/asterisk.mk
 > +++ b/package/asterisk/asterisk.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -ASTERISK_VERSION = 20.5.2
 > +ASTERISK_VERSION = 20.6.0
 >  # Use the github mirror: it's an official mirror maintained by Digium, and
 >  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 >  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 > @@ -27,7 +27,7 @@ ASTERISK_SELINUX_MODULES = asterisk
 
 >  # For patches 0002 and 0003
 >  ASTERISK_AUTORECONF = YES
 > -ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
 > +ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson -Ithird-party/libjwt

Why do we still need to point autoreconf to the bundle libjwt?

Even worse, I see the following during the configure step:

checking for embedded pjproject (may have to download)... configuring
[pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.13.1/pjproject-2.13.1.tar.bz2 to /tmp/pjproject-2.13.1.tar.bz2
[pjproject]  Verifying /tmp/pjproject-2.13.1.tar.bz2
[pjproject]  Verify successful
[pjproject]  Verifying /tmp/pjproject-2.13.1.tar.bz2
[pjproject]  Verify successful
[pjproject]  Unpacking /tmp/pjproject-2.13.1.tar.bz2

We don't want packages to download stuff behind our back. Can we use an
external pjproject?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
