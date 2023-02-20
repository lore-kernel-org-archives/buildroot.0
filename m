Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B2C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FE6E701A0;
	Tue, 21 Feb 2023 02:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FE6E701A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0ZIHz9VC6On; Tue, 21 Feb 2023 02:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAB270314;
	Tue, 21 Feb 2023 02:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAAB270314
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A84871BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815EC813F9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815EC813F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krdGdvc2HNLe for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:32:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBDB981916
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBDB981916
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:32:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62BEFE0002;
 Mon, 20 Feb 2023 22:32:05 +0000 (UTC)
Date: Mon, 20 Feb 2023 23:32:04 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230220233204.056b091a@windsurf>
In-Reply-To: <20230208071226.33697-1-fido_max@inbox.ru>
References: <20230208071226.33697-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676932325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8fjcjF0jGcW9U3M5ZRrPASd1Xg0f24dmO2Vd2Pbqh0=;
 b=a1JRIDX6E78bzJOdY5ZqUQFHD1RCnPQi1OThnvxtmlZP1gIrVD42vb5DWgMyOixT+qf4UU
 /tv3Ss6Ce1XjiZiw0c7Qzo+eb9ohfc0Thdq+Z61ZMgB1aWhy3mdZEPYsU/CPy6Nj90n0K8
 Huh3jz1vLa6N/ExYMySAa7uUrSL+iOR1cA5mRCz1iMN/aiEJqdve0IyNch/LbwGDVwTMzi
 3bEzsIogE+qt+HhonH1QlDmo6vDl6B2Ty204viriTZvKmJzmr7JL04dnJhmH2gjUgEaLLk
 itwPfT+N0cQXzWvJqz4SbzOYKnSa8E0lMPzXvPy7c+cYnmpCRPUwoNetZ/ozhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a1JRIDX6
Subject: Re: [Buildroot] [PATCH v2 1/1] package/postgresql: add lz4 and zstd
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Feb 2023 10:12:26 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> PostgreSQL has optional compression support (LZ4 and Zstandard).
> So enable it if libraries are available.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

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
