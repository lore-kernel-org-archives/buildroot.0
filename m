Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1DFE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC1741868;
	Fri, 13 Dec 2024 22:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeN4xSQFM9FD; Fri, 13 Dec 2024 22:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD434186B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD434186B;
	Fri, 13 Dec 2024 22:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9279ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D5160B4B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e36RvAq5CY8 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B937360648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B937360648
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B937360648
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:39:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E07E40003;
 Fri, 13 Dec 2024 22:39:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMEJz-00Aiab-2z;
 Fri, 13 Dec 2024 23:39:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241117131342.551472-1-ju.o@free.fr>
Date: Fri, 13 Dec 2024 23:39:43 +0100
In-Reply-To: <20241117131342.551472-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 17 Nov 2024 14:13:42 +0100")
Message-ID: <87ldwjus0g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] boot/grub2: update _SITE to use
 BR2_GNU_MIRROR
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

 > The grub2 package is distributed on the GNU project servers. See [1]
 > and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
 > be used for that purpose. See [3].

 > For consistency with all other GNU packages, this commit updates
 > the _SITE to use BR2_GNU_MIRROR.

 > Note: Commit [4] introduced the grub2 package using BR2_GNU_MIRROR.
 > Commit [5] changed it to use "http://ftp.gnu.org/gnu/grub" without
 > providing a justification for that change.

 > [1] https://www.gnu.org/software/grub/grub-download.html
 > [2] https://www.gnu.org/prep/ftp.html
 > [3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/c24fdb3680019d18f0cb7c02a90975ee9fe9613c
 > [5] https://gitlab.com/buildroot.org/buildroot/-/commit/5ffafd2353f5d67dc74c7f3784dfe48d4080435e

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
