Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368BFC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F84441722;
	Wed, 28 Feb 2024 21:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zha3gSHWKhYR; Wed, 28 Feb 2024 21:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265BC41766
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265BC41766;
	Wed, 28 Feb 2024 21:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E0C1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8314F4029B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awoBxpDI6Uhe for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C4604026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C4604026F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C4604026F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:17:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C2A1E0002;
 Wed, 28 Feb 2024 21:17:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfRIx-003101-2Z;
 Wed, 28 Feb 2024 22:17:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240203180810.146553-1-fontaine.fabrice@gmail.com>
Date: Wed, 28 Feb 2024 22:17:31 +0100
In-Reply-To: <20240203180810.146553-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Feb 2024 19:08:10 +0100")
Message-ID: <87plwgjnkk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: update
 XLIB_LIBXPM_CPE_ID_VENDOR
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

 > cpe:2.3:a:libxpm_project:libxpm has been deprecated in favor of
 > cpe:2.3:a:x.org:libxpm in October 2023:

 >   <cpe-item name="cpe:/a:libxpm_project:libxpm:3.5.15" deprecated="true" deprecation_date="2023-10-17T15:55:35.850Z">
 >     <title xml:lang="en-US">Libxpm Project Libxpm 3.5.15</title>
 >       <reference href="https://gitlab.freedesktop.org/xorg/lib/libxpm/-/tags">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libxpm_project:libxpm:3.5.15:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:x.org:libxpm:3.5.15:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
