Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3474ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994448126C;
	Sun, 30 Oct 2022 20:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994448126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQJvIpf5ssXu; Sun, 30 Oct 2022 20:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB74781260;
	Sun, 30 Oct 2022 20:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB74781260
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7755E1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D9F60803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D9F60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnGvBT7cv6zl for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:35:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DDEE60670
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DDEE60670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:35:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A96131BF206;
 Sun, 30 Oct 2022 20:35:48 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:35:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030213547.2ddf9fc7@windsurf>
In-Reply-To: <20221014200918.2816609-1-james.hilliard1@gmail.com>
References: <20221014200918.2816609-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667162149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYdlBOgA0VKS7YLYdQwBYmVi8FJSEC90IrDcMylc6FE=;
 b=OZ05H3MKvkHGqhc35dlgXKO0RURhJt3Y9sxw82nb2ERDmvpPy7cGG1rmknYjd/hHW/fDuD
 wl3vzjKea9mctcfwaMZNKj+ePYBrscfNB42GrMunnm+mokqulxztf74XBc+YMfPSA/cNNW
 Rw664f2Alkx2NuNuLkhrHCk7jWp5GXwIg7/71gJoxNyJw3K7EvbT7roAhaXGnbBjuHTC1z
 GQeYE3yYw8+O+zHcN1J1CspUev/nCVb83M8Ng38A22Vl5yDynQhyPevJ+NfptS++ICdCp+
 1innD4bewGEOiDnN0YNhXoG2Km/N/k6W7blK7yPm0pzz1GL59U1OYV26y6lt1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OZ05H3MK
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8192eu: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Oct 2022 14:09:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - update to latest 5.11.2.1 version fixing issues on latest kernel
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/rtl8192eu/Config.in      | 13 +++++++++++++
>  package/rtl8192eu/rtl8192eu.hash |  2 ++
>  package/rtl8192eu/rtl8192eu.mk   | 23 +++++++++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100644 package/rtl8192eu/Config.in
>  create mode 100644 package/rtl8192eu/rtl8192eu.hash
>  create mode 100644 package/rtl8192eu/rtl8192eu.mk

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
