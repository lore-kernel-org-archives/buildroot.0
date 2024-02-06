Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF8BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3048233E;
	Tue,  6 Feb 2024 12:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yOjWCeUPoTR; Tue,  6 Feb 2024 12:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C505282347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C505282347;
	Tue,  6 Feb 2024 12:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8DE71BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A531441F78
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A531441F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivk3L0iay3HJ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B3F041F74
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3F041F74
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC81B1BF204;
 Tue,  6 Feb 2024 12:57:14 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:14 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135714.764315e0@windsurf>
In-Reply-To: <20240110035054.946683-1-james.hilliard1@gmail.com>
References: <20240110035054.946683-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TewUoD8eGFs8Zmq6ggcVgP3CSDwslkeCfCY0DlvOcD8=;
 b=M2zvv+Gs1jFgS/D42ZbIFdP9+UtVpA/aK278CmjXHfDYmr2HDUtl8PR4whc6KVnMNpmfzf
 boZ5vISMbLHo8h0N3l9oLjZCcIXpaZ1jiTbhZuop9zdpW+ZhtSQpFkc8mu31YnolWF0+By
 C47RIoFGpVqkmrXUABTFJBDfzzqz4a26MG3aD6QXhehfvFJ6WFhCbQ1OOw9Zq6gglcW4/m
 TFRuDclvOiDLLJ9iGEZGzpzDnAL9DFBKIYlE0VtjM3M2AfWyCUiCWmYrQf0q1CBud6QBtU
 VKzX2WmRMZwaZw3rY+D/8JF36U6701bu97tYqRP03ZQN5g0I0OdS5ltCo2eSsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M2zvv+Gs
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.4.0
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

On Tue,  9 Jan 2024 20:50:54 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
