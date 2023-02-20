Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B223C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 438AA40276;
	Mon, 20 Feb 2023 21:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 438AA40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTZjBfLTR10W; Mon, 20 Feb 2023 21:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D66542A54;
	Mon, 20 Feb 2023 21:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D66542A54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1971B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D42340C2C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D42340C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afbX2W6CWNZk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0B740C21
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E0B740C21
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 542341BF205;
 Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:51:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220215144.68fff5fe@windsurf>
In-Reply-To: <20230219165638.147772-1-fontaine.fabrice@gmail.com>
References: <20230219165638.147772-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qf0c64ia1NOBzUaT2fv+Q0xRM4V8XA1aWHyBLtbpSA=;
 b=h52gur7q1buW5zMYn3op6rriLY3IGDYelma6Kqvw5A5Fwa1rEF5CuP0h6nJgpdufmQiz/8
 ChwT8E1mRtkq0rRZyX+yNsBpWWNRFn69Km8i3pVrcJFHKOnU4nR+UVDY9oFHZx6YghTNOI
 ZYjFxTNNNAHPTcLGTWfcdrf2G+qm9nqhsl5IAwvx2Sh48Ljy/xYVoQfdOCgqpyCH6GM6Vi
 dbKjytVCaiNljnhsUmfLzK+cIs0Gex1Xhi5fPguF49JXbsWtF5Dd0OTY5m2BVPFLbkYtH+
 wVjyzo+E/WKKYFe279aVUpUFqRtoJey7M7zdgqo8DbRYuCXQKK74dS3w3f56+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h52gur7q
Subject: Re: [Buildroot] [PATCH 1/1] package/modsecurity2: disable pcre
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
Cc: =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 17:56:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable pcre to avoid the following build failure if pcre-config is
> found on host raised since bump to version 2.9.7 in commit
> 42e34cf10f9eb037aa8c48a4fb9e8f521901b983:
> 
> /home/thomas/autobuild/instance-0/output-1/per-package/modsecurity2/host/bin/../lib/gcc/mips64el-buildroot-linux-gnu/11.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: cannot find -lpcre: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f4864f8cc1d07e357f6e5f8302c19ae94e9cf3af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/modsecurity2/modsecurity2.mk | 1 +
>  1 file changed, 1 insertion(+)

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
