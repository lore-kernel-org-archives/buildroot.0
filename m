Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23986C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 10:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82B8C41002;
	Thu, 20 Oct 2022 10:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82B8C41002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1c1dKp80ZTpJ; Thu, 20 Oct 2022 10:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B005A40256;
	Thu, 20 Oct 2022 10:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B005A40256
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9501BF955
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 10:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B03240256
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 10:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B03240256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uudAy-BzeRzJ for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 10:57:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7BF4013A
 for <buildroot@uclibc.org>; Thu, 20 Oct 2022 10:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7BF4013A
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7889C86ED7; Thu, 20 Oct 2022 10:57:38 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 20 Oct 2022 10:57:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Outdated package
X-Bugzilla-Version: 2022.02.6
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: giulio.benetti@benettiengineering.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15071-163-rsoRhNYfiU@https.bugs.busybox.net/>
In-Reply-To: <bug-15071-163@https.bugs.busybox.net/>
References: <bug-15071-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15071] RTL8723BS library is outdated
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15071

--- Comment #2 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
(In reply to alirezatm from comment #0)

Hi,

it's true, package rtl8723bs is outdated and indeed has been dropped with this
commit:
https://git.busybox.net/buildroot/commit/?id=7763ba7007172ceb5e928ae5902735d727aaa90d

As pointed by:
https://github.com/hadess/rtl8723bs/commit/3bb1d33ad98c1d77b5e17a1b707e137b35e6d0a5
now the driver has made it into staging Linux driver folder.

So you can access and configure Linux by issuing:
$ make linux-menuconfig
and then you can find RTL8723BS driver. But take care because it needs some
CONFIG_ to be enabled:
CONFIG_STAGING=y
CONFIG_WLAN=y
CONFIG_MMC=y
CONFIG_CFG80211=y
CONFIG_MODULES=y

To find these informations you can search "rtl8723bs" in linux-menuconfig(as
well as in Buildroot menuconfig) by typing "/" and there it will be shown the
"depends on" and what it "Selects".

This way you should be able to have the driver built.

Best regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
