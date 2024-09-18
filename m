Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26684CCD19A
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 11:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DEE60768;
	Wed, 18 Sep 2024 11:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aIWgEz-bFBD; Wed, 18 Sep 2024 11:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E61608D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E61608D0;
	Wed, 18 Sep 2024 11:12:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 936271BF29C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81A0C40185
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxZruG76Ljz3 for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 11:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 657264017F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657264017F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 657264017F
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 11:12:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23B0B1C0002;
 Wed, 18 Sep 2024 11:12:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqsba-00DBgC-0B;
 Wed, 18 Sep 2024 13:12:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <ZsRJkHnGdaJ0DBy8@waldemar-brodkorb.de>
 <20240820232425.52502981@windsurf>
Date: Wed, 18 Sep 2024 13:12:17 +0200
In-Reply-To: <20240820232425.52502981@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 20 Aug 2024 23:24:25 +0200")
Message-ID: <87y13przam.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/aumix: update AUMIX_SITE
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 20 Aug 2024 09:45:20 +0200
 > Waldemar Brodkorb <wbx@openadk.org> wrote:

 >> The old URL gives 403 forbidden.
 >> Use a working sourceforge URL.
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/c0c/c0c3945cade7a6d7a615ac23523c93b02dbb056f
 >> 
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> ---
 >> package/aumix/aumix.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Thanks for the patch! In addition to AUMIX_SITE, one also needed to fix
 > the URL in the Config.in help text, so I did that and applied to
 > master, thanks!

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
