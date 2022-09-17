Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26596ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69E98142F;
	Sat, 17 Sep 2022 16:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69E98142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBdCxtdCChGz; Sat, 17 Sep 2022 16:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8228130E;
	Sat, 17 Sep 2022 16:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED8228130E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 340241BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838136070A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838136070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hn1jomRyYnM for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:13:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51514607C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51514607C1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:13:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E48BA20004;
 Sat, 17 Sep 2022 16:13:21 +0000 (UTC)
Date: Sat, 17 Sep 2022 18:13:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220917181320.12cb4136@windsurf>
In-Reply-To: <20220907015838.262210-1-james.hilliard1@gmail.com>
References: <20220907015838.262210-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663431202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9sdhOLe6to42ak0hOP+46dR0UgS5lxBzhqzB4yo9WY=;
 b=nhMdFk7fypc3WtNKDQQXAIi/Tl4COrwdGC1TPNrRIzkuvuPzQOdBbi9X4TVBDZH62cmkFv
 IY3VX7vRA8G2B4PtXL8n+XPfwbhj8PB/MNvv58VrXR7Yu2FU51ixRdHK42GrrVzJ1D64I8
 CyEgPQp6uImo77TY4Mowmw1zyy3TO0b9eqUoT9aANa2E4Nyx+OD0Bntu/3J7KAX/MRdU4N
 tquacktCWP/vwcENu6u9BceqiM903fGTAa9VZak55KcevG3K+/6bBcvxwNOHz8R85dpD+v
 C117FC6ieMOBv+9Z0K3tpbyjkko7JbPJLIkKU4rj741lEhwU7Nrie58RyEA/yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nhMdFk7f
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.57
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

On Tue,  6 Sep 2022 19:58:38 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add support for new bluez5-codec-opus codec feature.
> 
> Disable new unsupported flatpak feature.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pipewire/pipewire.hash |  2 +-
>  package/pipewire/pipewire.mk   | 13 ++++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)

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
