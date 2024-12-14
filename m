Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B57E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 08:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F94410D1;
	Sat, 14 Dec 2024 08:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umWaoJ0EZK1S; Sat, 14 Dec 2024 08:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE2A410BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE2A410BD;
	Sat, 14 Dec 2024 08:58:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A6A4D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 08:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20B80401DD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 08:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sGHPYa9C0h0 for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 08:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D31E940287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D31E940287
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D31E940287
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 08:58:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E8ACFF803;
 Sat, 14 Dec 2024 08:58:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMNys-00BJm5-0J;
 Sat, 14 Dec 2024 09:58:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241117125450.543605-1-ju.o@free.fr>
Date: Sat, 14 Dec 2024 09:58:34 +0100
In-Reply-To: <20241117125450.543605-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 17 Nov 2024 13:54:49 +0100")
Message-ID: <87zfkytzd1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] package/nettle: update _SITE to
 use BR2_GNU_MIRROR
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The nettle package is distributed on the GNU project servers. See [1]
 > and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
 > be used for that purpose. See [3].

 > For consistency with all other GNU packages, this commit updates
 > the _SITE to use BR2_GNU_MIRROR.

 > Note: the nettle _SITE was updated to ftp.gnu.org in commit [4].

 > [1] https://www.lysator.liu.se/~nisse/nettle/
 > [2] https://www.gnu.org/prep/ftp.html
 > [3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/92f0ef5eaa74af28b2b7b7abbe021bce2aba4875

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
