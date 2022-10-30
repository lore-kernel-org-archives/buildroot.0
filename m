Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4938FECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9799608A5;
	Sun, 30 Oct 2022 20:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9799608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gF5_EvOGSLHV; Sun, 30 Oct 2022 20:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9916605AE;
	Sun, 30 Oct 2022 20:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9916605AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3B91BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA8D4012B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA8D4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1m7h0kpYT-iS for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:04:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B16400EC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25B16400EC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:04:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D359C1BF207;
 Sun, 30 Oct 2022 20:04:28 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:04:27 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221030210427.659402eb@windsurf>
In-Reply-To: <20221018133936.356595-1-giulio.benetti@benettiengineering.com>
References: <20221018133936.356595-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667160269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9Tt3TB9xL85ESnB8AiZubnGdOa3qSLCnEA5l15YBKQ=;
 b=F4U5GoJgU3mqEFFj0QYyBjojNxOs/yNc8ResA85Vd/b88qQNOMSzmuYSuwM9z5RfBEZQ8G
 jRzhwzW+noaSIkqZoICD8ujAJaxOwHvH6178ZKtpE+6zzZCeDTW9FgeO7cxXi0nCz2p2zD
 WYXVgwzH1IYsC89vLVbAzx+ROJHTfwc3rS0ASVcZ4etzyhudre6qrEz1KitiS+Wiha+fxb
 jlrDiaTny0stZIqGeJQh4Q1J5T526Y9KIL09gRFp799W/DW5vic/oQYa3V7XYGilxNotWE
 rJrJx5FhSjzgNn//teZp7QxrgEz3b3aXyovr+uGEeVLHo6+VPaDnGCKx+2T7Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F4U5GoJg
Subject: Re: [Buildroot] [PATCH v3] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Oct 2022 15:39:36 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Note that we use latest commit from branch v5.2.2.4 instead of
> branch master.
> 
> Fixes:
> http://autobuild.buildroot.org/results/550/550640296a92826f6f04d2344adde75c3025ea35/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> V1->V2:
> * use specific upstream commit SHA1 since the latest is buggy
> V2->V3:
> * use latest commit since it's been fixed and improve commit log as pointed by
> Peter Seiderer
> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
