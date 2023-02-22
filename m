Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F74C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CEA6137D;
	Wed, 22 Feb 2023 20:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CEA6137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SFsTsmyuKDp; Wed, 22 Feb 2023 20:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 654D761385;
	Wed, 22 Feb 2023 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654D761385
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 865A31BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611A4402DC
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611A4402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C38JU6GRRJO7 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:56:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEED740135
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEED740135
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:56:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 97C5640003;
 Wed, 22 Feb 2023 20:56:33 +0000 (UTC)
Date: Wed, 22 Feb 2023 21:56:32 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230222215632.11f5f7b0@windsurf>
In-Reply-To: <20221229184520.68111-1-giulio.benetti@benettiengineering.com>
References: <20221229184520.68111-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677099393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6BV6p1Wl5Apjuhqzs3gqdRufJrip3x2Bzt2mVZTgHU=;
 b=o+80O/fwOhvDZGFA3oBSVcfUzTB9XfnhM1uQVdM7pTySoxlWjte+QJWHtO4s4YvbPEB8UT
 xrd5ETaTH9XtqVo/EL0MIVs6c05RLGkdD9m7Y745RyHjCubCMmNJnRjgqHqhyrL3+KWbcI
 H0QYPAVh4ae+xkHFadk4KnerVVMajoT8RjyA/w6YftbAXxF5S/YmDXzGBeJOfeJvq+egWK
 sGur6A/xj7VGW4ZNyXi65jEh8YaG1GA9Q4wkfgTklA6eokGUAmKojVYHr+NgDju4LTQL1+
 X3w7IaBgIqNhg/nSwitYZWymo2QtBoywnJ84HRj4M4fdCqgdYVQ/I6LZyoLtLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o+80O/fw
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2022-12-29
 version on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 29 Dec 2022 19:45:20 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Drop local patch since it's been merged[0].
> 
> [0]: https://github.com/clnhub/rtl8192eu-linux/pull/69
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...e-due-to-redefition-of-local-sha256-.patch | 108 ------------------
>  package/rtl8192eu/rtl8192eu.hash              |   2 +-
>  package/rtl8192eu/rtl8192eu.mk                |   2 +-
>  3 files changed, 2 insertions(+), 110 deletions(-)
>  delete mode 100644 package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
