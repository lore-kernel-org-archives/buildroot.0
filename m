Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D329C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2409600C6;
	Mon,  3 Jun 2024 07:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPHD2JrB3yEN; Mon,  3 Jun 2024 07:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67AC60701
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67AC60701;
	Mon,  3 Jun 2024 07:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9CC1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 764524062D
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5UuYbf9HgfO for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CFEA40600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFEA40600
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CFEA40600
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:31:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A6B0C0009;
 Mon,  3 Jun 2024 07:31:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sE2A9-002GYX-0t;
 Mon, 03 Jun 2024 09:31:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-2-peter@korsgaard.com>
 <87h6eapjxt.fsf@tarshish>
Date: Mon, 03 Jun 2024 09:31:25 +0200
In-Reply-To: <87h6eapjxt.fsf@tarshish> (Baruch Siach's message of "Mon, 03 Jun
 2024 10:25:02 +0300")
Message-ID: <87o78ijxde.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 02/23] package/ebtables/ebtables.hash: use
 http:// to match _SITE
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

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Jun 03 2024, Peter Korsgaard wrote:
 >> For consistency.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/ebtables/ebtables.hash | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
 >> index 98106b0d60..06e2f9f345 100644
 >> --- a/package/ebtables/ebtables.hash
 >> +++ b/package/ebtables/ebtables.hash
 >> @@ -1,4 +1,4 @@
 >> -# ftp://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
 >> +# http://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum

 > Maybe better

 >   https://netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum

Ups, indeed - Will fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
