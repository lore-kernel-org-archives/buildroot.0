Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CBCC47073
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D233F4086D;
	Tue,  2 Jan 2024 08:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D233F4086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU93ZzDU2ss0; Tue,  2 Jan 2024 08:53:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273B440743;
	Tue,  2 Jan 2024 08:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273B440743
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7622B1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D29240360
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D29240360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVnL7GhWCuKZ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 018C04020B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 018C04020B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BDD9FF803;
 Tue,  2 Jan 2024 08:52:24 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:52:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095224.58d53bda@windsurf>
In-Reply-To: <20240101220345.7259-1-fontaine.fabrice@gmail.com>
References: <20240101220345.7259-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATlQB0cQL4eWs/ippGiD4hXhybpQnTxYM/9kt9SNggU=;
 b=plPviolPB11Z+fk3TRZSfC1AHEp9XdP8G8RY42b3Km7zz2eTrHeYj3tpDotMX7WTrohsVR
 JV8wqOFPDL+Z+61T/0KjCOj2MZ+mJM9OAb1MJitsuqd/9M3tUysqZ7INcsCXMjiA6RQJh6
 GaivLrgMze9a1up/TOjw8TgBnHU3FM75WHCsfPxYRhzmbC+g9ajfDXlaiaGPVrcbUOHSg2
 2R7QGcL5WrmSy7RcHlegv6PqoN4UBVgWjg7hOaCtUovushswX4OimlgoiDNHFM6UUXUfKz
 3SV8oqdlE1rwZG3bx0HRhX6kZ73BtiLrZdoTYMN2x66M+EOzugjjjWNbAnVNdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plPviolP
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: security bump to
 version 1.3.8b
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jan 2024 23:03:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> 1.3.8b - Released 19-Dec-2023
> --------------------------------
> - Issue 1735 - Compiling ProFTPD 1.3.8a mod_sftp, mod_tls using libressl 3.7.3
>   fails.
> - Issue 1756 - Build system fails for specific module names.
> - Issue 1760 - mod_sftp is affected by "Terrapin" Prefix Truncation Attacks in
>   SSH Specification (CVE-2023-48795).

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
