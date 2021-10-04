Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DE3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:10:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E4B6136F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E4B6136F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10E3406FB;
	Mon,  4 Oct 2021 12:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk9IjgKmgdcT; Mon,  4 Oct 2021 12:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C48405C9;
	Mon,  4 Oct 2021 12:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FF711BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 703CA606A2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3_OKaID95lZ for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:10:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C5046069B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:10:01 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AC4D51BF204;
 Mon,  4 Oct 2021 12:09:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXMn7-0002hY-OX; Mon, 04 Oct 2021 14:09:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Oct 2021 14:09:57 +0200
In-Reply-To: <20210919100842.2071860-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 19 Sep 2021 12:08:42 +0200")
Message-ID: <874k9xj8iy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.5.0
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
Cc: Julian Scheel <julian@jusst.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://www.cryptopp.com/release850.html
 > https://www.cryptopp.com/release840.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Hmm, so 8.4.0 reverted the security fix in 8.3.0? What do we then do?
Bump to 8.5.0 in all stable branches?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
