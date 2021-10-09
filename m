Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD82C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2414660F6F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2414660F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D790F82FA2;
	Sat,  9 Oct 2021 11:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eivra6QHcD58; Sat,  9 Oct 2021 11:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D11C82F98;
	Sat,  9 Oct 2021 11:50:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5531BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A9B482F8A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpHEGJ1MYfpd for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B82A82F6C
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:50:18 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6B76DE0005;
 Sat,  9 Oct 2021 11:50:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZArn-0003uF-Pf; Sat, 09 Oct 2021 13:50:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211007205953.3744949-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Oct 2021 13:50:15 +0200
In-Reply-To: <20211007205953.3744949-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Oct 2021 22:59:53 +0200")
Message-ID: <87lf32to20.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 8.8p1
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

 > Fix CVE-2021-41617: sshd in OpenSSH 6.2 through 8.x before 8.8, when
 > certain non-default configurations are used, allows privilege escalation
 > because supplemental groups are not initialized as expected. Helper
 > programs for AuthorizedKeysCommand and AuthorizedPrincipalsCommand may
 > run with privileges associated with group memberships of the sshd
 > process, if the configuration specifies running the command as a
 > different user.

 > https://www.openssh.com/txt/release-8.8
 > https://www.openssh.com/txt/release-8.7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
