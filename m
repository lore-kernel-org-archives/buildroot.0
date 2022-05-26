Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2303C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C15D8458F;
	Thu, 26 May 2022 08:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HT07XTPD5H2g; Thu, 26 May 2022 08:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923C084564;
	Thu, 26 May 2022 08:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EABD1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D9A584564
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IXy12WnG6Ab for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:10:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2163084473
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:10:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F089100002;
 Thu, 26 May 2022 08:10:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu8a0-00HHsy-LE; Thu, 26 May 2022 10:10:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220419200122.4095481-1-fontaine.fabrice@gmail.com>
 <cfba7e93-1592-4163-9dde-81cfc93494d2@mind.be>
Date: Thu, 26 May 2022 10:10:48 +0200
In-Reply-To: <cfba7e93-1592-4163-9dde-81cfc93494d2@mind.be> (Arnout
 Vandecappelle's message of "Sat, 23 Apr 2022 17:10:30 +0200")
Message-ID: <87mtf4sohj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/shim: add
 BR2_PACKAGE_SHIM_ARCH_SUPPORTS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 19/04/2022 22:01, Fabrice Fontaine wrote:
 >> Add BR2_PACKAGE_SHIM_ARCH_SUPPORTS as requested by Thomas Petazzoni in
 >> https://patchwork.ozlabs.org/project/buildroot/patch/20220419121409.2055818-1-fontaine.fabrice@gmail.com
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> boot/shim/Config.in | 13 ++++++++++---
 >> 1 file changed, 10 insertions(+), 3 deletions(-)
 >> diff --git a/boot/shim/Config.in b/boot/shim/Config.in
 >> index b0e549a51b..a762ad9215 100644
 >> --- a/boot/shim/Config.in
 >> +++ b/boot/shim/Config.in
 >> @@ -1,8 +1,15 @@
 >> -config BR2_TARGET_SHIM
 >> -	bool "shim"
 >> +config BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 >> +	bool
 >> # it includes gnu-efi
 >> depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS

 >  depends comes after default (as reported by check-package).

 >  Applied to master with that fixed, thanks.

Committed to 2022.02.x with the same fix, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
