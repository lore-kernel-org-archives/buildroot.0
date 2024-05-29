Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71354C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 06:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E5A60711;
	Wed, 29 May 2024 06:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkcfukVc8VPm; Wed, 29 May 2024 06:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D697960703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D697960703;
	Wed, 29 May 2024 06:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE161D3172
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F2060703
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eefnU-CUB-M for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 06:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F97E606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F97E606FA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F97E606FA
 for <buildroot@buildroot.org>; Wed, 29 May 2024 06:30:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7652D240004;
 Wed, 29 May 2024 06:30:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sCCpl-009dbo-2R;
 Wed, 29 May 2024 08:30:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Geoff Levand <geoff@infradead.org>, yann.morin.1998@free.fr
References: <99605672-166f-4747-9653-6f45458ddf04@infradead.org>
Date: Wed, 29 May 2024 08:30:49 +0200
In-Reply-To: <99605672-166f-4747-9653-6f45458ddf04@infradead.org> (Geoff
 Levand's message of "Wed, 29 May 2024 09:15:12 +0900")
Message-ID: <87plt5ruxy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:

 > Signed-off-by: Geoff Levand <geoff@infradead.org>
 > diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
 > index 831f6234da..367c4f6ecf 100644
 > --- a/package/flannel/flannel.hash
 > +++ b/package/flannel/flannel.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed:
 > -sha256  8406a3b2b799344197c79f96e5b39ea7b6228f0bb2cb069b5f44dce684e29b9b  flannel-0.25.1-go2.tar.gz
 > +sha256  565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954  flannel-0.25.2-go2.tar.gz

Hmm, I get a different hash here?

ERROR: while checking hashes from package/flannel/flannel.hash
ERROR: flannel-0.25.2-go2.tar.gz has wrong sha256 hash:
ERROR: expected: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954
ERROR: got     : e181a5e4233db47b0f03718ea801274c3a6024d235ead76e974f3df4f4183de1


>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 > diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
 > index aa24644764..317ad14ba3 100644
 > --- a/package/flannel/flannel.mk
 > +++ b/package/flannel/flannel.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -FLANNEL_VERSION = 0.25.1
 > +FLANNEL_VERSION = 0.25.2
 >  FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 >  FLANNEL_LICENSE = Apache-2.0

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
