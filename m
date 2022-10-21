Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5116CC43217
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 07:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1BF60E43;
	Fri, 21 Oct 2022 07:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1BF60E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sn52aC9pdeW8; Fri, 21 Oct 2022 07:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C117B60E34;
	Fri, 21 Oct 2022 07:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C117B60E34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB6A91BF951
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 07:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714C8842CE
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 07:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714C8842CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDi8Zz7tpfLh for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 07:44:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB5A842C5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB5A842C5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 07:44:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 01CF040005;
 Fri, 21 Oct 2022 07:44:19 +0000 (UTC)
Date: Fri, 21 Oct 2022 09:44:18 +0200
To: Oguz Ozhan <oguz.ozhan@mind.be>
Message-ID: <20221021094418.2f6ecae1@windsurf>
In-Reply-To: <20221019215741.2854410-1-oguz.ozhan@mind.be>
References: <20221019215741.2854410-1-oguz.ozhan@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666338261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yDsOLdNv8g+sC0gJexoGHR0r9veaXu2RE4hJHvy5kM=;
 b=d/+U+DSA0g/QZPe/CUPlPb/m6RWrlKnZ23BIEC9siyCK3OKogZa5YtX96ICw7jwWePca1V
 KyeGnxfU522V/mEdCKHVJRSuWf1Dsdbk7N4zmj+8gjcaWqVK/wcH75+PfBiaiLsipNuu4B
 JP5JFCkkYAmFCDeuFmR/KCdSbEUQ8orCm0/8ZcQdGonkIa1mI9RWBIO80R+iIbIQA+PUSF
 mlT0hfmyyOx9ALJA1Hfj2EflID1mtt7FFIr1+Mr7DvZJLBTcRR7AamF6kThIgYreGEqHBt
 Hts0h8H6mVcpb2iVxe2NlClShcLS8hHmLJ1AUgT/Go4BBmkHGAD6xKvLNv0QvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d/+U+DSA
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with
 pytest - Dockerfile
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

Hello Oguz,

On Wed, 19 Oct 2022 23:57:39 +0200
Oguz Ozhan <oguz.ozhan@mind.be> wrote:

> Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>

Thanks a lot for your patch series. However, all commit logs are empty.
What is the rationale/motivation for the changes in this patch series?
Why is pytest better than nose2? Could you send a new iteration with a
detailed commit log for each commit that explains the motivation for
the change, and also describes the change itself, especially in PATCH
2/3, where test cases see changes. BTW, these changes in test cases
could be done in a separate preparation commit, as they would still
work with nose2 I believe.

Also another concern is that the series is not really bisectable, but
admittedly I'm not sure it's easy to achieve without doing all the
changes in one single patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
