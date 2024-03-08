Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C3C54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A0EA41C7F;
	Fri,  8 Mar 2024 11:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UakShfMfU1sm; Fri,  8 Mar 2024 11:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9913641CA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9913641CA2;
	Fri,  8 Mar 2024 11:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9550C1BF317
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8177841D85
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fH62NaD4y82w for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:27:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C722441C6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C722441C6A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C722441C6A
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:27:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 657B72000A;
 Fri,  8 Mar 2024 11:27:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riYO0-004Dq3-11;
 Fri, 08 Mar 2024 12:27:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Reza Arbab <arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-3-arbab@linux.ibm.com>
Date: Fri, 08 Mar 2024 12:27:36 +0100
In-Reply-To: <20240207175135.1532037-3-arbab@linux.ibm.com> (Reza Arbab's
 message of "Wed, 7 Feb 2024 11:51:32 -0600")
Message-ID: <878r2tvu8n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v5 2/5] package/petitboot: prefer UTF-8
 support
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
Cc: Laurent Vivier <laurent@vivier.eu>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Reza" == Reza Arbab <arbab@linux.ibm.com> writes:

 > The petitboot UI looks much nicer in a Unicode locale:
 > * Items in the language selection submenu use multibyte Unicode
 >   characters. In other locales, they say "Unable to display text in this
 >   locale".

 > * The combination of TERM=linux with a UTF-8 locale is required to
 >   trigger a special-case workaround in ncurses code[1]. Without
 >   this, line-drawing characters in the menu look like q's.

 > Turn on wchar support in ncurses, and add a reminder that a UTF-8 locale
 > should be generated for things to look right.

 > [1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing

 > Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
