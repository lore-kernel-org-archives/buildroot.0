Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F9D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A9380A6B;
	Sat, 26 Oct 2024 15:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niP9ZvS5a8lS; Sat, 26 Oct 2024 15:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E975A81858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E975A81858;
	Sat, 26 Oct 2024 15:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7FF5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA6140240
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7W2po2cXTEG for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1356A40256
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1356A40256
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1356A40256
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:56:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC2D31BF204;
 Sat, 26 Oct 2024 15:56:42 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:56:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, Asaf Kahlon
 <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20241026175642.5576af42@windsurf>
In-Reply-To: <20240917021332.3838579-3-james.hilliard1@gmail.com>
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20240917021332.3838579-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729958203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGUntOY6EH8DDIgeijHk7hak6brr4IpCTm5ZdKdWJsY=;
 b=g3m01g6etw0nXmpSULRunBO605VeL7F6wFlZq9+TVnEBx/J6cGWnfXY0ufn64wn6MThhS6
 JqIF4GXRM//skktrjxDLqxBIgoEs66C2kyvYvUO+Lvh4SsmzJeUd84j6sR7xWJXA4YZiC8
 1c/lVVvlPAdOd9keWzgF7rHrp9Aq1BkZ+QeXbKUzfwM+arDtcNzz+Flm4lTgx9kIPsuk6d
 fun1XIfprHjr18kDQddIm+xhxhLPiTPbkqAyoZ7Bl42V5bDqDEp5dNS57w+sOBXG4sGr+V
 6N97RI5e6yCu/NkV1yIZrtHhsFEr9jm0EqMAldsT8rtVRfCT1AEyn0pDLZN8Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g3m01g6e
Subject: Re: [Buildroot] [PATCH v5 3/3] package/python-cython: bump to
 version 3.0.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Sep 2024 20:13:32 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Tested by ensuring all packages with a host-python-cython dependency
> build succesfully.
> 
> Note that due to namespace conflicts supporting both cython 0.29 and
> cython 3.0 variants at the same time would be difficult as both can
> not be installed at the same time.
> 
> License hash changed due to changing links from http to https:
> https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v3 -> v4:
>   - update to 3.0.11
> Changes v2 -> v3:
>   - add more details to commit message
> ---
>  package/python-cython/python-cython.hash | 6 +++---
>  package/python-cython/python-cython.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
