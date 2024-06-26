Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CAAC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 17:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D78081C2F;
	Wed, 26 Jun 2024 17:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLZ8mARaSUTU; Wed, 26 Jun 2024 17:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A70D7813FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A70D7813FE;
	Wed, 26 Jun 2024 17:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B26041BF855
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FFAE80D61
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbUv90snpA8M for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 17:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF8E380D2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8E380D2E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF8E380D2E
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 17:19:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.117.148]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhyc-1s9vNg3oQs-003VJF; Wed, 26
 Jun 2024 19:19:39 +0200
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 19:19:19 +0200
Message-ID: <20240626171922.718270-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:VzdL9Mj9gk3RigvNETM7bgeCF4oG3Bj8KOmZ8ybkOXg1AOVQwDy
 AnVyjvoKw6P1MMCYsn2ul27Cm7sWJdeoB/S9AtdjqrG4rHIqTotGvTDURgcOm15NL/6of6G
 FiCRd1KPNVEb44s2YsML5osoRVR1x01IBa9fD4AHP3p+CMQgEAzmbfW0H5mCwh9MRn9XR40
 fooXs2qR22jz59ww9Ncuw==
UI-OutboundReport: notjunk:1;M01:P0:yOBdojGiKMY=;WUtK8BafVIhftvYQu0hzZT/VkLZ
 SThhko92WfRL9GY3/0aI+Z3xTVOYn9YB2hT9GJiMWeeelsrqw5CaheYndPkm2dbo7rata1EVp
 t88J1MbEkB9v2RXzLdyRb+SHD7yg6Ropk6ubAvxniPV6ZN4mUFmQtfxbqbcpa2ZOVOLm785dA
 hyLnOgkvhbaoOHgH7d6ImccbKyfsF35dlDchZQncI30zNzols/S8fpdB0QPoAMw2udGTVfUxm
 O/vTLGqhGvJOBcpAgQ8fDFfCffVFxFre2ZV/0L/12tLhmfKZ0T/n2SpWR9Vwion8Oe9sMU8iR
 se23vvzEg6eDT5kbRG3FtIDPBHloSkQxzY6wtV72TYv7vFoPED39zKh/2sv2UiWbYww+cBKm2
 wk/fhwQIdlNPmqWOAKJuLt3FmLNNrhMxJkt8kTLGABAVKd1K4HN8/szX1vAVGivFJ0EeU+1Kv
 40GyQKbZzeKhUTLiz+fnuKI57wFVXBL2AZfGYyWi7lypfh90icWgGMc1gRXb+Lil4Y7dfYJ6S
 DrZsMst5SP5Nw/g8APKur6FSzAj/w4owd9MlKgIOQ51AwOVGnAEy6YkRFiM9l9hha0Lw80sXe
 wyjcIumed7XHNembf0L2CuTavESykOKHGGT0bpU/SI/l3GDwhRBZ+ksY8CDBV93IeHgCNkD7X
 pgGP1u4iNoqczAaP6XJCfqJARAkGlu2lQBxZnwOapLmTgKi5t+98ShvMw/rnT/rAXNbu76igO
 2RIBMmlHoYwa7ifAgQXprIBEJ0VQ4KGsNg2qAoO4ehMLnL7V5XeooGeN4CnNvD3n410ARUayI
 mQsQLXf/9uBYiFVti6kmEBdy9Oh2I2l1mNk3cPDFBJCYs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719422379; x=1720027179; i=fiona.klute@gmx.de;
 bh=iNMagQfFu/wf6j4CrzYJbNecRoPGHhIF1PH+0MTE5iA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MBqKYrgDW0pwtFIFC/cxKpi4FqOctPCAf82Ce2GrZmoW/4f0fs1WYQbX4Qy0QInq
 zbN+/DLKt6JjEGBhpyTYPwf2l6Yum5yL8TKChnc4ijj4wvsoHDNiTZIsQPy4xlpZm
 8GzZYRRgFR9UijaTj8CVodfq+ExCGci04duQO/j6GHHvsmVB4/QpmjYwgR8q7hMwZ
 pfy9/VWo2aKJ4dJSdICZDtEfGyGO+H7vWoOQK3CRT12PxzC64zxpRa1bgoMQxfAXp
 pWjau5SqOjYEJKYjDtuRO4pyubXh3eI6lK+WL/QvEd/4gORAPf4YjsAnzfb5kOUFe
 kKcyuBgm81jW8xlemA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=MBqKYrgD
Subject: [Buildroot] [PATCH 0/3] Update fail2ban to 1.1.0, add dependencies
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series (unfortunately still not merged) by Angelo
Compagnucci fixed the fail2ban 1.0.2 build:
https://patchwork.ozlabs.org/project/buildroot/list/?series=403756

However it broke again with Python 3.12 due to incompatibilities in
upstream code. The 1.1.0 release fixes those, unfortunately it still
requires ported asyncore and asynchat modules. This series builds on
Angelo's (must be merged after) and updates fail2ban to 1.1.0 after
adding the required compatibility packages.

Fiona Klute (3):
  package/python-pyasyncore: new package
  package/python-pyasynchat: new package
  package/fail2ban: bump version to 1.1.0

 package/Config.in                                |  2 ++
 package/fail2ban/Config.in                       |  1 +
 package/fail2ban/fail2ban.hash                   |  2 +-
 package/fail2ban/fail2ban.mk                     | 15 ++++++++-------
 package/python-pyasynchat/Config.in              | 11 +++++++++++
 package/python-pyasynchat/python-pyasynchat.hash |  5 +++++
 package/python-pyasynchat/python-pyasynchat.mk   | 15 +++++++++++++++
 package/python-pyasyncore/Config.in              | 10 ++++++++++
 package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
 package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
 10 files changed, 72 insertions(+), 8 deletions(-)
 create mode 100644 package/python-pyasynchat/Config.in
 create mode 100644 package/python-pyasynchat/python-pyasynchat.hash
 create mode 100644 package/python-pyasynchat/python-pyasynchat.mk
 create mode 100644 package/python-pyasyncore/Config.in
 create mode 100644 package/python-pyasyncore/python-pyasyncore.hash
 create mode 100644 package/python-pyasyncore/python-pyasyncore.mk

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
