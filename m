Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A17FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80C44172F;
	Mon,  6 Nov 2023 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80C44172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPvWcrszTkW1; Mon,  6 Nov 2023 21:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E57941E99;
	Mon,  6 Nov 2023 21:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E57941E99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429E21BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B26882085
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B26882085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wrOY2cwAVTm for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:27:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CF4C81FA9
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF4C81FA9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82C9140004;
 Mon,  6 Nov 2023 21:27:36 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:27:35 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106222735.07bc2a4d@windsurf>
In-Reply-To: <20231105092828.458265-1-fontaine.fabrice@gmail.com>
References: <20231105092828.458265-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAsp4ATXGPtrdR67CrCQCoflg1bMWF1Ea5oTt6/AyV8=;
 b=gQAUp0TKkBVvqUFXKoauJwzxlpWjrwawksL8Ma+CpR4ficNnLi0RTxMusgB8YBOCkPRaFL
 9zJTAiyTiLBUYGvXHXwxX6MDk0BEbG96KiKq1n1Iu9O1pIA9dLwiOFzHDmiArdraU97PY8
 B06m/0dwrzMXffuhEoJIi89fWX9SFqEAfPkFAW+CjnqZVfSKz/VSC4cTVZrGgPhUdWRjOQ
 2fkqAAKJhYPByr3T7bRzS9QRd0fAIDJm86y56UYbXF40mlPTAnyOpIvXEip9UXIVh5KLA9
 GsWhK9d+O/deQABxo6c+zYolWRcPZDhXaMoASzjD8vc1HySoCm51PE/Gr/wD0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQAUp0TK
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix libftdi build
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

On Sun,  5 Nov 2023 10:28:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> flashrom depends on libftdi1 since bump to version 1.3.0 in commit
> 073b0fc9c1fe9945eccf4b792b948633aae9a9b8:
> 
> Dependency libftdi1 found: no
> [...]
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips64el-buildroot-linux-gnu/12.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: libflashrom.a(ft2232_spi.o): in function `send_buf':
> ft2232_spi.c:(.text+0x20): undefined reference to `ftdi_write_data'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/11fae0933b38d82f15fec37e78298df232321bcd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
