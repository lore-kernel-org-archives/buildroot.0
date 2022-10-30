Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A304C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 043EB4018B;
	Sun, 30 Oct 2022 14:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043EB4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzP-2GrHdljo; Sun, 30 Oct 2022 14:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5F8401A1;
	Sun, 30 Oct 2022 14:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5F8401A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 108EA1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1F10401A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F10401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIGq2YQ6QPTD for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7EB4018E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F7EB4018E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4166FFF806;
 Sun, 30 Oct 2022 14:06:16 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150615.40fb7516@windsurf>
In-Reply-To: <20221029001917.1312839-1-james.hilliard1@gmail.com>
References: <20221029001917.1312839-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux636uOdam/h2GWNwE+KBZL8NqS2U2+l2SnY6Op1ESU=;
 b=cXFaym1vCezCbIy6k2oZJLjawLO/uqhTbVfQAGyFW77IJtdBf/UO2/AEiQKzp5pJeobkCb
 2I9dAInUjNkJsR4yAbbliyAf+t7O305JHLWxYDTAOeBSHFs3Fe7G1jq2cheygSl8WrPorU
 A8yxzvT7hQVfN7ZM35C2NB53P97lW+oRQL33RknXk51gavGx/y5Pr2MKFn1KD6zl0W2gY7
 7IFEBRjc0P7raUerh9yZho7XjvzBB74fCL0H8jH7pG88Sw72b3olYE8vKMnh9Xzo91CcX8
 pCG4pStBVBLzp3h3dSzIMS4LA5XWXgvGfQ+osncp/AtUJC9GO58gy9Gj4mrJhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cXFaym1v
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump
 to version 4.4.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Oct 2022 18:19:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to date/formatting updates:
> https://github.com/python/typing_extensions/commit/fb77519b198f9d610ee8f674e27b8ce1da00f61f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-typing-extensions/python-typing-extensions.hash  | 6 +++---
>  .../python-typing-extensions/python-typing-extensions.mk    | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
