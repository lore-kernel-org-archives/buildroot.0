Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F4EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 169874050C;
	Thu, 28 Jul 2022 20:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 169874050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGpVpJK_W-f2; Thu, 28 Jul 2022 20:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E43B40354;
	Thu, 28 Jul 2022 20:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E43B40354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 590501BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA088267C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA088267C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSJ3fJwth2tF for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:56:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC5882DDE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FC5882DDE
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:56:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E330B60005;
 Thu, 28 Jul 2022 20:56:45 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:56:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225644.6dd7f21d@windsurf>
In-Reply-To: <20220728120546.2534117-1-fontaine.fabrice@gmail.com>
References: <20220728120546.2534117-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YksIoMMqjqHZD9XCzxcLKj37gZcq5fBX/PdEoeYj+8=;
 b=b79eZgvQzsPfHq8IFJpnzl/CX5cAkKiL2XpG+8w5/WU2T7QUr9sYfI7ZJDdAlK3qmZkp5w
 Z6kz779Srb+hntataDOyv05+P8qgIjPVjgXrXsOJT9+F1X04zg7iGbQ9FdZWQsBXoN1Kzf
 ONpNuriN2sypXo5q1+0qHbh27pQnr4D9CLNbTkf2Re6Vy6JdyK9XYZCxVS1hQEwVNaiTQ3
 rmiLhYqrBUXyKNzLWVF3YRvVsp2mjMjlh2w3D/NTH4smz+pkudjfEFg+atlQKTxYKU8M7Z
 J32sB7ZF4P94tTKYFcDT4UXMrfNgfVcWhYvjfiEaI25rWvf+HZPsJOjo9ZSkdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b79eZgvQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: select pcre2
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 14:05:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit ea746f312844df298bbc9a697ca178f3a3c67a8f forgot to select pcre2
> resulting in the following build failure:
> 
> Makefile:575: *** pcre2 is in the dependency chain of libmodsecurity that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6528d2611bd1a45c1e94bc6b866de9c33dd90a7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmodsecurity/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
