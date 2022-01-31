Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B069C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C330403AE;
	Mon, 31 Jan 2022 18:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0SX2ha1_y8O; Mon, 31 Jan 2022 18:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4176D402BC;
	Mon, 31 Jan 2022 18:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 959781BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 770F782E29
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KykrUUqhK04B for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:07:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id F268882730
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 18:07:41 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Eb5XngBuJ0FuyEb5YnYMo1; Mon, 31 Jan 2022 19:07:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643652460; bh=xDNSl911o3d/J9EoZiap8d6acybpgzYrVgy0fOUgwgc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IffKCqU9Sxk//tw6hDC2QQASVjAUjx8VEzGuSVFx6JxXpNsx2KOw1SDbrYEyg8P5h
 WHIEJJHVuv/dlCXfiQ+beySQv82CUYi6Rj2GyQhN69hyF7eDSUNziSS2IfwpOaD+RA
 EDgvANMO2MLlrSTPLfkev6YqOuVJwdkoKAcctGxwujE6KDHcQ7bNQmAR/K/l/6CV28
 44j7VvnxiKDIPtf0NPwbf6Qhsf9lRDSBx+v+50IZVrCsS+rykOOrNsKRwtTVK/ydhP
 YjUlfYoJSZrhLhJy+VEPv+gPboLA+bUerUfyCz8q9buazzPcPJt1Q0WwABmk7CJpjz
 cMLm1VcfXEvXw==
Message-ID: <8f3868bc-5fe0-d016-a203-9b7ad5773136@benettiengineering.com>
Date: Mon, 31 Jan 2022 19:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <SJ0PR02MB775858FF54330E5040E95E32D7259@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB775858FF54330E5040E95E32D7259@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfGeSCebF0akY/swWmZmNnGVl03vALAAhLIsjZlTOsIp0hw7pxCF74i2PrD8T6gqoRTkS7eEBJhLnhtVEQ1pDJ2V6soNq9lVZDCrcgTm5tC5QNmh7Kajp
 ZEvWJ8GGQpGOL9GCVTG4+lq+GMLgDBjUj5mBDrKmdwEoo23kLojjqD/ZRZZZgfTpk/JQuk/p1+G0c5HRxIk2HEoxpvOEMnAkW7jV0l7Jaj9zdIIs2TVs09o1
 vLjO8ceubkrsXczz4VUGEAqGUi2EjcRh55Luj9SWGSQ=
Subject: Re: [Buildroot] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to
 Xilinx 2021.2
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

can you please re-send using:
# git send-mail --to ...

otherwise it's impossible to review your patch.

Thank you
Best regards!
-- 
Giulio Benetti
Benetti Engineering sas

On 31/01/22 18:30, Neal Frager wrote:
> Changes included with this patch:
> 1. Removing ATF and U-Boot patches which are no longer necessary since they are in mainline.
> 2. Using Xilinx github for ATF, U-Boot and Linux as there are updates which may not yet be in mainline.
> 3. Adding a zynqmp_zcu102_defconfig.
> 
> Signed-off-by: Neal Frager <nealf@xilinx.com>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
