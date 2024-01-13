Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B72EC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 07:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79806FB3A;
	Sat, 13 Jan 2024 07:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79806FB3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgEoKPzb0B3f; Sat, 13 Jan 2024 07:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C94F6FACD;
	Sat, 13 Jan 2024 07:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C94F6FACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C223A1BF2A5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 07:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB0C4BAFA
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 07:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB0C4BAFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoKuvKNRq6gK for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 07:52:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6917D4BAEA
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 07:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6917D4BAEA
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA5A840003;
 Sat, 13 Jan 2024 07:52:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOYoW-00CXX0-0W;
 Sat, 13 Jan 2024 08:52:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 fontaine.fabrice@gmail.com
References: <20240106095524.0610E81D7B@busybox.osuosl.org>
Date: Sat, 13 Jan 2024 08:52:20 +0100
In-Reply-To: <20240106095524.0610E81D7B@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 6 Jan 2024 10:51:59 +0100")
Message-ID: <87ply5wtzf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/avahi: fix libavahi-client
 handling
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f8332fa63d665d69f6f07524f1b320f589e1f23c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > libavahi-client is built without daemon since bump to version 0.6.32 in
 > commit 61c056d40bc51f99f8be19b7e77894a5e6565fd6 and
 > https://github.com/avahi/avahi/commit/54086a11033194e629b6ad7039bcb4fb1628e052

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Oddly enough, I didn't receive the original mail from Fabrice, but it is
in the archive, so probably an issue on my side.

Does this change really make sense in the context of Buildroot? Libavahi
is a library to talk to the avahi daemon, so not very useful without the
daemon.

The original commit talks about multilib, E.G. presumably for a use case
where the daemon is built once and the library built both in 32bit and
64bit and used on the same system, but that isn't really a Buildroot use
case.

> ---
 >  package/avahi/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/avahi/Config.in b/package/avahi/Config.in
 > index 2484d8ce5c..728bc4fdd1 100644
 > --- a/package/avahi/Config.in
 > +++ b/package/avahi/Config.in
 > @@ -38,7 +38,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
 >  # more easily determine if it's available or not.
 >  config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 >  	bool
 > -	default y if BR2_PACKAGE_AVAHI_DAEMON && BR2_PACKAGE_DBUS
 > +	default y if BR2_PACKAGE_DBUS
 
 >  config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 >  	bool "libdns_sd compatibility (Bonjour)"
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
