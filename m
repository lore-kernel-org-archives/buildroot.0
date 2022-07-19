Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3056AC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FC6640C61;
	Tue, 19 Jul 2022 16:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FC6640C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkgpFyl8UXlC; Tue, 19 Jul 2022 16:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F1D404C6;
	Tue, 19 Jul 2022 16:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F1D404C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90D2C1BF283
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78D3960B7D
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D3960B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zN5eEM-0LIEM for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:00:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2E160AF2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A2E160AF2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:00:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33D72240007;
 Tue, 19 Jul 2022 16:00:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDpeW-002s8F-3l; Tue, 19 Jul 2022 18:00:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220615210107.120358-1-fontaine.fabrice@gmail.com>
 <f9b44c8a-f183-64ee-139a-d842322e2f48@korsgaard.com>
Date: Tue, 19 Jul 2022 18:00:52 +0200
In-Reply-To: <f9b44c8a-f183-64ee-139a-d842322e2f48@korsgaard.com> (Peter
 Korsgaard's message of "Sun, 19 Jun 2022 14:49:25 +0200")
Message-ID: <87pmi12itn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qdecoder: security bump to
 version 12.1.0
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On 15/06/2022 23.01, Fabrice Fontaine wrote:
 >> This is a maintenance release includes important security updates that
 >> fixes possible vulnerability in URL decoding (see the report attached
 >> below). All the qDecoder users are recommended to upgrade to this
 >> version as soon as possible.
 >> Fix CVE-2022-32265
 >> Update hash of COPYING (change in year and URL removed:
 >> https://github.com/wolkykim/qdecoder/commit/51bdcc2c158f2a12a817e8ebcb18f56e3121a808
 >> https://github.com/wolkykim/qdecoder/commit/745878212df963a7a8081f09a747730e74faae63)
 >> https://github.com/wolkykim/qdecoder/releases/tag/v12.1.0
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
