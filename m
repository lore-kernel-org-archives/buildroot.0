Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0875FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09ED40CCD;
	Tue, 31 May 2022 08:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hi-sT5XvpDvv; Tue, 31 May 2022 08:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D283240C92;
	Tue, 31 May 2022 08:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFB91BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 190FF41BBF
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEkslCqLwnQZ for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:21:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C499A41BA0
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:21:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3DEF820000D;
 Tue, 31 May 2022 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653985271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fL04AueQ5yzrcPHCIR/7XX+8MtTRXn8vJlDzv9CsBCM=;
 b=mET9Fs74fFEzgMNtKb9o7HJSJxouCPnbn1xsfjpAI7L892JfWhYg2TW1SJ4LVuJlfCU5wu
 52XSlBltWwEhWuNEcLIy6OvY+ELdYV+VBS1TRgdfXDFeGhvWmO4AK5irHxYJUVxBmgWHIS
 JVTJdtjS+gijGqriFmsiLMutmKrH6lW/aCEMv1UiuV4p2xala93jvAP/v/RlpihSZWSMOh
 vAHIU4iIq8joxhxbCzxJn4QOBeaB7WK3+ti0fQiSEMboiltyu2eBT71hgRLsnkIBOQ9ZNl
 5V38vTf2dUsHF0IRYU/uUWjNUPYR9ac1LZxVmqMmuR9S3DBwLxBjka9o2pqX4w==
Date: Tue, 31 May 2022 10:21:09 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220531102109.55f8094a@windsurf>
In-Reply-To: <20220526113734.754047-1-aperez@igalia.com>
References: <20220526113734.754047-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: allow building for
 risc-v
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

On Thu, 26 May 2022 14:37:33 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> WPE WebKit works just fine on RISC-V. For the current stable version
> the build system automatically picks the LLint JavaScript interpreter,
> and the upcoming 2.38.x release series will include (and automatically
> enable) JIT support.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied both to our next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
