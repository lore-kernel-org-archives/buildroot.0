Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461CEC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 10:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1124843F3;
	Sun,  2 Jun 2024 10:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SImznbxShH9B; Sun,  2 Jun 2024 10:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E968440C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E968440C;
	Sun,  2 Jun 2024 10:26:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70AB81BF370
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 10:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A55E60A37
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 10:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWh05_4krdUZ for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 10:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2F25608D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2F25608D2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2F25608D2
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 10:26:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6AF140004;
 Sun,  2 Jun 2024 10:26:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sDiPg-000KFm-0E;
 Sun, 02 Jun 2024 12:26:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda>
Date: Sun, 02 Jun 2024 12:26:07 +0200
In-Reply-To: <Zlw0x-GMNwen_N31@landeda> (Yann E. MORIN's message of "Sun, 2
 Jun 2024 11:00:55 +0200")
Message-ID: <87a5k3ljy8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >     $ make docker-compose-source
 >     [...]
 >     go: downloading dario.cat/mergo v1.0.0
 >     [...]
 >     go: downloading github.com/imdario/mergo v0.3.16
 >     [...]
 >     go: github.com/docker/compose/v2/cmd/compose imports
 >             github.com/docker/cli/cli/command/container imports
 >             github.com/docker/cli/cli/compose/loader imports
 >             dario.cat/mergo: unrecognized import path "dario.cat/mergo": https fetch: Get "https://dario.cat/mergo?go-get=1": dial tcp: lookup dario.cat on 127.0.0.53:53: server misbehaving

 > As I understand it, dario.cat is a "vanity URL" [0] so it should not be
 > resolved by the resolver, but by go-pkg, but apparently that did not
 > happen for me...

I believe the domain simply expired:

Registry Expiry Date: 2024-06-01T07:05:04.361

I reported it upstream to their issue tracker:

https://github.com/darccio/mergo/issues/252

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
