Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692BBC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3169F400F3;
	Sat, 23 Mar 2024 13:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thjoxRPVrtPy; Sat, 23 Mar 2024 13:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9C14015F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B9C14015F;
	Sat, 23 Mar 2024 13:34:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D33F1BF584
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5988E4149D
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvwjRF9Yk2Us for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C646409F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C646409F7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C646409F7
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:34:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 436241BF203;
 Sat, 23 Mar 2024 13:34:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro1W7-006vgI-2A;
 Sat, 23 Mar 2024 14:34:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Gilles Talis <gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
Date: Sat, 23 Mar 2024 14:34:35 +0100
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com> (Gilles Talis's
 message of "Thu, 15 Feb 2024 10:24:06 -0400")
Message-ID: <87y1a9xeac.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/fdk-aac: bump to version 2.0.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 > Change log: https://github.com/mstorsjo/fdk-aac/blob/master/ChangeLog
 > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 > ---
 >  package/fdk-aac/fdk-aac.hash | 5 +----
 >  package/fdk-aac/fdk-aac.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 5 deletions(-)

 > diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
 > index b10d5f92b1..07c5561712 100644
 > --- a/package/fdk-aac/fdk-aac.hash
 > +++ b/package/fdk-aac/fdk-aac.hash
 > @@ -1,6 +1,3 @@
 > -# From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
 > -sha1  579b34e8174b4feb21a9c598695f5ff4a7ceef8c  fdk-aac-2.0.2.tar.gz
 > -md5  b41222194b31f570b3132bd622a9aef6  fdk-aac-2.0.2.tar.gz

I've kept the upstream sha1 hash and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
