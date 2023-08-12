Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA70C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC9960B78;
	Sat, 12 Aug 2023 12:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC9960B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc_YYnuan7x9; Sat, 12 Aug 2023 12:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFAB608B7;
	Sat, 12 Aug 2023 12:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFAB608B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9042F1BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D8B4012F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D8B4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofAm-k7wLbuB for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:36:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B9EF40018
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B9EF40018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0205CC0005;
 Sat, 12 Aug 2023 12:36:10 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:36:10 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812143610.77acc416@windsurf>
In-Reply-To: <ZNdpt/gB95HIWDAq@waldemar-brodkorb.de>
References: <ZNdpt/gB95HIWDAq@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691843771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/gzKuUCcRfZn0wuAnUCsa3jwXr5sQZQWMlmlauGns8=;
 b=Y7fzvowDIpzqKOpssCw7xJUuZa5Eg2ES3AJhpHrYKEU6/4QSNxwz8mUlFV8B6iW2kAmOGT
 OTsjAOjlwJYl4qlp+8zGK3QN6vd03wMaFA54tjAJ4Fy4YpHUA7zGahL9a38JwdbljU3hTk
 m7X11SrGYnWAq6RitLNYsroRb5KPg/UYEpssMFto6DfeXCjQhj0pjSZKuH6pX2hUeF/W+L
 0DBrSnFuaUhEAhU+3EgCPuqCZSSWJvEjyMYVNMlcNHj7W0M42CMgfXOEZoPl8+LWQZ5ztf
 WXjHrglL+LmPOvfju/FZTgjQAR1fa1E2niVQupQbO1xHaTwlaWWaOMmq6YuKBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y7fzvowD
Subject: Re: [Buildroot] [PATCH] package/conmon: fix compile when using a
 static build
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

On Sat, 12 Aug 2023 13:15:03 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> This is a new Buildroot package and this is the first build error
> the autobuild servers found. It is not part of any Buildroot release
> so no need to backport.
> 
> Patch removes dlfcn.h, because it is unused.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/db3/db301e9f556592828800fa663f2549f430adb58f
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...01-remove-unused-dlfcn.h-header-file.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/conmon/0001-remove-unused-dlfcn.h-header-file.patch

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
