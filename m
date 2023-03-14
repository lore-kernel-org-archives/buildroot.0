Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB797C7618B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 625B540B5C;
	Tue, 14 Mar 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 625B540B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIFxb7j9vrJw; Tue, 14 Mar 2023 22:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3A9F40B58;
	Tue, 14 Mar 2023 22:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A9F40B58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25AEB1BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04304401BA
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04304401BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7HqMlZ8X4h4 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:27:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D8840230
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85D8840230
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:27:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE249E0002;
 Tue, 14 Mar 2023 22:27:09 +0000 (UTC)
Date: Tue, 14 Mar 2023 23:27:08 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230314232708.674f4e3a@windsurf>
In-Reply-To: <20230314095234.284584-2-bagasdotme@gmail.com>
References: <20230314095234.284584-1-bagasdotme@gmail.com>
 <20230314095234.284584-2-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678832830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2U8ugEuxBHuyefzJX63Si4eZTYe/0zuG/p3jccxqnI=;
 b=FdX2ICsynwKuPIFxpPehmibM1lXY5xZ6AVjn8BqzK+xs7mskK6DHED5kvqo34vEEojFrvg
 GDBx5P6qBtod9NbWBF55oDIztiVfIjdbdgbYDwMQWbNEyq0PJPcaOhBsefsYsmG8yliKv0
 DsnZIiI1e0Vsq1s0zuVgc5UgNU2QEtjdF1fd2IcFPDZgaPKOkphUy6MYTJfHEtxLqjjvGj
 FODMUljEvjK2ua/2XUdESLdZbY6rcVHtUkwR1b/4V7D904VZiBMYwlFN/wJaGbY+XkOEda
 6w9j387i1H7eQ74JbB0ZupJ95ZVTYXrI+qNu+hyQAEsl2bS+CJW6BMo4kBjgmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FdX2ICsy
Subject: Re: [Buildroot] [PATCH 1/2] package/git: bump to version 2.40.0
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 16:52:33 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bump the package to v2.40.0. The release announcement and
> notes are at [1].
> 
> While at it, also drop two Buildroot patches as these have been
> already applied upstream.
> 
> [1]: https://lore.kernel.org/git/xmqqjzzkv8xz.fsf@gitster.g/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  ...avoid-redefining-system-function-nam.patch | 109 ------------------
>  ...undefine-system-names-before-redecla.patch |  55 ---------
>  package/git/git.hash                          |   2 +-
>  package/git/git.mk                            |   2 +-
>  4 files changed, 2 insertions(+), 166 deletions(-)
>  delete mode 100644 package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
>  delete mode 100644 package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch

Both patches of this series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
