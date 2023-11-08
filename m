Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54086C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 09:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A7361010;
	Wed,  8 Nov 2023 09:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A7361010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4SFt5E5SVIZ; Wed,  8 Nov 2023 09:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEBE61004;
	Wed,  8 Nov 2023 09:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CEBE61004
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC3611BF423
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C279260FD7
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C279260FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xs5DVdiOePP8 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 09:24:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD26A61004
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 09:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD26A61004
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEDC440005;
 Wed,  8 Nov 2023 09:24:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0enM-000BFF-1F;
 Wed, 08 Nov 2023 10:24:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231101180606.18319-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 10:24:20 +0100
In-Reply-To: <20231101180606.18319-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 Nov 2023 19:06:06 +0100")
Message-ID: <87cywktx6j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-lwp-protocol-https: add
 CPE variables
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:lwp\:\:protocol\:\:https_project:lwp\:\:protocol\:\:https is a
 > valid CPE identifier for this package:

 >   https://nvd.nist.gov/products/cpe/detail/804408BE-097D-4FE3-B6DB-29324871C6B9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
 > index 960de52f0b..ff9ee936dc 100644
 > --- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
 > +++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
 > @@ -9,6 +9,8 @@ PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VE
 >  PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 >  PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 >  PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
 > +PERL_LWP_PROTOCOL_HTTPS_CPE_ID_VENDOR = lwp\:\:protocol\:\:https_project
 > +PERL_LWP_PROTOCOL_HTTPS_CPE_ID_PRODUCT = lwp\:\:protocol\:\:https

Committed to 2023.02.x and 2023.08.x, thanks.

It is somewhat ugly that we need to escape those : characters :/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
