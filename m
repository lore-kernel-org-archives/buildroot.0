Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C3BC4829E
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 13:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C17442D24;
	Thu,  8 Feb 2024 13:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyhJrm7nD_iI; Thu,  8 Feb 2024 13:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EE142D33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EE142D33;
	Thu,  8 Feb 2024 13:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 261D41BF3D9
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1382D61680
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmP-g50lG6K9 for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 13:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A95461676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A95461676
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A95461676
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 13:51:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B6371C0006;
 Thu,  8 Feb 2024 13:51:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rY4oO-0030pK-1V;
 Thu, 08 Feb 2024 14:51:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
References: <20240208130838.196406-1-buildroot@bubu1.eu>
 <83bcb5ed-83bb-4680-9fbb-34e3d155cd21@bubu1.eu>
Date: Thu, 08 Feb 2024 14:51:32 +0100
In-Reply-To: <83bcb5ed-83bb-4680-9fbb-34e3d155cd21@bubu1.eu> (Marcus
 Hoffmann's message of "Thu, 8 Feb 2024 14:13:42 +0100")
Message-ID: <87cyt7ysgr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.0.2
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann <buildroot@bubu1.eu> writes:

 > Hi Peter,
 > On 08.02.24 14:08, Marcus Hoffmann via buildroot wrote:
 >> Minor 5.0 bugfix release [1] fixing one "moderate" severity CVE.
 >> Fixes: CVE-2024-24680
 >> [1]
 >> https://docs.djangoproject.com/en/5.0/releases/5.0.2/#django-5-0-2-release-notes

 > Buildroot stable releases should probably be updated to 4.2.10:
 > https://www.djangoproject.com/weblog/2024/feb/06/security-releases/

Yes, care to send a patch?

2023.02.x is using 4.1.13, but it looks like the 4.1.x series is EOL, so
I'll also update that to 4.2.10.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
