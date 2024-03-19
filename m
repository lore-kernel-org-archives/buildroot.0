Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFB0C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 11:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135B281E20;
	Tue, 19 Mar 2024 11:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xC-itK7RwfKt; Tue, 19 Mar 2024 11:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E9E81E22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E9E81E22;
	Tue, 19 Mar 2024 11:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B70A1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6779081E22
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 11:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyPVT7GBGntg for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 11:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3467381E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3467381E20
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3467381E20
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 11:20:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFD8F40004;
 Tue, 19 Mar 2024 11:20:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmXWL-0039IU-0L;
 Tue, 19 Mar 2024 12:20:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240302092733.24288-1-fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2024 12:20:41 +0100
In-Reply-To: <20240302092733.24288-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Mar 2024 10:27:32 +0100")
Message-ID: <87edc6cvsm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,1/1] package/parted: needs gcc >= 5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump to version 3.5 in
 > commit 57817fe05a4250a260a08201812c6652b306a0e5 and
 > https://git.savannah.gnu.org/cgit/parted.git/commit/?id=15c49ec04f7eaff014d2e1eddd0aecf4150db63d:

 > gpt.c:181:5: error: initializer element is not constant
 >      { PED_PARTITION_APPLE_TV_RECOVERY,  PARTITION_APPLE_TV_RECOVERY_GUID },
 >      ^
 > gpt.c:181:5: error: (near initialization for 'flag_uuid_mapping[0].type_uuid')

 > Fixes: 57817fe05a4250a260a08201812c6652b306a0e5
 >  - http://autobuild.buildroot.org/results/1f0af75ec55da9052fbfb195a0699f84619eac81
 >  - http://autobuild.buildroot.org/results/438b5f40e8b393801f36c691d239e298998cb9d2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix typo "| |" -> "||"

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
