Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0697BC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF03F833B7;
	Wed, 22 Jan 2025 15:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsMJCDpfTgWj; Wed, 22 Jan 2025 15:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67B78308B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67B78308B;
	Wed, 22 Jan 2025 15:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81962959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D89040126
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flYWe4JHboHK for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33FBF4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33FBF4013C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33FBF4013C
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:17:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E50AE0007;
 Wed, 22 Jan 2025 15:17:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tacUK-008rxq-23;
 Wed, 22 Jan 2025 16:17:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250116070420.369915-1-peter@korsgaard.com>
Date: Wed, 22 Jan 2025 16:17:52 +0100
In-Reply-To: <20250116070420.369915-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Jan 2025 08:04:20 +0100")
Message-ID: <87h65qnahr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/rsync: bump version to 3.4.1
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfix release fixing regressions in 3.4.0:
 > - fixed handling of -H flag with conflict in internal flag values
 > - fixed a use after free in logging of failed rename
 > - fixed build on systems without openat()
 > - removed dependency on alloca() in bundled popt

 > For more details, see:
 > https://download.samba.org/pub/rsync/NEWS#3.4.1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
