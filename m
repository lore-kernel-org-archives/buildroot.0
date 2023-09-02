Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282AFC71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D31E44053F;
	Sat,  2 Sep 2023 15:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D31E44053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfOWQLrMAqHh; Sat,  2 Sep 2023 15:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B1C84053C;
	Sat,  2 Sep 2023 15:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1C84053C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610E01BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 087BD60AC4
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 087BD60AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEelBrddundu for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:49:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E068E60593
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E068E60593
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A72B20004;
 Sat,  2 Sep 2023 15:49:00 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:48:59 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20230902174859.4e92c381@windsurf>
In-Reply-To: <CYYP221MB114006AE3D1C77F421E44B43A0EBA@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
References: <CYYP221MB114006AE3D1C77F421E44B43A0EBA@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693669742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGQlR3xgASDmzUbsMHdT/PQT2PsTnuZLv/6l2JkuIb0=;
 b=QGP6Llku4j1UI9uPwHNTSczJGqLayRJPiwbK2e9MzeHyF54vZkZz8rYRF6tfdXAnHKand7
 p+T0KtWktQftHtvVBfnrip29zIh/dX7z40RkhiHCSz4aheWMN0rhV7VtMD5tNnGLseFVFv
 9GRVcrVPiiT5z0sYWQ5Wla/FWIWnzr2BKQAxfMlh0GP0rNm9/5q9Oomj4lRiyjSICvtk9y
 PyVRZlyqUovBKFhFQ9385CnEql/aXKQtUobg5qRKmxChuDSk2r0uGIW+GP79Myx5NDj+O3
 msCU7VBsPhrI92KrLTz6TW+hDUmYMUlbbetco7xpvvhkiK6Q8fqNEyh1JEgZ9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QGP6Llku
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/check-package: cleanup line
 reading
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  2 Sep 2023 08:47:49 -0400
James Knight <james.d.knight@live.com> wrote:

> Cleanup the implementation for reading lines by having files processed
> in context managers and utilizing the iterable file object for line
> reading (instead of needing to call `readlines()`).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Changes v1 -> v2:
>   - This change drops the use of an `fstate` instance which should not
>     have been added in this initial/first patch (of a four-patch
>     series).  (mentioned by Thomas Petazzoni)
>   - Only this first patch is being resubmitted as this first patch can
>     be applied by itself and the remaining patches are in discussion.
> ---
>  utils/check-package | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

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
