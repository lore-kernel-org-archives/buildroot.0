Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE232C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1876460E7E;
	Sun,  7 Jan 2024 22:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1876460E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRlT6uRbxJia; Sun,  7 Jan 2024 22:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C4A460E50;
	Sun,  7 Jan 2024 22:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C4A460E50
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7591BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC45404EC
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC45404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id haW1d2L-pR0g for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:26:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D5B404B6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D5B404B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85B67C0003;
 Sun,  7 Jan 2024 22:26:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMbas-006m6C-2J;
 Sun, 07 Jan 2024 23:26:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
Date: Sun, 07 Jan 2024 23:26:10 +0100
In-Reply-To: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 20 Dec 2023 21:01:07
 +0100")
Message-ID: <87cyuczsot.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] package/glibc: add proper CPE ID
 version detail
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
Cc: Romain Naour <romain.naour@gmail.com>, peter.verbrugge@technolution.nl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > As reported in bug 15895, the GLIBC_VERSION field having a value
 > looking like 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701, it
 > prevents the CPE/CVE matching with the NVD database to work correctly.

 > This commit fixes that by defining GLIBC_CPE_ID_VERSION, derived from
 > GLIBC_VERSION, by extracting the base version.

 > Also, we update GLIBC_IGNORE_CVES to account for the CVEs that have
 > clearly been fixed between 2.38 and
 > 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701. There are a number
 > of other CVEs still affecting the glibc package, but they are not
 > related to this
 > 2.38...2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701 range.

 > Fixes: #15895

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x (after adjusting to 2.36.x hashes) and 2023.11.x,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
