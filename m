Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A03C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0734D60612;
	Tue,  6 Aug 2024 22:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9GYH2il1xAU; Tue,  6 Aug 2024 22:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D30560625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D30560625;
	Tue,  6 Aug 2024 22:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7CAF1BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A1B401FC
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm2C-0Q2xvwN for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5923F401DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5923F401DE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5923F401DE
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:15:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80FDBE0002;
 Tue,  6 Aug 2024 22:15:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbST2-0004mA-31;
 Wed, 07 Aug 2024 00:15:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240517082007.312904-1-huth@tuxfamily.org>
 <20240712171610.1a5a85cf@windsurf>
Date: Wed, 07 Aug 2024 00:15:44 +0200
In-Reply-To: <20240712171610.1a5a85cf@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 12 Jul 2024 17:16:10 +0200")
Message-ID: <875xsdqovj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/frotz: fix build with gcc 14
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 17 May 2024 10:20:07 +0200
 > Thomas Huth <huth@tuxfamily.org> wrote:

 >> Change -std=c99 into -std=gnu99 in the CFLAGS to avoid the following
 >> build failure with gcc 14:
 >> 
 >> fastmem.c: In function 'z_restore':
 >> fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
 >> 842 |                 f_setup.aux_name = strdup(default_name);
 >> |                                    ^~~~~~
 >> |                                    strcmp
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/df3b3b98265ec3a75578614746b2d1426c90e125
 >> 
 >> Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
 >> ---
 >> v2: Use gnu99 instead of removing c99

 > Applied to master, thanks.

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
