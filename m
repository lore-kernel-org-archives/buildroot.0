Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C019C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226D784C5E;
	Fri, 28 Jan 2022 18:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0Rs0R9E6gfQ; Fri, 28 Jan 2022 18:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C32084C5B;
	Fri, 28 Jan 2022 18:11:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 176BC1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05F0961141
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZ3ppKXRUQJH for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:11:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A301461140
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:11:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDA16100004;
 Fri, 28 Jan 2022 18:11:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDViI-0006Yp-UR; Fri, 28 Jan 2022 19:11:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
Date: Fri, 28 Jan 2022 19:11:10 +0100
In-Reply-To: <20220128105917.30421-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Fri, 28 Jan 2022 11:59:16 +0100")
Message-ID: <87sft77mtd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.69.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas.devoogdt@gmail.com> writes:

 > The internal_pcre option was dropped in:
 > https://gitlab.gnome.org/GNOME/glib/-/commit/9fbd7f3dc1f029b64b6991a540402b2bfa98de5c

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > ---
 >  package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
 >  package/libglib2/libglib2.hash                     | 4 ++--
 >  package/libglib2/libglib2.mk                       | 6 ++----
 >  3 files changed, 5 insertions(+), 7 deletions(-)

 > +++ b/package/libglib2/libglib2.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -LIBGLIB2_VERSION_MAJOR = 2.68
 > -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 > +LIBGLIB2_VERSION_MAJOR = 2.69
 > +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1

The "odd" libglib versions numbers are afaik development versions. We
normally only use stable versions in Buildroot. Do you have any idea
when 2.70 is planned?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
