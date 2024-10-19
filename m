Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6770CD3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFF280C25;
	Sat, 19 Oct 2024 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jrY1jZmlIZq; Sat, 19 Oct 2024 20:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4EE80C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4EE80C28;
	Sat, 19 Oct 2024 20:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C90133A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B765280C2A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWgZj_QaDJAn for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:13:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B849080C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B849080C25
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B849080C25
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:13:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B641C0002;
 Sat, 19 Oct 2024 20:13:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2Fpf-00Bk73-2y;
 Sat, 19 Oct 2024 22:13:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
References: <20241006114424.1649959-1-ju.o@free.fr>
 <874j5pm04b.fsf@dell.be.48ers.dk>
Date: Sat, 19 Oct 2024 22:13:51 +0200
In-Reply-To: <874j5pm04b.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 06 Oct 2024 22:45:24 +0200")
Message-ID: <878qujc0lc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to
 version 2.0.19
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
 >> For change log, see:
 >> https://github.com/eclipse/mosquitto/blob/v2.0.19/ChangeLog.txt

 >> The change log mention 2 security related fixes.
 >> There is no allocated CVE.

 >> Signed-off-by: Julien Olivain <ju.o@free.fr>
 >> ---
 >> Patch tested in:
 >> https://gitlab.com/jolivain/buildroot/-/jobs/8004216030

 > Committed, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
