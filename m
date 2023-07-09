Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA927EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E6960644;
	Sun,  9 Jul 2023 16:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E6960644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtXf9TjsSPxc; Sun,  9 Jul 2023 16:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBDE160D9D;
	Sun,  9 Jul 2023 16:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBDE160D9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB8D51BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85EF4409A7
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85EF4409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Y6b0lZxGSs2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:29:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E54B1409A5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E54B1409A5
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:29:46 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F0CE1BF205;
 Sun,  9 Jul 2023 16:29:43 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:29:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709182942.2ef996fd@windsurf>
In-Reply-To: <20230709095058.1547133-2-bernd@kuhls.net>
References: <20230709095058.1547133-1-bernd@kuhls.net>
 <20230709095058.1547133-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688920184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6//M43TIRAXzPIxjToXa9lkIY1jlpm89aJNfrFEAkE=;
 b=GFZVfTWrZdj1Xip83AE/ocywq0ZaEJog6CcJrmrLrnhxLxZmZpJFkxBZfW6QdM9uLo11Mz
 9GDAxFYY6rqD8qp3rUEZvqMYuHnjoLeM2eny3UibhVemOKx1N2ddqkIpxf2G7leceEr3oP
 oauZqDlBrgfX7DY/G4Brxyb3UPeENDZzaIDQVAciZRI/CfRPYDl8F6qcTnNlE/L4+Bvyee
 xCmzDohr86BQYfYn05MdAedTmspnJbS0a91sKfNsxH7KkBG0cCFm/tdf5GeXziEw/AxsHc
 drKIdSTb9XzWjnslV4vDc+R9gmO3dxQzk5sI5yHLSxGmH/e8p9NXkVvrtPB9/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GFZVfTWr
Subject: Re: [Buildroot] [PATCH 2/2] package/fwts: bump version to 23.07.00
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

On Sun,  9 Jul 2023 11:50:58 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes
> 
> Updated license hash due to copyright year bump and formatting changes:
> https://git.launchpad.net/fwts/commit/debian/copyright?id=64d2ea181d887d877104cd08defbd3427015070a
> https://git.launchpad.net/fwts/commit/debian/copyright?id=88edd4da5885e182a339c57c4d70768f6fab695b
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fwts/fwts.hash | 4 ++--
>  package/fwts/fwts.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
