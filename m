Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E94CEACFB
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED540607F3;
	Tue,  1 Oct 2024 19:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHmy-AP-vg3j; Tue,  1 Oct 2024 19:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62F160893
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62F160893;
	Tue,  1 Oct 2024 19:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD0B1BF28C
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A7DB60889
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 19:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnHinK5jdq_X for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 19:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27D8A60859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D8A60859
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27D8A60859
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 19:59:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 037DC1BF205;
 Tue,  1 Oct 2024 19:59:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1svj2A-006TZy-15;
 Tue, 01 Oct 2024 21:59:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240917182153.3009755-1-bernd@kuhls.net>
 <20240917182153.3009755-2-bernd@kuhls.net>
Date: Tue, 01 Oct 2024 21:59:46 +0200
In-Reply-To: <20240917182153.3009755-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 17 Sep 2024 20:21:53 +0200")
Message-ID: <87bk03h9vx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: security bump version
 to 3.12.6
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes: https://www.python.org/downloads/release/python-3126/
 > Fixes CVE-2023-27043, CVE-2024-6232, CVE-2024-7592 & CVE-2024-8088.

 > The fixes for bundled libexpat are irrelevant for us because python3
 > depends on the buildroot package.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.08.x, thanks.

> ---
 >  package/python3/python3.hash | 6 +++---
 >  package/python3/python3.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/python3/python3.hash b/package/python3/python3.hash
 > index d680a96810..0cd852c325 100644
 > --- a/package/python3/python3.hash
 > +++ b/package/python3/python3.hash
 > @@ -1,5 +1,5 @@
 > -# From https://www.python.org/downloads/release/python-3125/
 > -md5  02c7d269e077f4034963bba6befdc715  Python-3.12.5.tar.xz
 > +# From https://www.python.org/downloads/release/python-3126/
 > +md5  cb669514937d3e894e74081627722aa5  Python-3.12.6.tar.xz
 >  # Locally computed
 > -sha256  fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397  Python-3.12.5.tar.xz
 > +sha256  1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c  Python-3.12.6.tar.xz
 >  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
 > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
 > index b31e6df141..4b328f70fb 100644
 > --- a/package/python3/python3.mk
 > +++ b/package/python3/python3.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  PYTHON3_VERSION_MAJOR = 3.12
 > -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 > +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 >  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 >  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 >  PYTHON3_LICENSE = Python-2.0, others
 > -- 

 > 2.39.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
