Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F7DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920558276E;
	Sun, 22 May 2022 20:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KvFFsceWtb8; Sun, 22 May 2022 20:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17D18274E;
	Sun, 22 May 2022 20:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D94501BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8BAF8274E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APUCHXHqvKwv for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:22:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2C4182741
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:22:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B1DB20003;
 Sun, 22 May 2022 20:22:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nss64-00CSvk-Al; Sun, 22 May 2022 22:22:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220419073954.537319-1-peter@korsgaard.com>
Date: Sun, 22 May 2022 22:22:40 +0200
In-Reply-To: <20220419073954.537319-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 19 Apr 2022 09:39:53 +0200")
Message-ID: <87mtf9xqpb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk{-bin}: security bump
 11.x to version 11.0.14.1+1
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
 >   - JDK-8217375: jarsigner breaks old signature with long lines in manifest
 >   - JDK-8251329: (zipfs) Files.walkFileTree walks infinitely if zip has dir named "." inside
 >   - JDK-8264934, CVE-2022-21248: Enhance cross VM serialization
 >   - JDK-8268488: More valuable DerValues
 >   - JDK-8268494: Better inlining of inlined interfaces
 >   - JDK-8268512: More content for ContentInfo
 >   - JDK-8268795: Enhance digests of Jar files
 >   - JDK-8268801: Improve PKCS attribute handling
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
 >   - JDK-8279541: Improve HarfBuzz

 > For more details, see the announcement:

 > https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-January/011643.html
 > https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-February/012348.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
