Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67E5C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DD78126D;
	Sun, 30 Oct 2022 20:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50DD78126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tnUhPPHJhTG; Sun, 30 Oct 2022 20:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872D18125F;
	Sun, 30 Oct 2022 20:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872D18125F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B69D1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23EA9400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23EA9400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnPYUr4rBv3u for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69DEA400DC
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69DEA400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:40:01 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pF66o3r4GRaNUpF66owVq5; Sun, 30 Oct 2022 21:39:59 +0100
Message-ID: <f5d61026-47df-ab4e-0423-58b37a25eb8a@benettiengineering.com>
Date: Sun, 30 Oct 2022 21:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
 <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
 <20221030210421.6c2777b2@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221030210421.6c2777b2@windsurf>
X-CMAE-Envelope: MS4xfBpGXAD7y73MTFLH0c2qiN01CblPpXa5g2mNOtOf7q72m4fDDkJLaEGDqQ4kS4mv+PgIrYtVti3hRj4kEr9+hpZMrZYSUQWm3Z6bzfRDEozQiIHVFP42
 Etrpvv5oPZAMSWi0JodqyKLdcdHkvXk1FbmnkC58+UHEVkqDdLIWIodik8mFIz92+YIxRsvrDPQO2pEbNtZRmaNLxRSyOn8oVke8zU0oubVi8HBIHqNa8Cq+
 FEtE+s4YoqcuzhToS+DxLu3AcC9ikXavGf0zNAbs57adSe6BuYrqfPMXsoKISV5K2Lzu436tVfwd8N5Qyl1EPQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1667162399; bh=YXTp85ox3Rjt5B6LNk4dKRL7qtnNIxVjM8AnAllZCMs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ahnA2xf1r9txjf87CHqrU8i/JChQhJngDauqcECYyq8DOTnySUo0tzHIyrwCUlaZ9
 g4UV1G8PhLfuRUFtIroYhPokAReOJ2jiH74q+cFraAPZh9Gu7E8g7q3SAihSCRiBLe
 9iIdW3De5KHQv61XsJ2R/ZnMC+Axa2iqrWNJ4a4vfwRsco2vPkOH61c2iiUqgvBNPH
 2tjl+aRBVMUkNJpeIabWNBnyu78TQI8UxniKgIdwbtTHWtMZvNR/q5T3gtSdmMvIT3
 CWd7Etb89Nt1F9LV5sh/Bm2ijFm6NAGFkjkI/L42zfVCIXOtoYWVdX78lOd2VqlR9T
 uNgxhxDWkgWFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ahnA2xf1
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to
 rtl8188eu package
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/10/22 21:04, Thomas Petazzoni via buildroot wrote:
> On Mon, 17 Oct 2022 22:18:04 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   DEVELOPERS | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Applied to master, thanks.
> 
> However, please *always* resend complete patch series. For PATCH 1/2,
> you had sent a v2, and then a v3, and for this PATCH 2/2, only a v1 was
> there. This is *extremely* confusing for the maintainers.
> 
> So when you need to send a new version of one patch in a patch series,
> please *always* resend the complete patch series, and mark the entire
> previous patch series as Superseded.

Pardon Thomas, I've lost track of the DEVELOPERS patch while focusing on
the 1/2 patch. I'll pay more attention.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
