Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D627CC77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 20:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0AF56156E;
	Wed,  3 May 2023 20:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0AF56156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIe3CQVxtrm0; Wed,  3 May 2023 20:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1399C61571;
	Wed,  3 May 2023 20:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1399C61571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F077E1BF3E0
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C0341D4E
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C0341D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHa38lWn17Pq for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 20:31:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D45941D40
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D45941D40
 for <buildroot@buildroot.org>; Wed,  3 May 2023 20:31:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1976C0003;
 Wed,  3 May 2023 20:31:02 +0000 (UTC)
Message-ID: <1475bd22-c1e7-fc64-970e-c36214636043@korsgaard.com>
Date: Wed, 3 May 2023 22:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20230502232308.2974424-1-christian@aperture.us>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230502232308.2974424-1-christian@aperture.us>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.19.9
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/05/2023 01.23, Christian Stewart wrote:
> go1.19.9 (released 2023-05-02) includes three security fixes to the
> html/template package, as well as bug fixes to the compiler, the runtime, and
> the crypto/subtle, crypto/tls, net/http, and syscall packages.
> 
> CVE-2023-24539: html/template: improper sanitization of CSS values
> CVE-2023-24540: html/template: improper handling of JavaScript whitespace
> CVE-2023-29400: html/template: improper handling of empty HTML attributes
> 
> https://go.dev/doc/devel/release#go1.19.9
> https://github.com/golang/go/issues?q=milestone%3AGo1.19.9+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Committed, thanks

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
