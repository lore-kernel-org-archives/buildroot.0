Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA940C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A708232E;
	Tue,  6 Feb 2024 12:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8QK8D8HdjXM; Tue,  6 Feb 2024 12:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CF68216D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CF68216D;
	Tue,  6 Feb 2024 12:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 961EC1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60653411A2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60653411A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DB0vbI6jaOED for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0C564044A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C564044A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18ACBC0009;
 Tue,  6 Feb 2024 12:57:05 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:05 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135705.797a5c7f@windsurf>
In-Reply-To: <20240110034052.931500-1-james.hilliard1@gmail.com>
References: <20240110034052.931500-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gj37rBoCjDrLq9q17r+pZzBdOlwoUyav/czhxNyDEQI=;
 b=ae3rtGG+BjH8vcCh6dbnKYxGEvBMv2Ag3qKR0pPhgeTSwfHg8MFgffTkXK2ulz5EbEHbyj
 i/ECqGndU3WR+sDYQM6QdFWBHK3FZb4rcj/R9sAwYRi/fXWzhUwOL8RAJg9/pt5tkDEPqw
 EljffLv59jHFRhb+G4ja55CU1YCY/qhuQgJRgMkxqInTUE/jcvVVE7IoWjDQHejfICqdSN
 +dM1z2L4HY+Ja1YFE6TalQ+iPNS+oUoAibrCucSmrcpILtGSf9slEMoNGcbzsoSCEKheCm
 Nm/WsEmTO+0j5hTOJSeiRnb5K9m0qgAHvUmAjlkj7PdiBumurMTb3WS9rhqOyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ae3rtGG+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to
 version 2.4.12
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 20:40:52 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-markdown2/python-markdown2.hash | 4 ++--
>  package/python-markdown2/python-markdown2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
