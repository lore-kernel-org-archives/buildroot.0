Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18008EE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A303081376;
	Wed, 13 Sep 2023 20:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A303081376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGkBJQi7e-Me; Wed, 13 Sep 2023 20:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2308136E;
	Wed, 13 Sep 2023 20:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE2308136E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25FC71BF5F5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F38ED60ABE
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38ED60ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEc7ZQgiwW0m for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:09:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCED060A89
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCED060A89
Received: by mail.gandi.net (Postfix) with ESMTPSA id 954571C0002;
 Wed, 13 Sep 2023 20:09:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgWB2-007jbF-LH; Wed, 13 Sep 2023 22:09:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20230830155926.2831345-1-aduskett@gmail.com>
Date: Wed, 13 Sep 2023 22:09:32 +0200
In-Reply-To: <20230830155926.2831345-1-aduskett@gmail.com> (Adam Duskett's
 message of "Wed, 30 Aug 2023 09:59:26 -0600")
Message-ID: <87sf7hzvgj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.20+8 and 17.0.8+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Fixed the following security issues:
 > * CVEs
 >   - CVE-2023-22006
 >   - CVE-2023-22036
 >   - CVE-2023-22041
 >   - CVE-2023-22044
 >   - CVE-2023-22045
 >   - CVE-2023-22049
 >   - CVE-2023-25193
 > * Security fixes
 >   - JDK-8298676: Enhanced Look and Feel
 >   - JDK-8300285: Enhance TLS data handling
 >   - JDK-8300596: Enhance Jar Signature validation
 >   - JDK-8301998, JDK-8302084: Update HarfBuzz to 7.0.1
 >   - JDK-8302475: Enhance HTTP client file downloading
 >   - JDK-8302483: Enhance ZIP performance
 >   - JDK-8303376: Better launching of JDI
 >   - JDK-8304468: Better array usages
 >   - JDK-8305312: Enhanced path handling
 >   - JDK-8308682: Enhance AES performance

 > For details, see the announcements:
 > https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024064.html
 > https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024063.html

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
