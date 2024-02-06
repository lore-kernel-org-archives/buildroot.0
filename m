Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8158BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E68981E14;
	Tue,  6 Feb 2024 12:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKL77TGdPbcW; Tue,  6 Feb 2024 12:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16EAC8233E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16EAC8233E;
	Tue,  6 Feb 2024 12:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93E311BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA1E60B9F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA1E60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alGZ5UgoOzHG for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7180A60B9B
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7180A60B9B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B29540007;
 Tue,  6 Feb 2024 12:57:11 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:10 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135710.01c79406@windsurf>
In-Reply-To: <20240110034411.933840-1-james.hilliard1@gmail.com>
References: <20240110034411.933840-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=havdzmawZUt/YQ2Dfl+dp5B4okB6clpGyHrQ+HQ79cQ=;
 b=luYW7Q48RETBKXHKSJTr+OsR49Kdp3FtqbB97f8FvnZquM5WWew9IJZMt4OnmHVdBsUDMn
 QNpVaaCAApzElcFStykWdDpmTNmAWmn0gzaZf4UyqCWAAE829wtxzO1uDY++PuCIKnDyia
 Jb135TDQojgWNwXoI+fEA0ts0Op1RoitqXUvNkuETc8NnmGfvXg+fuBO2Owuws60CvvIE6
 0jL/bqNgtoWEGM2et53cCUwnkJfQQHlr5fIGnpeziVuki1xhTajUJuFpXPIVxHIMfeuXgS
 L1jRjNDzTO055g0fVkE91oGVrOCzAYmhMr9NIPrKFH/j4Tfr62xy1KjZmgEcxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=luYW7Q48
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy:
 bump to version 0.30.0
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
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 20:44:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to date update:
> https://github.com/marshmallow-code/marshmallow-sqlalchemy/commit/767a8f965f8c2723b6d98cc45442df536dc8fa0a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-marshmallow-sqlalchemy.hash                      | 6 +++---
>  .../python-marshmallow-sqlalchemy.mk                        | 4 ++--
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
