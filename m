Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E4C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB01941850;
	Wed, 30 Aug 2023 21:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB01941850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJPnhQDtm55z; Wed, 30 Aug 2023 21:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC1141815;
	Wed, 30 Aug 2023 21:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC1141815
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA211BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0521881377
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0521881377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wDJnJPs2lR5 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:58:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 744068136C
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 744068136C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C53E0002;
 Wed, 30 Aug 2023 21:58:40 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:58:39 +0200
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20230830235839.67c0bdd0@windsurf>
In-Reply-To: <20230829220734.414550-1-bobrofon@gmail.com>
References: <20230829233133.29a69227@windsurf>
 <20230829220734.414550-1-bobrofon@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EdsxJIGgdclovLDK7wRmBZ/0Qv6VJzsOBZ1dfAhb8g=;
 b=fkc3W/VG8QN2h4BJCme7Px8bxrQfT+ohOoBpde4ebG7MLdbYcMUbHfM54a/cUbi+C7Ro52
 W2gfx4yMiQ2d0vsMLQtc5S7yzPqEBLvEfbGl1dCVWYFFCKRRLCrR9nqB5ON+dAYfahEO7n
 ZYGJdlZ7p/7UiXI9cCYH/mtannjG6MFXipLYKGG2yhKJli68j6MJ5XAy0U/4xD3M+xLMrQ
 IxBK+EOSFyIH1zh2RLaF4NzCOcuPYIEf0kwJbhRSWh8AzTxZXMw8u+UfwQ7eSUs607mIX6
 4iL30o8d3sijWtZ73ArlVqnWYWCztS95iKdOxz6w3G8rV2aYqtW3QzwAdEVJrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fkc3W/VG
Subject: Re: [Buildroot] [PATCH v2] package/sdbus-cpp: bump to version 1.3.0
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

On Wed, 30 Aug 2023 01:07:34 +0300
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.3.0
> 
> A trailing whitespace was removed in the COPYING-LGPL-Exception file,
> so the hash differs.
> https://github.com/Kistler-Group/sdbus-cpp/commit/dcd9d46b9c5e5011dc7170e9d081bcf80096fd15
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - updated COPYING-LGPL-Exception hash

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
