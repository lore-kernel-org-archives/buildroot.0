Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B67C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20840614CF;
	Fri, 25 Aug 2023 17:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20840614CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9O4kuV5blMU; Fri, 25 Aug 2023 17:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766FB614A2;
	Fri, 25 Aug 2023 17:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766FB614A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2ED31BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CAE283CBD
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAE283CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7Fb3jhQPUTg for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:11:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C12283CBB
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C12283CBB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D56940004;
 Fri, 25 Aug 2023 17:11:38 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:11:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230825191136.039830c8@windsurf>
In-Reply-To: <20230825163335.403433-1-bernd@kuhls.net>
References: <20230825163335.403433-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXxOJLb83kw33TEggefZm48RsFm4CKDlFNLVek60+98=;
 b=OSGkFfpDDWnA4HZhwrajFUbPbRkc9HRFpF4sZJ7qub60oiIBXEeDE5SUMBXRSJwDujWJKq
 sQYQmpbB8EOQHKOFlVLQElfrvaqvnQszX3IIah9ZuJECln7MTB5xPVX1My+ou5skFljNFp
 TGbA0C2jNj0k9FoY5plXHo3F3DLjPDyhynXJhxMSZFOLwxxxR5q30CXkmZHjL4BVj+M74k
 hLX8MWIyDufItYN7e0eCfd+3QbZCRIQImAXTRxk9wNU7Fnhh/PMKbrWQCcBcD5H1mX02mT
 N9y/AcOeW8WR3cLOqGS0GPzd5PwEYtsUR5Ko7OriHvOE6DcquPdTqx6RMcmBRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OSGkFfpD
Subject: Re: [Buildroot] [PATCH/next 1/1] package/ytree: bump version to 2.05
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

On Fri, 25 Aug 2023 18:33:35 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://www.han.de/~werner/ytree.html
> 
> Removed patch which was applied upstream in a slightly changed way.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore               |  1 -
>  package/ytree/0001-fix-musl.patch | 26 --------------------------
>  package/ytree/ytree.hash          |  2 +-
>  package/ytree/ytree.mk            |  2 +-
>  4 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 package/ytree/0001-fix-musl.patch

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
