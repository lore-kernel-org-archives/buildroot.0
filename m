Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C8CC54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 22:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 058A441488;
	Tue, 19 Mar 2024 22:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjaoYDgmc5_2; Tue, 19 Mar 2024 22:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA554149B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FA554149B;
	Tue, 19 Mar 2024 22:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0CE1BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED10381EE1
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPWwzp4AA6nN for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 22:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEE6181EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE6181EB6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE6181EB6
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 22:24:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BCDDA13F89C;
 Tue, 19 Mar 2024 23:24:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 23:24:40 +0100
Date: Tue, 19 Mar 2024 23:24:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZfoQqKmkRJU0zqZQ@landeda>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710887094;
 bh=nDF7lS3elsenzJ0WltDKDnYGo4QwBNhoT7x1zAQOd2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0pUf+iRcuWF3Mf8KssDcxppDC5KHJvdlTonv97TGtqSIiW3f5FPhsb5gVmlqnRba
 zPR6bXKB0NOETiMnBAPc/7k4jJcd94210+dbonff62Ps1RxszbeyBqvKiy2oZ4JCeE
 V8iLI1sDc25VqwnpbE20XvhupYQ8STFDelzOoLi5FGtDNtcreBNBCBJd3oKZbrhAgT
 sod1D5xiab3Ay2AIkKhmiNH3nONh2d6LzelEg3zhThuvtbuuNV9RkmTbTpS2J3grHM
 SpzvHILL4Mh0o+BiVBgAYJoJtHnSmTleQqC+faeBC3ybrfbzh/BU3jDRf+reHJa8eZ
 5kbJCQJjs7qKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D0pUf+iR
Subject: Re: [Buildroot] [PATCH v9 00/22] Add support for AM62x-SK HS-FS
 devices
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
>   package/python-attrs: add host variant
>   package/python-rpds-py: add host variant
>   package/python-referencing: add host variant
>   package/python-jsonschema-specifications: add host variant
>   package/python-jsonschema: add host variant

Those 5 patches, applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
