Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6652BC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DCD360BFE;
	Mon,  7 Nov 2022 22:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DCD360BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLd_wjnCAIhO; Mon,  7 Nov 2022 22:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E9E60BF5;
	Mon,  7 Nov 2022 22:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E9E60BF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17CB01BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9CA981A30
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9CA981A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHBSK-Ufvan1 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:18:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7789819B8
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7789819B8
 for <buildroot@busybox.net>; Mon,  7 Nov 2022 22:18:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2C955100002;
 Mon,  7 Nov 2022 22:18:23 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:18:22 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221107231822.186b18f8@windsurf>
In-Reply-To: <20221107171044.1239145-1-francois.perrad@gadz.org>
References: <20221107171044.1239145-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p14u4/tQLAXOEiKmqFpxY4UPyqGiA5AD1H24Y6jnhOw=;
 b=otgDinjvx+jkT3n+bjaOUUNMqc2fHdHJ6l6IB5GADuL3OSphhGGTTdOEdi+XZCrJ7SJ1ve
 CmsH4Ac0V7WQSDKPqn3jg+O6rYsM33HoU+3ZyMswNPrsOt+Hwox0Hiarz8nUxKPdkBQnTB
 OdHX+C3sjShBJ8xYu8rQeROGPMYoRJybD00LuIa4rvvhXttbJe+wdat5XwFQhkNM18R+pp
 GAFx6ZDDgK49s7wq4Ber4ugVxXqgJ6kx4LFd2+nTNPvNSliH8joecKW1/jAs1BS2qM7CcL
 zFxLM9Qmyx9z3N+eXi/ae7d9L7QPKBtUsZ9vr8XX5OBcGxw8oHuoKXjJ890v6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=otgDinjv
Subject: Re: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 18:10:44 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-cffi/lua-cffi.hash | 2 +-
>  package/lua-cffi/lua-cffi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
