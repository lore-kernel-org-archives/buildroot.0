Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6765E40528;
	Sun,  1 Jan 2023 14:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6765E40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLkemkaGBBQq; Sun,  1 Jan 2023 14:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0B04017B;
	Sun,  1 Jan 2023 14:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0B04017B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AEAD1BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8417960BC5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8417960BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPjnNpx8KGBM for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:35:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E8560A70
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09E8560A70
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:35:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA658240004;
 Sun,  1 Jan 2023 14:35:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pBzQi-000Vks-PM; Sun, 01 Jan 2023 15:35:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221222133247.85785-1-fontaine.fabrice@gmail.com>
Date: Sun, 01 Jan 2023 15:35:16 +0100
In-Reply-To: <20221222133247.85785-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Dec 2022 14:32:47 +0100")
Message-ID: <87tu1ae317.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: security bump to version
 4.5.0
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

 > Fix CVE-2022-2056, CVE-2022-2057, CVE-2022-2058, CVE-2022-2519,
 > CVE-2022-2520, CVE-2022-2521, CVE-2022-2953, CVE-2022-34526,
 > CVE-2022-3570, CVE-2022-3597, CVE-2022-3598, CVE-2022-3599,
 > CVE-2022-3626, CVE-2022-3627 and CVE-2022-3970

 > - COPYRIGHT renamed to LICENSE.md and year updated with
 >   https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b
 > - Use new --{en,dis}able options added by
 >   https://gitlab.com/libtiff/libtiff/-/commit/1ab0e2696a368a556b793a0941b5365e4d9f56ef

 > http://www.simplesystems.org/libtiff/releases/v4.5.0.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
