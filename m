Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794FBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C8360F48;
	Tue,  8 Mar 2022 12:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AId_UZDqjjTH; Tue,  8 Mar 2022 12:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5356260F4C;
	Tue,  8 Mar 2022 12:46:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C57A71BF3E9
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E9F415B3
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOwYw9KEbfrr for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 12:46:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9B1C415BA
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 12:46:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 864CF1C0008;
 Tue,  8 Mar 2022 12:46:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRZEY-001Y8X-H5; Tue, 08 Mar 2022 13:46:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220307223355.945328-1-fontaine.fabrice@gmail.com>
Date: Tue, 08 Mar 2022 13:46:34 +0100
In-Reply-To: <20220307223355.945328-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 7 Mar 2022 23:33:55 +0100")
Message-ID: <87r17c393p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: drop custom install
 rules
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

 > Drop custom install rules which have added since commit
 > 676797d57f33fbe9d5adc81932847154ebd1ce93. Indeed, they result in a
 > broken installation. Especially, they are trying to "guess" what must
 > be installed based on BR2_ARCH but oprofile has its own logic. For
 > example, goldmont microarchitecture files must be installed in i386
 > directory even if this architecture is 64 bits:
 > https://sourceforge.net/p/oprofile/oprofile/ci/0ad5a9e6af86a88e1dd41180f45bc48b646eba6a

 > This will result in the following runtime failure:

 > oprofile: could not open unit mask description file /usr/share/oprofile//i386/goldmont/unit_masks
 > Unable to find info for event cpu_clk_unhalted

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=14641

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This might install a bit "too much", but Ok - Better than too
less. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
