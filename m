Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A9BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD02683EB0;
	Mon, 30 May 2022 20:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umL0klF9uL3L; Mon, 30 May 2022 20:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D200C83EA5;
	Mon, 30 May 2022 20:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2661BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C39F83E74
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6V3nBe7jbsHq for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:26:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83B3883E6D
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:26:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C40F0100004;
 Mon, 30 May 2022 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653942414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9BSV7fHaVq7UIQVlS23MmezMie47WP+5366YmjYa/U=;
 b=IOvoAee45Eb3yX5w02SCeXoLBBRK0N7juigQGs1UJ2bkauZsYpT1YpvUqWE+MXkfiTRLbR
 bZS2LC22rT3+UfTWOBloJJuNb2h2oaG5o232D1KWDpLtDzlEViu6HhYQayogghYbM+2+/W
 9DjbHhFaH1uWN0eEpm5r6D/E+3b4jLYWrMDAsKgE/Nzkgdjprq6vtNW/6RZqZog+NfG+tN
 7CKVDwSdEw5DE/jifhlJ8nWYNRVxv6/dpVRYbmdZDT0naEa2lSflmyzGna6swM1Xmy1gRy
 NeuzqHP3+48qVqyhU4P6j4Zuk4f0Sbn3hoteu9hDhaTwi7yk/9MJQ8NdyP7Miw==
Date: Mon, 30 May 2022 22:26:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530222652.63022cd9@windsurf>
In-Reply-To: <20220526221711.731246-1-fontaine.fabrice@gmail.com>
References: <20220526221711.731246-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/fbv: renumber patches
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

On Fri, 27 May 2022 00:17:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9863553fe8fa16a4d19f652b409a44bb58ef5567 forgot to renumber
> patches
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fbv/{0002-cross.patch => 0001-cross.patch}                | 0
>  ...ig-endian.patch => 0002-fix-24bpp-support-on-big-endian.patch} | 0
>  package/fbv/{0004-fix-bgr555.patch => 0003-fix-bgr555.patch}      | 0
>  package/fbv/{0005-giflib.patch => 0004-giflib.patch}              | 0
>  package/fbv/{0006-include.patch => 0005-include.patch}            | 0
>  package/fbv/{0007-libpng15.patch => 0006-libpng15.patch}          | 0
>  6 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/fbv/{0002-cross.patch => 0001-cross.patch} (100%)
>  rename package/fbv/{0003-fix-24bpp-support-on-big-endian.patch => 0002-fix-24bpp-support-on-big-endian.patch} (100%)
>  rename package/fbv/{0004-fix-bgr555.patch => 0003-fix-bgr555.patch} (100%)
>  rename package/fbv/{0005-giflib.patch => 0004-giflib.patch} (100%)
>  rename package/fbv/{0006-include.patch => 0005-include.patch} (100%)
>  rename package/fbv/{0007-libpng15.patch => 0006-libpng15.patch} (100%)

Both applied to master, thanks. I don't know if we should really
continue to support such old unmaintained packages, though :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
