Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE6D743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4BC605E1;
	Wed, 20 Nov 2024 21:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-s6ML-NNNRB; Wed, 20 Nov 2024 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1FE160646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FE160646;
	Wed, 20 Nov 2024 21:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FDDE970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D562413C6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko3HVRsm2Qrf for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F5F2403AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5F2403AA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F5F2403AA
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:01:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1117D1BF207;
 Wed, 20 Nov 2024 21:01:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDrpF-001FaK-0c;
 Wed, 20 Nov 2024 22:01:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20241031110441.2953443-1-dungeonlords789@naver.com>
 <20241031184531.39b21c15@windsurf>
Date: Wed, 20 Nov 2024 22:01:25 +0100
In-Reply-To: <20241031184531.39b21c15@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 31 Oct 2024 18:45:31 +0100")
Message-ID: <87cyiptyai.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/pc: fix grub root device in help
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello,
 > On Thu, 31 Oct 2024 20:04:41 +0900
 > Cherniaev Andrei <dungeonlords789@naver.com> wrote:

 >> Also make docs more user-friendly
 >> 
 >> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

 > Thanks for your contribution, I have applied the part of your patch
 > fixing root=/dev/sda1 and root=/dev/vda1. The rest wasn't relevant, as
 > it's considered general Buildroot knowledge. We're not going to repeat
 > in each and every configuration file which package to rebuild to get
 > things taken into account.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
