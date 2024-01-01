Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E3AC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB654095F;
	Mon,  1 Jan 2024 21:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB654095F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVnN1matS-rT; Mon,  1 Jan 2024 21:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 615ED40A6F;
	Mon,  1 Jan 2024 21:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615ED40A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40D261BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBCE8087B
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBCE8087B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYQ-OokW1HkK for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:08:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 514D081751
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514D081751
Received: by mail.gandi.net (Postfix) with ESMTPSA id 565C51C0002;
 Mon,  1 Jan 2024 21:07:01 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:07:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101220700.45cabe52@windsurf>
In-Reply-To: <20231230183525.1110378-1-fontaine.fabrice@gmail.com>
References: <20231230183525.1110378-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+naeGQJSJQQzqrPoq+z6MFglWg/zshtU81vnRtRzYDs=;
 b=RQl5QdPyVoHKOLHx75N/zpAhYGUeZlbJM4qoklcIAuUpitFZiR7fb3RLVCGmiHhZUBY69A
 OA1CpEe1B9aYeNqSmXTFfmQ3Q1h5viG7x3JmZrASvucSzyg95rGgbMmzIA4wE6zktlC0br
 rHLRj7BiczrNu6JHZVd4/T+yzHP2nKo4gbKZC7zocnCzTv3rrmO3Ky3Y8dF9r0EFs3Uf3J
 Iwa1Mky/HY7c9zMFOa4GBtGVGHtp8Synrubg6WM81rNygRJt/pA1QTzzQ0dqSiwfZ+XATe
 sNAw38oYJs0gXQO4g/qRAp9ENLG/NOdfpvo4lYtZ6wrVQx10V4pbgp6Y3Xta+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RQl5QdPy
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump to version 2.12.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 19:35:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with libmodsecurity (and
> a lot of other packages) raised since bump of libxml2 to version 2.12.1
> in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:
> 
> modsecurity.cc: In constructor 'modsecurity::ModSecurity::ModSecurity()':
> modsecurity.cc:89:5: error: 'xmlInitParser' was not declared in this scope
>    89 |     xmlInitParser();
>       |     ^~~~~~~~~~~~~
> 
> https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.3/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d6749bacf6c7c04a74e136585d36bc731716f6fd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libxml2/libxml2.hash | 4 ++--
>  package/libxml2/libxml2.mk   | 2 +-
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
