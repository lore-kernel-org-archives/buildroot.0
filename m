Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF66C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:04:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D67A6115A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D67A6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD11A60814;
	Mon,  8 Nov 2021 15:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwtdC6JaMg6i; Mon,  8 Nov 2021 15:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A4860800;
	Mon,  8 Nov 2021 15:04:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1EE81BF300
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D20CF80C8E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5GUEFnn7DkS for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 15:04:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98A480C12
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 15:04:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A0DF5C0016;
 Mon,  8 Nov 2021 15:04:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mk6C1-0005UP-SZ; Mon, 08 Nov 2021 16:04:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211105124445.2275022-1-fontaine.fabrice@gmail.com>
Date: Mon, 08 Nov 2021 16:04:17 +0100
In-Reply-To: <20211105124445.2275022-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Nov 2021 13:44:45 +0100")
Message-ID: <874k8m7kpa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/snort: security bump to version
 2.9.18.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-40114: Multiple Cisco products are affected by a
 > vulnerability in the way the Snort detection engine processes ICMP
 > traffic that could allow an unauthenticated, remote attacker to cause a
 > denial of service (DoS) condition on an affected device. The
 > vulnerability is due to improper memory resource management while the
 > Snort detection engine is processing ICMP packets. An attacker could
 > exploit this vulnerability by sending a series of ICMP packets through
 > an affected device. A successful exploit could allow the attacker to
 > exhaust resources on the affected device, causing the device to reload.

 > https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-snort-dos-s2R7W9UU
 > https://www.snort.org/downloads/snort/changelog_2.9.18.1.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
