Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F2C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E8B40BB4;
	Sat, 25 Feb 2023 21:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E8B40BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKy5vetfVH_r; Sat, 25 Feb 2023 21:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CE840BD6;
	Sat, 25 Feb 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CE840BD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B22A1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD7A4016C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD7A4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smfmyL5gCgPh for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13D540156
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D13D540156
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7578D40004;
 Sat, 25 Feb 2023 21:02:44 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:42 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220242.2761cbe6@windsurf>
In-Reply-To: <20230225144904.3033289-1-fontaine.fabrice@gmail.com>
References: <20230225144904.3033289-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZjRQhMDR8XQY4gNJv4jxO3lCHf4b92xEF7lsvaRxvw=;
 b=htAYMs4LxvfUBS1VxWyylCeRIrOPzQqrRiRlrlhOunubWGIn7MRr1LB6rj0Xm+Gf+SQIfa
 w6NLNxn9wBYW+WVS3A3pkWPyzCTmYtehWwljY2X/GpPYmFcqcML2Yg4xV0Z8DLq9i+TF7O
 kM3A7NsPkCC2iIykKj3AsfaX2ABMsprYamwdQ/rTaFvpjT5i8uXeElmwjueuFMaA/N78Iw
 V8mVMss9uZXSxGTJqKAmiILTWP7mfp5z/AqEu66tooSBf0EvkI9o19dWgdA6HWJx6b0fG0
 vuFdNmu5D9EMJYSw7y6ucu71jDtD5B1WBc7+Z0/SNcUwmanXcotJaOc8eF3Z5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=htAYMs4L
Subject: Re: [Buildroot] [PATCH 1/1] package/python-numpy: needs C++
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
Cc: Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Feb 2023 15:49:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> C++ is mandatory since at least version 1.23.0 and
> https://github.com/numpy/numpy/commit/c91a7d0c5691c9d78bd75284777fda73f225155d
> resulting in the following build failure since bump to version 1.23.4 in
> commit 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55:
> 
> RuntimeError: Broken toolchain: cannot link a simple C++ program. note: A compiler with support for C++11 language features is required.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2d048d9b669ad60f37eeb2162b0a4f9fb425be1e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/piglit/Config.in       | 6 ++++--
>  package/python-numpy/Config.in | 6 ++++--
>  package/python-zlmdb/Config.in | 6 ++++--
>  3 files changed, 12 insertions(+), 6 deletions(-)

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
