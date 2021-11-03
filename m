Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B062C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:08:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F58600EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0F58600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF964032F;
	Wed,  3 Nov 2021 21:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3_fh6425-gi; Wed,  3 Nov 2021 21:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A78840327;
	Wed,  3 Nov 2021 21:08:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E71901BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E429540327
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb7nhwdFy2A4 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:08:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C53A402A0
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:08:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A188020002;
 Wed,  3 Nov 2021 21:07:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1miNUD-0005hx-PA; Wed, 03 Nov 2021 22:07:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211030190206.15318-1-peter@korsgaard.com>
Date: Wed, 03 Nov 2021 22:07:57 +0100
In-Reply-To: <20211030190206.15318-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 Oct 2021 21:02:05 +0200")
Message-ID: <87o871kkwi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openjdk{-bin}: security bump LTS to
 version 11.0.13+8
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
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >   - JDK-8163326, CVE-2021-35550: Update the default enabled cipher suites preference
 >   - JDK-8254967, CVE-2021-35565: com.sun.net.HttpsServer spins on TLS session close
 >   - JDK-8263314: Enhance XML Dsig modes
 >   - JDK-8265167, CVE-2021-35556: Richer Text Editors
 >   - JDK-8265574: Improve handling of sheets
 >   - JDK-8265580, CVE-2021-35559: Enhanced style for RTF kit
 >   - JDK-8265776: Improve Stream handling for SSL
 >   - JDK-8266097, CVE-2021-35561: Better hashing support
 >   - JDK-8266103: Better specified spec values
 >   - JDK-8266109: More Resilient Classloading
 >   - JDK-8266115: More Manifest Jar Loading
 >   - JDK-8266137, CVE-2021-35564: Improve Keystore integrity
 >   - JDK-8266689, CVE-2021-35567: More Constrained Delegation
 >   - JDK-8267086: ArrayIndexOutOfBoundsException in java.security.KeyFactory.generatePublic
 >   - JDK-8267712: Better LDAP reference processing
 >   - JDK-8267729, CVE-2021-35578: Improve TLS client handshaking
 >   - JDK-8267735, CVE-2021-35586: Better BMP support
 >   - JDK-8268193: Improve requests of certificates
 >   - JDK-8268199: Correct certificate requests
 >   - JDK-8268205: Enhance DTLS client handshake
 >   - JDK-8268506: More Manifest Digests
 >   - JDK-8269618, CVE-2021-35603: Better session identification
 >   - JDK-8269624: Enhance method selection support
 >   - JDK-8270398: Enhance canonicalization
 >   - JDK-8270404: Better canonicalization

 > For more details, see the announcement:
 > https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-October/009368.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > OpenJDK-16 seems to be EOL, we should probably migrate to 17.x?

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
