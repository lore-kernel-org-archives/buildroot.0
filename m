Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17A4C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68D01418BA;
	Sat, 23 Dec 2023 20:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D01418BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-M8ajrM4rkC; Sat, 23 Dec 2023 20:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BCE418AD;
	Sat, 23 Dec 2023 20:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BCE418AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 064DB1BF47E
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E093360AA8
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E093360AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgtWw3GiZ_fl for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:36:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96780606C6
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96780606C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A15FF803;
 Sat, 23 Dec 2023 20:36:27 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:36:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231223213627.464aab47@windsurf>
In-Reply-To: <20231204211622.12687-2-bernd@kuhls.net>
References: <20231204211622.12687-1-bernd@kuhls.net>
 <20231204211622.12687-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703363787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRNfmQkVBLW50D89HGFfDAt0RIXrTpH1CjNf/DJxWGI=;
 b=Wza/qXvWKngvY3OvuHBzYbn26y9ARKzX5s0fQKdBzOLOmLAF1SQ+gOqT7Ixmu/KEWZx2av
 PtFAjJDi54TsOCqPmQwcOFcaqLkB3AyYss45lK1laiMGZ4xwIFN2RvC4kWu29ZFVYvJz2N
 dYzapg5qXAKmYYMHN11VwKbzk8fx+nUMHEfI20Doy7SLjB+y819m+50O2JCMOmIL0EBUVa
 MP9NG4HZgubdUFQFD5SA91+4oaYtl8Lng8RvEsfAqECtUoQJr1Val7hmt+iWNvO5O8eTqZ
 pzP+pZibDcBREbfNK0D5GVr61dfmqrRAH/J46gV9R/OwnCHYo2/yk991xWE9gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wza/qXvW
Subject: Re: [Buildroot] [PATCH 2/3] package/xmlstarlet: Fix build with
 libxml2-2.12
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Dec 2023 22:16:21 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Fix-build-with-libxml2-2.12.patch    | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/xmlstarlet/0001-Fix-build-with-libxml2-2.12.patch

Applied to master, but after taking the improved patch proposed by
upstream on the Sourceforge issue. Note that since you did not convey
this patch yourself, I made myself the Author + SoB of the patch added
in package/xmlstarlet/, but crediting you within the commit log. Thanks
a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
