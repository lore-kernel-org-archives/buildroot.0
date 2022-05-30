Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E925C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A59A640CA4;
	Mon, 30 May 2022 20:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ree0WOZYQHtp; Mon, 30 May 2022 20:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A41440C9F;
	Mon, 30 May 2022 20:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 235BB1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F93460E26
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLQhciY3_PLV for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:55:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E88A760AE8
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:55:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7CA1100002;
 Mon, 30 May 2022 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653944151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foQaQJzv7C8CiKaXRNiK05XUSSnm0d8hsi3gNythg6M=;
 b=e7GmwWs7AHsxSY4U1zQqe3OOME4FhTfBoRpbhnPWUDGAqKeOXaN/EO+TWr5AZ+JqHfDzca
 0ctJMJTd6xE8FvNNof8MjRuKjZ1QkPK91iW1i66d6tdd36zr0BZqBgb/GITrsBEiQWyKOa
 X2cQOhK1hMFjXBfYHFID+vNs8WXmZjz+VqHPElkOuHnmyuDZMGS8VlGn+9o55mLsbIJKaN
 NCa3x0jOlcWgtPw9eRKnTVqbQxklQYCHLp/oamV/aWmbIxhcN4owHUFdXv4TttSOWslb6+
 BmR/5yywaav95JJBEN2XkRe4bNa61AvlRT5HqaginObYqS9FS7GtlpG6ksbfFg==
Date: Mon, 30 May 2022 22:55:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530225549.6551ed0a@windsurf>
In-Reply-To: <20220518212740.464658-1-fontaine.fabrice@gmail.com>
References: <20220518212740.464658-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4980
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

On Wed, 18 May 2022 23:27:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-1619: Heap-based Buffer Overflow in function
> cmdline_erase_chars in GitHub repository vim/vim prior to 8.2.4899. This
> vulnerabilities are capable of crashing software, modify memory, and
> possible remote execution
> 
> Fix CVE-2022-1620: NULL Pointer Dereference in function
> vim_regexec_string at regexp.c:2729 in GitHub repository vim/vim prior
> to 8.2.4901. NULL Pointer Dereference in function vim_regexec_string at
> regexp.c:2729 allows attackers to cause a denial of service (application
> crash) via a crafted input.
> 
> Fix CVE-2022-1621: Heap buffer overflow in vim_strncpy find_word in
> GitHub repository vim/vim prior to 8.2.4919. This vulnerability is
> capable of crashing software, Bypass Protection Mechanism, Modify
> Memory, and possible remote execution
> 
> Fix CVE-2022-1629: Buffer Over-read in function find_next_quote in
> GitHub repository vim/vim prior to 8.2.4925. This vulnerabilities are
> capable of crashing software, Modify Memory, and possible remote
> execution
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
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
