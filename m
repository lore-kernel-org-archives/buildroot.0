Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12152C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D8260BC3;
	Wed,  9 Aug 2023 21:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D8260BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WytnTY0OUhty; Wed,  9 Aug 2023 21:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F141560B1C;
	Wed,  9 Aug 2023 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F141560B1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B32F1BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 722A940647
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722A940647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mfz4My_kKOyr for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:08:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7902D4063C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7902D4063C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21AA4240002;
 Wed,  9 Aug 2023 21:08:26 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:08:25 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230809230825.30ad5e95@windsurf>
In-Reply-To: <20230319181100.23180-1-fontaine.fabrice@gmail.com>
References: <20230319181100.23180-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691615307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5vRb/Ndl02EMOYUT/YpAkLAUUSF86uGcoFcT6F2rLQ=;
 b=Hj3qLySokbE0RmmgA2a6fJ0787xkytOKJ0eX/spG88SSCkbKkoH3DHxnzaghij9apUgiQ3
 pgl2/JgBIOVNQunRa+l4mP0ZCUT/By+Gnru+QISNJzvCoZ4lxrLuLvIHgmn0UeL0O8h7yI
 sTnDE5VxKCKk8ZvdlpEZRjgjnskhXoajtiKnB8uYvuVU5uUHBkyuscm+rej7ZdPckKMzNq
 sdsARFiKYpY6CkHpv2gjgUYMBNOVeOXvwssH0RHBZzv0CNaOm3Vt5dotT2RRevryNqvx1S
 NyUkv6a/EGxXCJRAforB2WhS8d0nrLz6MKasp9Te7G0QsL1LcJDlrqGh8v8m8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hj3qLySo
Subject: Re: [Buildroot] [PATCH 1/2] package/xlib_libXpresent: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Mar 2023 19:10:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/Config.in                         |  1 +
>  package/x11r7/xlib_libXpresent/Config.in        |  8 ++++++++
>  .../xlib_libXpresent/xlib_libXpresent.hash      |  6 ++++++
>  .../x11r7/xlib_libXpresent/xlib_libXpresent.mk  | 17 +++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/x11r7/xlib_libXpresent/Config.in
>  create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
>  create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

Thanks, I've applied both patches, after addressing some issues pointed
out by Bernd.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
