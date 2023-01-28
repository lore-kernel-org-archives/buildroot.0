Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51FC636CC
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2083F60E5E;
	Sat, 28 Jan 2023 22:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2083F60E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdcqSUTF72sT; Sat, 28 Jan 2023 22:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C76760E41;
	Sat, 28 Jan 2023 22:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C76760E41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAB0D1BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5912160E41
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5912160E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piAWKwLFGHOU for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:03:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433AF60C2C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 433AF60C2C
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:03:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9670100003;
 Sat, 28 Jan 2023 22:03:34 +0000 (UTC)
Date: Sat, 28 Jan 2023 23:03:34 +0100
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20230128230334.53701026@windsurf>
In-Reply-To: <20230128060349.4029-1-huth@tuxfamily.org>
References: <20230128060349.4029-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674943415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iP1khTzrTCJloLiEbQMYcGquizbRs9JWpgQTYkFnJUw=;
 b=h+IXYfzFuMcwE3tHkBVfAr1I+49j3DSgJak0DW2GKiX9R8mFhqRE+sklsJZIO7xvJaf895
 lHwT6S7YHo3MRbVFfoRjLdN5hnwLepNLdJBIxNnmRvvv9OGnAWZDPjagKQN7+YovhoZM4E
 3Fm8wzoSF/87+6dLcpuHKgqJTD5NFmaL5ASgdDMU/xXbQReacDJJE6m97PdHdf1qKov8QE
 H3SIXxlar8xAj+fQbcZ9/BQsyXn2GSIVCVLBK4wW0Klb1dMt0TaCQ62lKGL+IwVHrcNeWT
 zM61RJbaLOQL+t18xFWT5uu8agZh13LugoOPvyqeZOrh7WrftZEjl+NjEp7llQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h+IXYfzF
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: bump to version
 2023-01-05
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
Cc: Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 28 Jan 2023 07:03:49 +0100
Thomas Huth <huth@tuxfamily.org> wrote:

> A new kvm-unit-tests version has recently been tagged, so let's
> update to that version now.
> This new version now features a --disable-werror parameter for
> the configure script, so we can drop the patch for disabling
> this manually now.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  ...emove-Werror-to-avoid-build-failures.patch | 30 -------------------
>  package/kvm-unit-tests/kvm-unit-tests.hash    |  2 +-
>  package/kvm-unit-tests/kvm-unit-tests.mk      |  3 +-
>  3 files changed, 3 insertions(+), 32 deletions(-)
>  delete mode 100644 package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch

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
