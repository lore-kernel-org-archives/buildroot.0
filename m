Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85AECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07083415C9;
	Mon, 31 Oct 2022 14:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07083415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmffatAlPhDd; Mon, 31 Oct 2022 14:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EAC415AB;
	Mon, 31 Oct 2022 14:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4EAC415AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A57181BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 810F860C22
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810F860C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3AmQlRLZJZb for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:43:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6518060C16
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6518060C16
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:43:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F03020005;
 Mon, 31 Oct 2022 14:43:36 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:43:36 +0100
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Message-ID: <20221031154336.054f589b@windsurf>
In-Reply-To: <lY8yl97I8zmKInD6JUak95yumYNlqBm_os7CmKyW0KbBQLgqRfV_OAobCkbkYk-UU-fX62yqO-A7zDnwy5rJZzAUvk1U_Xjh4942ofJWB3w=@protonmail.com>
References: <lY8yl97I8zmKInD6JUak95yumYNlqBm_os7CmKyW0KbBQLgqRfV_OAobCkbkYk-UU-fX62yqO-A7zDnwy5rJZzAUvk1U_Xjh4942ofJWB3w=@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667227417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNk1XZK37pFbXVJjF2/McHCW4E08Ozi0TLg+ddefNPI=;
 b=S5AlORr0jNRNOTmmmZN3GLpV+3HSjr8qGuXDvPmQLUUl5RcTZXwPWavHJ9A9W6pBx1OiK8
 sdwYvKJ+cth7jmYwFZNS7AxZBoIVJIWo5OByInlrtxL6VTDkewg1decMSR3LSO7UJe6H/x
 +NJ91jkDDGaeNBDD+JTliPw14mX26SyXCuERwe8VDj5Kl8SwtZb1QE7n9qLhv0eF2CDyJf
 zxobxJqq+wi5XRG6hb1A3cl/sVr39p6P0REl+6iuQbsKzvnhL/6KFd+Qw8FbFQuCXdki9U
 wCZmSNblUuzjC051KcGMw/SQWrvEc74/suj/B9T2gw5qdRAMHY1s2VZTD6Vh6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S5AlORr0
Subject: Re: [Buildroot] [PATCH 1/1] package/casync: bump to latest git
 commit (0efa7abffe5f)
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 07:04:28 +0000
Yair Ben-Avraham via buildroot <buildroot@buildroot.org> wrote:

> Drop patches (merged to main)
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  ...castore-fix-build-without-lzma-or-xz.patch | 35 ------------
>  ...tall-udev-rules-without-udev-support.patch | 53 -------------------
>  package/casync/casync.hash                    |  2 +-
>  package/casync/casync.mk                      |  2 +-
>  4 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
>  delete mode 100644 package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
