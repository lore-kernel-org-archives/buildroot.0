Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1485AC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE60403B7;
	Sun, 12 Mar 2023 12:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADE60403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpGJEAoIFcxj; Sun, 12 Mar 2023 12:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBC7C40376;
	Sun, 12 Mar 2023 12:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBC7C40376
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA921BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 432A460BA2
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 432A460BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Di1O6l8LnsT for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:34:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA0B605EA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FA0B605EA
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:34:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29E0A40002;
 Sun, 12 Mar 2023 12:34:35 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:34:34 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312133434.3081ee6a@windsurf>
In-Reply-To: <20230301220159.161476-2-ju.o@free.fr>
References: <20230301220159.161476-1-ju.o@free.fr>
 <20230301220159.161476-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=la6A9nkwIyBAD+UXoIKDf0t4RBE6R4izPwcVqllXYTE=;
 b=C8dbWR/uWiLwyDNsVl3fOFNn0qyuDZACJd9W6YxO4hT7bDQJYT65ohZ4uG8IS7BrKrpdPb
 7It+D4mnqU0YLutphkX87y+VAnfPD3LWJekIJ8N8sjXkJxIf5CU9gy6nQZXZLAH81RaJ+g
 Ad7Xj3c8+b18G5EADofFqzDAkjMQMF+XdJAuPrbe8bCd7QCvfZLtHf/vqTyfgcA7dy443m
 DJR1MPacpnBR+tU3ZV2+LZ1MdREWD+Eb+EkYJzLSZu0HgzT3ONBhUIPO0cBiJs0FxIhOtz
 q29PrCy3nW99XYWgLx0OpzeXk4oY8BOeF6AEmh9UdwPImczprmjf5kUwEU85sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C8dbWR/u
Subject: Re: [Buildroot] [PATCH next 2/2] package/kexec: add
 KEXEC_CPE_ID_VENDOR
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

On Wed,  1 Mar 2023 23:01:59 +0100
Julien Olivain <ju.o@free.fr> wrote:

> cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier

But then you also need:

KEXEC_CPE_ID_PRODUCT = kexec-tools

indeed, by default, the value of KEXEC_CPE_ID_PRODUCT is the name of
the Buildroot package, lower-case, so currently the value of
KEXEC_CPE_ID_PRODUCT is "kexec", not "kexec-tools".

Am I missing something here?

You can double check this by running "make pkg-stats" on a
configuration that has kexec enabled. In the last column of the table,
it will tell you if the CPE ID is found in the database.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
