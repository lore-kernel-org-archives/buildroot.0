Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A015DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B08560E74;
	Sun, 22 May 2022 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmbkAVJ5-FE3; Sun, 22 May 2022 20:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6B360B8C;
	Sun, 22 May 2022 20:22:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077A01BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAE6360E16
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E47VRNoELCga for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:22:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86C8560B12
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:22:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2AE6D100004;
 Sun, 22 May 2022 20:22:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nss69-00CSwK-WF; Sun, 22 May 2022 22:22:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220419073954.537319-1-peter@korsgaard.com>
 <20220419073954.537319-2-peter@korsgaard.com>
Date: Sun, 22 May 2022 22:22:45 +0200
In-Reply-To: <20220419073954.537319-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 19 Apr 2022 09:39:54 +0200")
Message-ID: <87ilpxxqp6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/openjdk{-bin}: security bump
 17.x to version 17.0.2+8
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
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >   - JDK-8251329: (zipfs) Files.walkFileTree walks infinitely if zip has dir named "." inside
 >   - JDK-8264934, CVE-2022-21248: Enhance cross VM serialization
 >   - JDK-8268488: More valuable DerValues
 >   - JDK-8268494: Better inlining of inlined interfaces
 >   - JDK-8268512: More content for ContentInfo
 >   - JDK-8268813, CVE-2022-21283: Better String matching
 >   - JDK-8269151: Better construction of EncryptedPrivateKeyInfo
 >   - JDK-8269944: Better HTTP transport redux
 >   - JDK-8270386, CVE-2022-21291: Better verification of scan methods
 >   - JDK-8270392, CVE-2022-21293: Improve String constructions
 >   - JDK-8270416, CVE-2022-21294: Enhance construction of Identity maps
 >   - JDK-8270492, CVE-2022-21282: Better resolution of URIs
 >   - JDK-8270498, CVE-2022-21296: Improve SAX Parser configuration management
 >   - JDK-8270646, CVE-2022-21299: Improved scanning of XML entities
 >   - JDK-8270952, CVE-2022-21277: Improve TIFF file handling
 >   - JDK-8271962: Better TrueType font loading
 >   - JDK-8271968: Better canonical naming
 >   - JDK-8271987: Manifest improved manifest entries
 >   - JDK-8272014, CVE-2022-21305: Better array indexing
 >   - JDK-8272026, CVE-2022-21340: Verify Jar Verification
 >   - JDK-8272236, CVE-2022-21341: Improve serial forms for transport
 >   - JDK-8272272: Enhance jcmd communication
 >   - JDK-8272462: Enhance image handling
 >   - JDK-8273290: Enhance sound handling
 >   - JDK-8273756, CVE-2022-21360: Enhance BMP image support
 >   - JDK-8273838, CVE-2022-21365: Enhanced BMP processing
 >   - JDK-8274096, CVE-2022-21366: Improve decoding of image files

 > For more details, see the announcement:

 > https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-January/011709.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
