Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC0C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FD8425A2;
	Sat,  8 Jun 2024 16:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvwcneI0UiX2; Sat,  8 Jun 2024 16:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC48C425A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC48C425A3;
	Sat,  8 Jun 2024 16:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2531BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57E0F425A2
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pryuNDbGx5a for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C13E425A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C13E425A1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C13E425A1
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19558E0002;
 Sat,  8 Jun 2024 16:47:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzEE-002637-1J;
 Sat, 08 Jun 2024 18:47:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-3-aperez@igalia.com>
Date: Sat, 08 Jun 2024 18:47:42 +0200
In-Reply-To: <20240522091608.3659847-3-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 22 May 2024 12:16:05 +0300")
Message-ID: <87o78bz8i9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/4] package/wpewebkit: security bump to
 version 2.44.2
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to the most recent stable release of WPE WebKit. As this is a
 > change to a newer release series, there are a few changes in the CMake
 > build options. Dependencies mostly remain the same. The main changes
 > are:

 >  - The new ENABLE_WEB_CODECS option is set along with ENABLE_VIDEO and
 >    ENABLE_WEB_RTC depending on BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA.
 >  - The new USE_LIBBACKTRACE option is set accordingly, depending on
 >    BR2_PACKAGE_LIBBACKTRACE.
 >  - WebAssembly does not work with ENABLE_C_LOOP, so it needs to be
 >    disabled alongside it for MIPSr6, ARMv5 and ARMv6; not that building
 >    WebAssembly support is enabled by default.
 >  - ENABLE_ACCESSIBILITY has been removed, instead the new USE_ATK option
 >    can be used to the same effect.
 >  - JPEG2000 is no longer supported, the openjpeg dependency is removed.

 > Release notes and announcement:

 >   - https://wpewebkit.org/blog/2024-wpewebkit-2.44.html

 >   - https://wpewebkit.org/release/wpewebkit-2.44.0.html
 >   - https://wpewebkit.org/release/wpewebkit-2.44.1.html
 >   - https://wpewebkit.org/release/wpewebkit-2.44.2.html

 > Relevant security advisories:

 >   - https://wpewebkit.org/security/WSA-2024-0002.html
 >   - https://wpewebkit.org/security/WSA-2024-0003.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
