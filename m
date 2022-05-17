Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ED3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 04:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0928840883;
	Tue, 17 May 2022 04:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_1s3aimG_Vq; Tue, 17 May 2022 04:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2AE04086C;
	Tue, 17 May 2022 04:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE1A1BF2A3
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D91E4086C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JH5v54DPddE6 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 04:36:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E9B4086A
 for <buildroot@buildroot.org>; Tue, 17 May 2022 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1652762186;
 bh=E/Lwighvi7/ea9YI5xrvJ3RS0QJbcb/brKurF0QiaRU=;
 h=Date:From:To:Subject;
 b=xS15khzKwOu12atsGd6Jzmd5zCvwnsbXh8c2m0UoQMznaEnXy6hyNxVN1CKIbVAyR
 FhODOp6VtkKKBbOCCdESGwPkncaCeoSHqpx02BIYWlCUx4JYZOiK3tMCmYPmOAQp6W
 2yvYIi8y/J/evBGVmqvnAA2/EoxsQ7vQLBiyW2gI=
Received: from localhost ([182.96.127.187])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 545344B5; Tue, 17 May 2022 12:21:05 +0800
X-QQ-mid: xmsmtpt1652761265tjqw4ycrf
Message-ID: <tencent_C71D728A2A59D78679AFBD91305772E8CF09@qq.com>
X-QQ-XMAILINFO: NCdkvINN4D6IjREGLu9NBTJArRovHClllQRBC9mIf2lIbOi0TGsoshC7kweXBj
 GTYh8lKsCaPYql/kIHHMsCNOLtEXICbi/wa+E4HwB2jxId/XCaJuINoDPMJkH1o/CZZQrvX0gacx
 cD4PourZpB3xBAwf0OQOoh3QX71HtLo06kqknwIzqF5vqEYShxSTP7kW188lbCg29SuBwgM2P3Dw
 /hyQFOtN9hOTqu/76n0tOocDz/A/h9XxGuBfepe919M0IgTe1GLa/GM7ZxhYHcCfrSiMMeQo/qLP
 54q0BhFgHZdCeXeNtT+TY8Q86XYJqKbN4Cr56nQwzV9OH6JN4MBDj//fLwt5NNTSuywsZHTDibuS
 KGOOBUo36wEEioYPqtOeZQA3N1LV6FLbne30Wqvt/RhswUDczWFXdRJniwxiAN0bKBrQx0LZ24T3
 JO2xIlMZhSVygqcalKpTJnDEUtZSvHKyAI78GILkzJTLZep65ILbWUJsv0bDZrW23WF+nwwXOjT7
 YlIDNHoa1WX1lkoFgOsxzisuCUbuuT0ogaQLKgNsLMweEfgP1l3Qwclawsk0hP5n+Nww1UuMCnSr
 zmbxDmSbnlcYUDepYkUpfe8PSitbwnZDGpMcCvkFT7rxsRCy0BmDI3Pksk6ToOLpUg5ujgNO3ffT
 c2dREzdE3OKb2iGMbIS1Jrbp7gV0XutI1hFvwbrQ6AHVPp0xKCbPM0FnxaZVyzSant1cvnjeLSf7
 sVNMK3sZUAGujESdb2glQ0GAfTSRxDCghSCrhNZlKzDQRIcggdyyEdlX+0zyhp6KnyVU42yk6cVm
 AQHc4QYTBvJ9nzo7rgcgHw7PsfNr4uszVIbgxI8glZan8/ozCzFh/hXHKP1kr2rBE=
Date: Tue, 17 May 2022 12:21:05 +0800
From: c4droid <c4droid@foxmail.com>
To: buildroot@buildroot.org
X-OQ-MSGID: <YoMisY3tjisZrteH@Workstation>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] Stuck at dhcpcd initialized in wifi when system booting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, I'm building a custom system for my raspberrypi 3b, after configuration and compiling, flash images, I boot up system, the kernel stucked at initialize dhcpcd, also I notice some component uninitialized urandom seed. Have some solution for this?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
