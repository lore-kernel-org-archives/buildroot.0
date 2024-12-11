Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE3E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 08:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CCB40B7F;
	Wed, 11 Dec 2024 08:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSJRS5YXYBrh; Wed, 11 Dec 2024 08:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248C640B8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248C640B8F;
	Wed, 11 Dec 2024 08:11:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC2186F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94AA40B8F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iqbzxVOmAVY for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 08:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43F1940B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F1940B7F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43F1940B7F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:11:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D97BA60008;
 Wed, 11 Dec 2024 08:11:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tLHoi-000DFK-0C;
 Wed, 11 Dec 2024 09:11:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org,  Vincent Fazio <vfazio@xes-inc.com>,  Julien
 Olivain <ju.o@free.fr>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241211004940.14204-1-christian@aperture.us>
Date: Wed, 11 Dec 2024 09:11:32 +0100
In-Reply-To: <20241211004940.14204-1-christian@aperture.us> (Christian
 Stewart's message of "Tue, 10 Dec 2024 16:49:40 -0800")
Message-ID: <87frmuzljf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mmc-utils: fix hash mismatch
 for readme file
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

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21
 > The README hash changed causing a build failure:

 > https://github.com/skiffos/SkiffOS/actions/runs/12266361526/job/34224344838#step:8:60617

 > Update the hash for the README.md file to fix the issue.

 > Reproduce: make mmc-utils-legal-info

 > Signed-off-by: Christian Stewart <christian@aperture.us>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
