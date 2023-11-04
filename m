Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FECC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8126E60E24;
	Sat,  4 Nov 2023 21:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8126E60E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9SIrBCMl-Qk; Sat,  4 Nov 2023 21:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D21F660DFE;
	Sat,  4 Nov 2023 21:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21F660DFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89DC51BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37368418BD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37368418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUMM6cUeZjbm for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:36:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48242418BA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48242418BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3732460002;
 Sat,  4 Nov 2023 21:36:07 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:36:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104223606.23ed8579@windsurf>
In-Reply-To: <20231001152518.1065457-1-fontaine.fabrice@gmail.com>
References: <20231001152518.1065457-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699133767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdIXGlYEk0miSf0TtZCDf8OAv1++dCP1Zc8uRnaZaII=;
 b=hgmgQL9GZXv1uOOmwpXkFMquLjbH9Sg5lUFYznUvexRSj/mxl7rjdhmoZBvgjVwc+McVEB
 mMSnzq2rliKkmbJ6msyu26dWnmPJhLQ+z1aSAynB8eE44m/JUUFUrI+B+whzzrwH6FtDgA
 AqBtaw/DOi6vi32TQH8T9zM2r6e8mHnBam3LLkmz2JbKlfs1F+cNbCqv/4cs+maUuMfGQn
 bUaQk0E3Fz19T3jf7CcJF9qOd/agpTbE03BKmkuFXhIk7B/c26YKWwweqX9Gs1Hp/EeWii
 p79MR5y7ohcDeS35PEnMhs9q/tpVN49rqQL1ehGbk5yZbmhKswb9L9tMuQAH6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hgmgQL9G
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: add c-ares optional
 dependency
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  1 Oct 2023 17:25:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> c-ares is an optional dependency since version 0.10.0 and
> https://github.com/strophe/libstrophe/commit/a13847d9949f05920f94768495872807ae49c773
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libstrophe/libstrophe.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
