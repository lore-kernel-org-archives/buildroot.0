Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D2C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0A1416E2;
	Thu,  3 Nov 2022 21:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0A1416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9YwXJ3BI64j; Thu,  3 Nov 2022 21:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE8B4167E;
	Thu,  3 Nov 2022 21:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE8B4167E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 954321BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669FB41863
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669FB41863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcsBz952Y8f3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:57:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D54864177F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D54864177F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:57:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D899A20002;
 Thu,  3 Nov 2022 20:57:04 +0000 (UTC)
Date: Thu, 3 Nov 2022 21:57:03 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103215703.5e5c9f8e@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667509025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EENqZb/spLnLIHX4MB0vcHJ8TrEIVtDUL/uMQTmah1M=;
 b=JC218H6EkvRLHZIiIgqVeA00baqXdNezaWQJoKaZkyXUwb10XGaDmfoIIqZAmXwJclNy5s
 ZnOyfO0ZwnC25MFnN0JFx0mIPLKNqtt1m8Ds2X5naKX6h0DoqnbaW6U8D0TAt+Ybj6MgSX
 K9ZFrVyX1YskgY+JbT87jtRveEGkCe5+JT5490lwBdLfoQkQfnPY5vMS9L5qL6zbtEKznY
 aPNOf1mFlc+0XtkyYzmy/ocsr8ZZymfofxFS5gre1nq1s14Jr+hIk3yWayqP+7lsMEb2ex
 27/VVaDVmW6PJI+sdiprZctZOSlrhzavbDPK54kdSBvSup83LIfnqu1L7Z1kOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JC218H6E
Subject: [Buildroot] 114 Python updates applied
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

I am not going to reply to every single patch to say that it has been
applied, so here is a single e-mail saying that the following patches
have been applied to the next branch:

James Hilliard (114):
      package/python-aiocoap: bump to version 0.4.4
      package/python-aioprocessing: bump to version 2.0.1
      package/python-alembic: bump to version 1.8.1
      package/python-arrow: bump to version 1.2.3
      package/python-asgiref: bump to version 3.5.2
      package/{avro-c, python-avro}: bump to version 1.11.1
      package/python-bcrypt: bump to version 4.0.1
      package/python-beautifulsoup4: bump to version 4.11.1
      package/python-bluezero: bump to version 0.7.1
      package/python-boto3: bump to version 1.26.0
      package/python-botocore: bump to version 1.29.0
      package/python-channels: bump to version 4.0.0
      package/python-channels-redis: bump to version 4.0.0
      package/python-cheroot: bump to version 8.6.0
      package/python-cherrypy: bump to version 18.8.0
      package/python-colorama: bump to version 0.4.6
      package/python-colorlog: bump to version 6.7.0
      package/python-cryptography: bump to version 38.0.3
      package/python-cssselect: bump to version 1.2.0
      package/python-daphne: bump to version 4.0.0
      package/python-dataproperty: bump to version 0.55.0
      package/python-decorator: bump to version 5.1.1
      package/python-dialog3: bump to version 3.5.3
      package/python-django: bump to version 4.1.3
      package/python-docker: bump to version 6.0.1
      package/python-docutils: bump to version 0.19
      package/python-dominate: bump to version 2.7.0
      package/python-dpkt: bump to version 1.9.8
      package/python-dtschema: bump to version 2022.11
      package/python-ecdsa: bump to version 0.18.0
      package/python-engineio: bump to version 4.3.4
      package/python-entrypoints: bump to version 0.4
      package/python-filelock: bump to version 3.8.0
      package/python-flask: bump to version 2.2.2
      package/python-flask-sqlalchemy: bump to version 3.0.2
      package/python-greenlet: bump to version 2.0.0
      package/python-httplib2: bump to version 0.21.0
      package/python-humanize: bump to version 4.4.0
      package/python-huepy: bump to version 1.2.1
      package/python-ifaddr: bump to version 0.2.0
      package/python-incremental: bump to version 22.10.0
      package/python-ipython: bump to version 8.6.0
      package/python-iso8601: bump to version 1.1.0
      package/python-jaraco-classes: bump to version 3.2.3
      package/python-jaraco-functools: bump to version 3.5.2
      package/python-jmespath: bump to version 1.0.1
      package/python-keyring: bump to version 23.9.3
      package/python-cppy: new package
      package/python-kiwisolver: bump to version 1.4.4
      package/python-lark: bump to version 1.1.4
      package/python-libusb1: bump to version 3.0.0
      package/python-mako: bump to version 1.2.3
      package/python-markdown2: bump to version 2.4.6
      package/python-markupsafe: bump to version 2.1.1
      package/python-mbstrdecoder: bump to version 1.1.1
      package/python-memory-profiler: bump to version 0.60.0
      package/python-mistune: bump to version 2.0.4
      package/python-more-itertools: bump to version 9.0.0
      package/python-orjson: bump to version 3.8.1
      package/python-msgfy: bump to version 0.2.0
      package/python-mutagen: bump to version 1.46.0
      package/python-networkmanager: bump to version 2.2
      package/python-networkx: bump to version 2.8.8
      package/python-oauthlib: bump to version 3.2.2
      package/python-paramiko: bump to version 2.11.0
      package/python-pathpy: bump to version 12.5.0
      package/python-pathvalidate: bump to version 2.5.2
      package/python-pbr: bump to version 5.11.0
      package/python-pip: bump to version 22.3
      package/python-portend: bump to version 3.1.0
      package/python-prompt-toolkit: bump to version 3.0.31
      package/python-psutil: bump to version 5.9.3
      package/python-psycopg2: bump to version 2.9.5
      package/python-pudb: bump to version 2022.1.2
      package/python-py: bump to version 1.11.0
      package/python-pydal: bump to version 20220916.1
      package/python-pydantic: bump to version 1.10.2
      package/python-pyelftools: bump to version 0.29
      package/python-pyftpdlib: bump to version 1.5.7
      package/python-pygments: bump to version 2.13.0
      package/python-pyhamcrest: bump to version 2.0.4
      package/python-pyicu: bump to version 2.10.2
      package/python-pyjwt: bump to version 2.6.0
      package/python-pylibftdi: bump to version 0.20.0
      package/mupdf: bump to version 1.20.3
      package/python-pymupdf: bump to version 1.20.2
      package/python-pyopenssl: bump to version 22.1.0
      package/python-pyrsistent: bump to version 0.19.2
      package/python-pysmb: bump to version 1.2.8
      package/python-pytablereader: bump to version 0.31.3
      package/python-pytablewriter: bump to version 0.64.2
      package/python-pytz: bump to version 2022.6
      package/python-pyudev: bump to version 0.24.0
      package/python-redis: bump to version 4.3.4
      package/python-reentry: bump to version 1.3.3
      package/python-regex: bump to version 2022.10.31
      package/python-requests-oauthlib: bump to version 1.3.1
      package/python-requests-toolbelt: bump to version 0.10.1
      package/python-rpi-gpio: bump to version 0.7.1
      package/python-rsa: bump to version 4.9
      package/python-secretstorage: bump to version 3.3.3
      package/python-semantic-version: bump to version 2.10.0
      package/python-sentry-sdk: bump to version 1.10.1
      package/python-setproctitle: bump to version 1.3.2
      package/python-setuptools-scm-git-archive: bump to version 1.4
      package/python-sh: bump to version 1.14.3
      package/python-simplesqlite: bump to version 1.3.0
      package/python-socketio: bump to version 5.7.2
      package/python-soupsieve: bump to version 2.3.2.post1
      package/python-sqlalchemy: bump to version 1.4.42
      package/python-sqliteschema: bump to version 1.3.0
      package/python-sqlparse: bump to version 0.4.3
      package/python-tempora: bump to version 5.0.2
      package/python-termcolor: bump to version 2.1.0

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
