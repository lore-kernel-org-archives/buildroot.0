Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB02C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC87614D0;
	Fri, 25 Aug 2023 17:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC87614D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kDRp6tt3uOL; Fri, 25 Aug 2023 17:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F74F614C0;
	Fri, 25 Aug 2023 17:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F74F614C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FBF51BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E4783C8C
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E4783C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZScIJsyuhIS5 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:06:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CCBA83C4E
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCBA83C4E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 392F1E0003;
 Fri, 25 Aug 2023 17:06:54 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:06:53 +0200
To: Witold Lipieta <witold.lipieta@thaumatec.com>
Message-ID: <20230825190653.1575340d@windsurf>
In-Reply-To: <20230418114204.1773697-1-witold.lipieta@thaumatec.com>
References: <20230418114204.1773697-1-witold.lipieta@thaumatec.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLLvzfukMcfTNDha8PDw/7nNnKz/THan5zZVAi5Htzs=;
 b=AxphEqmFvoY3dLCfGQaeIEYAQk/f4QIWgzbYDs1Dvrr5Wamp1Z+7j8cjBl7MXotr7a0E2I
 +aAht8JUXg3KVfJSxRp6+CMbHPqZ5mJhtPgWKk07adSY9Af5L282T7Ll7ohR3lvEmSKImD
 IVW2EohWw3WAXU63xrchjd5EQLHqb9AlK9vVi0EIMdgiCkecRFeZ2Ok6eSkW+PSl6x+376
 v6pRc+GbdCidOLunzhl9HBHX+eHmntAT4kWJjWjNHx0eRW97yTfNtT3O8MDuG1czbtLVdD
 /EBo3sQRVIyoJrlDYrXAkoOhBBWEokbCrQH+eW+KQIU+K2Cim3XnHtPnR+E8gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AxphEqmF
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-segno: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Witold,

On Tue, 18 Apr 2023 13:42:04 +0200
Witold Lipieta <witold.lipieta@thaumatec.com> wrote:

> segno 1.5.2 https://pypi.org/project/segno/
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---
> Changes v1 -> v2:
>  - resolve runtime dependency
>  - add basic runtime check
> ---
>  package/Config.in                                  |  1 +
>  package/python-segno/Config.in                     |  7 +++++++
>  package/python-segno/python-segno.hash             |  5 +++++
>  package/python-segno/python-segno.mk               | 14 ++++++++++++++
>  .../testing/tests/package/sample_python_segno.py   | 13 +++++++++++++
>  support/testing/tests/package/test_python_segno.py | 11 +++++++++++
>  6 files changed, 51 insertions(+)
>  create mode 100644 package/python-segno/Config.in
>  create mode 100644 package/python-segno/python-segno.hash
>  create mode 100644 package/python-segno/python-segno.mk
>  create mode 100644 support/testing/tests/package/sample_python_segno.py
>  create mode 100644 support/testing/tests/package/test_python_segno.py

Sorry for the delay, I have now applied your patch to our next branch.
The only missing thing (at least that I noticed) was an update in the
DEVELOPERS file to associate you to this package and runtime test.

And thanks for having included a runtime test, it is _very_ useful,
especially for Python packages.

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
