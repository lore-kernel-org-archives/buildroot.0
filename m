Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70910C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B614168A;
	Wed, 24 Aug 2022 11:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B614168A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NeT5AzMfLyaQ; Wed, 24 Aug 2022 11:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD50841677;
	Wed, 24 Aug 2022 11:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD50841677
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BEF91BF37A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D991C60E6D
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D991C60E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9K02vgC7EiJ for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:17:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F07605EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F07605EC
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:17:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D9E420009;
 Wed, 24 Aug 2022 11:17:07 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:17:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220824131706.04fef565@windsurf>
In-Reply-To: <20220823213206.10149-1-fontaine.fabrice@gmail.com>
References: <20220823213206.10149-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661339829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vY9KHOqzhDM6eKWOhKom7JNVUs9PrXhvZqiEipjx0r4=;
 b=Qvuk0Ni04wePYckE+8j2OeMbKiTgMXOIkTuFQ+vDpOJPubhE4NnynLXiNEjsWPymihcePR
 yEsB8xpWPh/oujL6Fz23RUYvHqDHcpGf/TjIAJ3L+r+fXLtR3Re/aPo4ck84wXl2LZKGMO
 zwz7nsoqUvAzFcPYKyX7e6dBK2Ln9i/iLvc5cRt26Re2uQwKuu3jCEbUaU3QM/vwpZL4e7
 2SJCWvQ177rx+/WvKSfNvR9QS/oqmKrOQuvUqLPSyj9NhKtwxJ7pI+VMGPx7bWr3PqkxPL
 Lmdv2e9PrcipFvV3jVm1dzp5e8m76Nf+C59JUXwC0Nhz8k1OlROz5ymyIqOJ0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qvuk0Ni0
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: set
 krb5-config
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Aug 2022 23:32:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libkrb5 build failure raised since the addition of the
> package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> checking for krb5-config... /bin/krb5-config
> checking krb5-config CFLAGS... Failed to find installation architecture
> ""
> checking krb5-config LDFLAGS... Failed to find installation architecture
> 
> checking krb5-config reported version... Failed to find installation architecture
>  ()
> checking krb5-config reported vendor... Failed to find installation architecture
> 
> checking canonical API type... HEIMDAL
> 
> [...]
> 
> In file included from src/modules/rlm_krb5/rlm_krb5.c:32:
> src/modules/rlm_krb5/krb5.h:41:9: error: unknown type name 'krb5_verify_opt'
>    41 |         krb5_verify_opt options;
>       |         ^~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f173d1600c278d910f4cbeae86dcad1ee0f911f9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/freeradius-server.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

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
