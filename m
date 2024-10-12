Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F8DCF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 13:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D88281128;
	Sat, 12 Oct 2024 13:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLScOeqcNvDi; Sat, 12 Oct 2024 13:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D1982081
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D1982081;
	Sat, 12 Oct 2024 13:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B798D1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E4582081
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIy9ZXG0k6-d for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 13:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74D7A81128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D7A81128
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D7A81128
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 13:50:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50D4A1C0003;
 Sat, 12 Oct 2024 13:50:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szcVg-00DH5M-2A;
 Sat, 12 Oct 2024 15:50:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20240916050231.85966-1-troglobit@gmail.com>
Date: Sat, 12 Oct 2024 15:50:20 +0200
In-Reply-To: <20240916050231.85966-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Mon, 16 Sep 2024 07:02:31 +0200")
Message-ID: <87msj9fn1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.6.2
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

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > From https://github.com/troglobit/sysklogd/releases/tag/v2.6.2:
 >  - syslog.conf: misplaced continuation character in example
 >  - Add facility aliases for RFC5424 compliance: LOG_CRON2 and LOG_AUDIT,
 >    including facilitynames[] = cron2, audit.  Used by the native logger
 >    tool (and any clients linking to libsyslog)
 >  - Fix data corruption using the listen directive, introduced in 2.6.0
 >  - Fix IPv6 addresses in listen directive, introduced in 2.6.0
 >  - Fix logging to remote IPv6 address, add support for parsing
 >    [fdd5::6979:c0ff:ee87:8f92]:123 style addresses
 >  - Fix initial delay for unresolvable remote target.  When a DNS name
 >    cannot be resolved, e.g., critically at boot, syslogd blocked with
 >    default resolver timeout (5 * 2 sec)

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
