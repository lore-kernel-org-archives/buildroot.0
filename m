Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2893C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00EB84F4F;
	Fri, 26 Jan 2024 08:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00EB84F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMYmf1nDR8C9; Fri, 26 Jan 2024 08:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3AC384F3D;
	Fri, 26 Jan 2024 08:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3AC384F3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4F21BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7579584F3B
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7579584F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIJdecKBD3aG for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:46:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8251B84F38
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8251B84F38
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB690240002;
 Fri, 26 Jan 2024 08:45:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTHqZ-007vnK-0N;
 Fri, 26 Jan 2024 09:45:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240110220131.1268844-1-fontaine.fabrice@gmail.com>
Date: Fri, 26 Jan 2024 09:45:59 +0100
In-Reply-To: <20240110220131.1268844-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 10 Jan 2024 23:01:31 +0100")
Message-ID: <87le8c4h4o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/kismet: bump to version
 2023-07-R1
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

 > - openssl is a mandatory dependency of BR2_PACKAGE_KISMET_SERVER since
 >   https://github.com/kismetwireless/kismet/commit/d916acf8c0fa36d8d794ce3d0fb87fc180592b6c
 > - pcre2 is an optional dependency since
 >   https://github.com/kismetwireless/kismet/commit/bb1ecb1c5688cafb1914847c2d068f820b847f2b
 > - disable wifi-coconut (enabled by default and depends on libusb:
 >   https://github.com/kismetwireless/kismet/commit/e221b8d45c1598aac64dd4403be1bf7d7df3d0a6)

 > https://kismetwireless.net/posts/kismet-2023-07-r1/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
