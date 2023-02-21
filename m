Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB27C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CB382014;
	Tue, 21 Feb 2023 08:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19CB382014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcEGlNc8uSTu; Tue, 21 Feb 2023 08:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE2081FF5;
	Tue, 21 Feb 2023 08:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE2081FF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6E21BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9EBE610F8
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EBE610F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y77CW6n9VRUy for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:23:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83825610E6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83825610E6
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:23:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08E2A240002;
 Tue, 21 Feb 2023 08:23:11 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:23:10 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230221092310.3d532276@windsurf>
In-Reply-To: <20230221012238.3809280-1-james.hilliard1@gmail.com>
References: <20230221012238.3809280-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676967792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oh0D345fLB3MiS37tYqVyXu7r8OlwZ3J//YdMwGD7yA=;
 b=KV552pEzU/MrjhBUsab5Aes4K5pw1DJ2CbQY5mGSs+5pQ/UYLNDesOuILh4HB3J+08dPyK
 O0EgmNztHdktqkkLIvW0X8+npsZwGeEsea2fRoxeJUJKHQktC8PAEI7UrExglqg5TJX/+3
 OF65oIO54sb4rqDQ9vUoZhm4bgvMnJok7puVMqFGetAQcUVrNcw8hW/xF8HD4llvgJOOpW
 BbGfraqeMe3nMsDRc0HDyKuXuIo+LXbb3pwB+RDLKzYXFJLXcYbTJ0zUsifQUiFM45jJ1N
 hD5g20rBc40pV/YRENZ4LNpUUG3J5DLmJGmglPKifTf5uhncLYgcKR+RoIK5Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KV552pEz
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.67.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 18:22:38 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.67.1 announcement: https://blog.rust-lang.org/2023/02/09/Rust-1.67.1.html
> 
> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash                | 252 +++++++++---------
>  package/rust-bin/rust-bin.mk                  |   2 +-
>  ...-unsoundness-in-bootstrap-cache-code.patch |  43 ---
>  package/rust/rust.hash                        |   6 +-
>  package/rust/rust.mk                          |   2 +-
>  5 files changed, 131 insertions(+), 174 deletions(-)
>  delete mode 100644 package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
