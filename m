Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39A9C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FFAD818E8;
	Tue, 13 Feb 2024 18:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-t_au1-yVYp; Tue, 13 Feb 2024 18:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9348190B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9348190B;
	Tue, 13 Feb 2024 18:30:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341F61BF2C3
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11617818E8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQb7P_LWs2ah for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=81.28.224.24;
 helo=relay3.mail.vrmd.de; envelope-from=mail@sebastianbauer.info;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B91678190B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91678190B
Received: from relay3.mail.vrmd.de (relay3.mail.vrmd.de [81.28.224.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B91678190B
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:30:49 +0000 (UTC)
Received: from [2a00:1c38:1:1:511c:e03c::] (helo=webmail.variomedia.de)
 by relay3.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rZxYM-001Q7Y-LX; Tue, 13 Feb 2024 19:30:46 +0100
MIME-Version: 1.0
Date: Tue, 13 Feb 2024 19:30:44 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240212230721.4f97dae3@windsurf>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-3-mail@sebastianbauer.info>
 <20240212230721.4f97dae3@windsurf>
Message-ID: <52d43e0922ed044d0cb15d50af7d85d5@sebastianbauer.info>
X-Sender: mail@sebastianbauer.info
X-Relay-User: mail@sebastianbauer.info
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sebastianbauer.info
Subject: Re: [Buildroot] [PATCH 3/3] packages/libcamera-apps: Fix build to
 use meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Am 2024-02-12 23:07, schrieb Thomas Petazzoni:
> On Wed, 27 Dec 2023 19:24:29 +0100
> Sebastian Bauer <mail@sebastianbauer.info> wrote:
> 
>> Upstream uses meson instead of cmake since a while.
>> 
>> Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> Thanks for your patch, and sorry for the slow feedback. Could you
> clarify why this you say "Fix build" in your commit title? Is there
> some build failure, or is this an improvement patch?

There has been a build failure, because the libcamera-apps version 
pinned at that time did not come with a CMakeLists.txt file (anymore). 
The build is not broken currently because libcamera-apps was reverted to 
1.2.1 by one previous patch. The subject is probably not correct 
anymore. But if libcamera-apps is bumped again, a switch to meson is 
mandatory.

I have tried to bump libcamera and libcamera-apps to newer versions in 
the meantime but I haven't found a combination that works yet on the Pi 
(it builds but the resulting binarys do not work as they used to work).

>> -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>> -LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>> -endif
> You're removing this chunk, but it was important. Do you have some
> evidence that it is no longer needed?

I cannot say it for sure, but given the fact that the build was broken 
for all platforms before this patch series I did not bother to 
investigate it. However, I saw the presence of the flag in the build for 
the Raspberry Pi, which may indicate that this chunk is not necessary, 
but I'm not on SPARC to test it. I also have no idea how to inject this 
flag manually using meson. But I believe that, if the problem is still 
existent, a proper fix would be at a different place, as the propagation 
of the flag works on other platforms.

Note that in the meantime also the project libcamera-apps was renamed to 
rpicam-apps suggesting that SPARC is not the original target of that 
toolset.

Bye
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
