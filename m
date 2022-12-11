Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE5AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7C9813DF;
	Sun, 11 Dec 2022 16:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7C9813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxqUwlgipzOk; Sun, 11 Dec 2022 16:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BD1F813B3;
	Sun, 11 Dec 2022 16:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD1F813B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5EF71BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA43813B3
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA43813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCU2E98waczQ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:50:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A9D81397
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A9D81397
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:50:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0701560002;
 Sun, 11 Dec 2022 16:50:14 +0000 (UTC)
Date: Sun, 11 Dec 2022 17:50:14 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221211175014.445e135f@windsurf>
In-Reply-To: <20221206155226.54290-1-neal.frager@amd.com>
References: <20221206155226.54290-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670777415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXdXiluDamrbkcuQuPpSTrPRUCWp5to7tjos9bObpm0=;
 b=Z8z1onn8wGqGusgWv/JVJvjmB7aFXieKx8icHGybIyozwkT1fnAsDFSJ54BL68bhVl443N
 MMHn0I7Y3OmG3Fp3HnAKxNJB6tqq1MGg0kZHZc5ae3shhpjjc/FhsPULXh/wWN5VKa6y45
 98hJmydBuSU7ENbmInfdIow3L21PvYTAwMEBAYZA3mV2y+3W8V/ZjA5I7A8XDYKQVCljTh
 ofZPzqHpIqfUqBchCJ9mooDqtPW7GcaBvlcpyo1+i9kIBL5QeC5f/dCG8tXKCAz5n7zGka
 m3XZfA/HIY6Qpyr6eFvFb9Kd4mdy+TDmzdxl7xz/p+89uHM/van29KgAGbNiPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z8z1onn8
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: move to board/zynqmp/kria
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 6 Dec 2022 08:52:26 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch moves the board/zynqmp/kria/kv260/uboot.fragment file
> to the board/zynqmp/kria directory.  The reason is that this file
> is the same for any kria starter kit and is not specific to the kv260.
> By moving the file, it can be logically re-used with the kr260 when
> support for this starter kit is added to buildroot.
> 
> KR260 Starter Kit:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/{kv260 => }/uboot.fragment | 0
>  configs/zynqmp_kria_kv260_defconfig          | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename board/zynqmp/kria/{kv260 => }/uboot.fragment (100%)

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
