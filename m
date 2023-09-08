Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB2EE57EC
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07DC61078;
	Fri,  8 Sep 2023 10:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E07DC61078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qm_Bg09IAmb1; Fri,  8 Sep 2023 10:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351FF6106C;
	Fri,  8 Sep 2023 10:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 351FF6106C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0BE11BF3E8
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7973D41C48
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7973D41C48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DX1tVQsqRECh for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 10:00:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E860041C01
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 10:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E860041C01
Received: by mail.gandi.net (Postfix) with ESMTPSA id 194D420013;
 Fri,  8 Sep 2023 10:00:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qeYHz-008W8I-5D; Fri, 08 Sep 2023 12:00:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeSuybuLKr2oHeABvQOwdtcratHm11UrwK76HxA6TBRPnHA@mail.gmail.com>
Date: Fri, 08 Sep 2023 12:00:35 +0200
In-Reply-To: <CADYjeSuybuLKr2oHeABvQOwdtcratHm11UrwK76HxA6TBRPnHA@mail.gmail.com>
 (Sourabh Hegde's message of "Thu, 7 Sep 2023 12:03:40 +0200")
Message-ID: <87tts5f0ho.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Unable to configure USB webcam in Buildroot
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sourabh" == Sourabh Hegde <hrsourabh011@gmail.com> writes:

 > Hello,
 > I am trying to configure a Logitech USB Webcam for my NXP i.MX 8M board. I
 > have enabled CONFIG_MEDIA_USB_SUPPORT=y in the linux-menuconfig.
 > But when I do "ls -l /dev/video*" I get "No such file or directory" and
 > "v4l2-ctl --list-devices" shows "Cannot open device /dev/video0, exiting.".

 > Can anyone please let me know how to enable USB webcam in Buildroot?

Not really a Buildroot question, but that webcam probably uses the UVC
(USB Video Class) interface. Ensure you have CONFIG_USB_VIDEO_CLASS
enabled in your kernel and check dmesg when you plug it in.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
