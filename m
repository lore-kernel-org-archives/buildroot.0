Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03B8C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 14:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC44E61101
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 14:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC44E61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B394C403FC;
	Fri, 20 Aug 2021 14:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTnlIfhaYz7a; Fri, 20 Aug 2021 14:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377D840634;
	Fri, 20 Aug 2021 14:33:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65411BF371
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 14:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9488960614
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 14:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6arKri2KHKt for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 14:33:38 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd14171.aruba.it (smtpcmd14171.aruba.it [62.149.156.171])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8410613FB
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 14:33:37 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.181.120])
 by Aruba Outgoing Smtp  with ESMTPSA
 id H5TZm3h2arIRlH5TZmrfNv; Fri, 20 Aug 2021 16:26:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629469593; bh=bmbBxl04/weRxRPjBBIPLlWYmJX9uNyyrg3uCq3EbBg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=nse9zUmHgcKW7fidm2eQC2PuWFxlTBunIHtCV1vhbd2rhAQoqNKQhbIB0il6ZoGgi
 Dq+KFQGPxHC6r1bz0RwdL8Hy5NQbBF8HD3bWpaflRV9HG9wfWQIzXy25dpDnF8aFLw
 e5fUc2RmY75ZAI3sjvKd6fmObpVyuQc2+KprXhqFeU3JM7QqRaSRYTfa1cRzSrZ7G7
 OHH5TNYr/HdV+4PwSiH1YI8LGV9nRvZCwD5H9t8kH8fiHK4S8Iu71wV5kkylqcTvC6
 hvx+SNH3/MFEV1QJ6JRdAOhiBY/LvmcfU34np4bBhMqZUwwo91ywPRIA5Uu8WZ9csO
 X47/qJNs2TASg==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
 <20210819152852.760ec08d@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f4e339cb-a699-afd1-5d5c-68bd1ea147fc@benettiengineering.com>
Date: Fri, 20 Aug 2021 16:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819152852.760ec08d@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJq8RmNUk298QB4Orke830k58gMwZs8VHGNavH8DUmRl3RZK3lKIW9BrMY65sJEwKHvOjZ0d1FhNiKSqnbrpmhCjYpafV/Lvqfb4BTrRSiQA+nD//ALi
 SiYN2q6FlVMZDfSpq7gsHPnLxeZYypNRmVoz5NWj8i5dPKaz6pL7NpoatrChJrchMUpwS/xZufvArX/ztyzy+URO+08zcOTp9TV2TMYhwV3QARO14b5au5w1
 /Fs2kV5OMixHwHyudeUlS0/m2yZnfrGm3pV/6oQwkRPiRsR7wBfWHOBCsEFssYlQVhWOZjVMHkaepv4vyhUX3PjKNFWqAS+Xr/tFgzfbu9W8zPghsHOWW+fJ
 LHRoz/pKLgLLwetB2zz6yqfzlIxFIivtA51MoD5aoizmLfqINwXX44G/dNhwf6lXuTrmdfIzQ2i4jozAdfpkkMFzzH7HeiZcdQTghFNuLq0Dhg+1kyshX65q
 pYTM5mkEQnhvj+9RorOO1BNRy5uOsL167Tv07/eYpCu5dIN+bPbvVDCeE05Na1iGPzYvZ+w9Xhm3opqegs8WqdojuN0cvQ148xdPTdmo86TxwKq297tfUrT/
 n/jCWkp3isEdYESmK47nD14P
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Herve Codina <herve.codina@bootlin.com>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On 8/19/21 3:28 PM, Thomas Petazzoni wrote:
>>>>       or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/92c086b0c5c2a298a82a6eb9c289dc53c58a5e5e |
>>>
>>> Top-level parallel build, no idea what the issue is.

This doesn't show up on my pc, but instead it ends up with openal 
package build failure due to Bootlin toolchain not updated.

Basically I can't reach lapack to build because it fails early on 
openal. And most of all it doesn't build with parallel top-level simply 
using br-reproduce-build found here(I only have output/ instead of 
output-1/ and output-2):
https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

I remember that other build with top parallel but not this. Can somebody 
double check and tell me if it build with top parallel?
Also because on Autobuilder it shows output-1/

Thanks in advance!
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
