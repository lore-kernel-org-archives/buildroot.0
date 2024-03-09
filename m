Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC128C54798
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB7F82003;
	Sat,  9 Mar 2024 13:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mqjxVVTURBz; Sat,  9 Mar 2024 13:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DFE81FF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DFE81FF0;
	Sat,  9 Mar 2024 13:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1845C1BF300
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1226381FC6
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bff99iuS1KIq for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46D2881FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D2881FE4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46D2881FE4
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:34:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E23FBFF803;
 Sat,  9 Mar 2024 13:33:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riwpr-005P96-0j;
 Sat, 09 Mar 2024 14:33:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240211145446.270865-1-bernd@kuhls.net>
Date: Sat, 09 Mar 2024 14:33:59 +0100
In-Reply-To: <20240211145446.270865-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 11 Feb 2024 15:54:46 +0100")
Message-ID: <87cys3v8ag.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.6.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Changelog: https://curl.se/changes.html#8_6_0
 > Removed patch which was included in upstream release.

 > Updated license hash due to copyright year bump:
 > https://github.com/curl/curl/commit/57cc70e559aa065426021e22e2af8166af6084f6

 > Added configure options for optional libpsl support due to upstream
 > commit which throws an error during configure when libpsl is missing and
 > --without-libpsl was not used:
 > https://github.com/curl/curl/commit/2998874bb61ac6ef3b72d6a61467cd2aaf6e53ea

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>


Committed to 2023.02.x and 2023.11.x because of the security fix it
contains, please mention such info in the future - thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
