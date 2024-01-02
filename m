Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F59C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77DA240B03;
	Tue,  2 Jan 2024 20:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DA240B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjHTKt0I0gYs; Tue,  2 Jan 2024 20:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D79B40ADD;
	Tue,  2 Jan 2024 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D79B40ADD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB291BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8171740A7D
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8171740A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iny_p1rulDhK for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:23:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B8A40A62
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36B8A40A62
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15F63E0004;
 Tue,  2 Jan 2024 20:23:09 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:23:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102212309.61b39b6b@windsurf>
In-Reply-To: <20240102131208.1216988-1-fontaine.fabrice@gmail.com>
References: <20240102131208.1216988-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0VjLzkGbvHFdzWJtxmv1U/M8g46JLAEUzIEvWJc7Cc=;
 b=RPv7cskL9O/myUro4Yoa8f3aKTQLvbIH+tktWzH8YrfSAS3LhVKj3sCQcG80+AzPWQuHQZ
 nTkL/PiZns3teAkL4kAVRaczJVS4yCKsp6aAyIKocL96BQcP4QxE1AdY6lqcQaK6WHhMI0
 bJonTXl5fnB1aAYyMH1FHxpq+ywOos7FrxKBUMCpYVxGWKDvxF2Xv6WEGN0KsychEv2iXE
 s53NpavBkFEkYK+u2vNBCX/FnMbL8vHovoi6uGcGZTQ+S3XyORNsbR0pFJEi5pSl8Kuze/
 53xv8GIcra6gI3eVbHWHWc17X1GU8Yi1jasPi+HgSppUXIqxmc7IKQpasSgSxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RPv7cskL
Subject: Re: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.14.0
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

On Tue,  2 Jan 2024 14:12:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/libusb/hidapi/releases/tag/hidapi-0.14.0
> https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.1
> https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.0
> https://github.com/libusb/hidapi/releases/tag/hidapi-0.12.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hidapi/hidapi.hash | 2 +-
>  package/hidapi/hidapi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
