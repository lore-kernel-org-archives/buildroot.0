Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C467E77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD17160BA8;
	Fri,  6 Dec 2024 22:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76XXIY1fuwcq; Fri,  6 Dec 2024 22:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23A3B60693
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A3B60693;
	Fri,  6 Dec 2024 22:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86905ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D61605C8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qn_lfSU_YKo for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EFF36076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EFF36076C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EFF36076C
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:27:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE5420004;
 Fri,  6 Dec 2024 22:27:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJgnQ-008lm0-0T;
 Fri, 06 Dec 2024 23:27:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20241112155359.2416899-1-dungeonlords789@naver.com>
 <ac561aa3-8c35-4561-83ae-f671334e8574@mind.be>
Date: Fri, 06 Dec 2024 23:27:36 +0100
In-Reply-To: <ac561aa3-8c35-4561-83ae-f671334e8574@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 4 Dec 2024 22:23:38
 +0100")
Message-ID: <87ed2k5twn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix help
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Cherniaev Andrei <dungeonlords789@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 12/11/2024 16:53, Cherniaev Andrei wrote:
 >> losetup -f return next free loop device and usually it is not
 >> /dev/loop0 so if you use this help you can delete all important data
 >> from your existing device.
 >> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>


 >  Applied to master, thanks.

 >  I didn't think the commit message was explicit enough, so I changed it to:

 >     boot/grub2/readme.txt: don't specify /dev/loop0

 >     losetup -f returns the next free loop device, which may not be
 >     /dev/loop0.  If you blindly follow the readmy you may end up destroying
 >     an existing device.

 >     Make it more robust with a variable to store the loop device.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
