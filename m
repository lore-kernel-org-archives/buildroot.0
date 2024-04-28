Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C9C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D787402F8;
	Sun, 28 Apr 2024 11:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqZIW7uct3Po; Sun, 28 Apr 2024 11:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F0540507
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F0540507;
	Sun, 28 Apr 2024 11:16:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7241BF5DF
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8562060611
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbtms5FhQTDi for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FB2960619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB2960619
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FB2960619
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:15:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D561260003;
 Sun, 28 Apr 2024 11:15:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12Vg-003IKI-0d;
 Sun, 28 Apr 2024 13:15:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
Date: Sun, 28 Apr 2024 13:15:56 +0200
In-Reply-To: <20240324205324.491751-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Mar 2024 21:53:24 +0100")
Message-ID: <87frv5eo0j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/thermald: bump to version 2.5.6
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/intel/thermal_daemon/blob/v2.5.6/README.txt
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This mentions that it now uses GDBus instead of glib-dbus by default
now:

https://github.com/intel/thermal_daemon/commit/92a8459582c826343ba22e3dc8fa5e563ae3f9ac

Do we then still need the dbus-glib dependency?

> ---
 >  package/thermald/thermald.hash | 2 +-
 >  package/thermald/thermald.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
 > index 9693813ca9..fff5ae6284 100644
 > --- a/package/thermald/thermald.hash
 > +++ b/package/thermald/thermald.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed:
 > -sha256  75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5  thermald-2.5.1.tar.gz
 > +sha256  e5a452624f133d71f4aff0bd0c8f8258399a5ae1a7d5aea177fa6a6e33dad1fd  thermald-2.5.6.tar.gz
 >  sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
 > diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
 > index fd0246745f..9faa47683b 100644
 > --- a/package/thermald/thermald.mk
 > +++ b/package/thermald/thermald.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -THERMALD_VERSION = 2.5.1
 > +THERMALD_VERSION = 2.5.6
 >  THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 >  # fetched from Github, with no configure script
 >  THERMALD_AUTORECONF = YES
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
