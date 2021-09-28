Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC83CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BBC6135E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16BBC6135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E603F82D49;
	Tue, 28 Sep 2021 20:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYi6L43VAF2w; Tue, 28 Sep 2021 20:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B3B82D40;
	Tue, 28 Sep 2021 20:36:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9B611BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B659D40815
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogY1z412Mv1g for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:36:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1876540724
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:36:09 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1B6836000C;
 Tue, 28 Sep 2021 20:36:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVJpf-00044O-G6; Tue, 28 Sep 2021 22:36:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
 <20210915205640.1411368-3-fontaine.fabrice@gmail.com>
Date: Tue, 28 Sep 2021 22:36:07 +0200
In-Reply-To: <20210915205640.1411368-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 15 Sep 2021 22:56:40 +0200")
Message-ID: <87wnn0o2tk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/libvirt: security bump to
 version 7.7.0
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - storage: Unlock pool objects on ACL check failures in
 >   storagePoolLookupByTargetPath (CVE-2021-3667)

 >   A logic bug in storagePoolLookupByTargetPath where the storage pool
 >   object was left locked after a failure of the ACL check could
 >   potentially deprive legitimate users access to a storage pool object
 >   by users who don't have access.

 > - svirt: fix MCS label generation (CVE-2021-3631)

 >   A flaw in the way MCS labels were generated could result in a VM's
 >   resource not being fully protected from access by another VM were
 >   it to be compromised. https://gitlab.com/libvirt/libvirt/-/issues/153

 > - Disable Cloud-Hypervisor driver added by
 >   https://gitlab.com/libvirt/libvirt/-/commit/56fbabf1a1e272c6cc50adcb603996cf8e94ad08

 > - Update indentation in hash file (two spaces)

 > https://gitlab.com/libvirt/libvirt/-/blob/v7.7.0/NEWS.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
