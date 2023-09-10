Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED648EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92AE9404FE;
	Sun, 10 Sep 2023 21:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92AE9404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhJZFbBjW_lo; Sun, 10 Sep 2023 21:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D22F1404B2;
	Sun, 10 Sep 2023 21:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22F1404B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9206C1BF340
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 777B64092B
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 777B64092B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pwr_j3wbNcyJ for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:32:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B9E040929
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9E040929
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC51A40004;
 Sun, 10 Sep 2023 21:32:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfS2O-00CtXn-MR; Sun, 10 Sep 2023 23:32:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-2-christian@aperture.us>
 <20230806133342.1c5af2d8@windsurf>
Date: Sun, 10 Sep 2023 23:32:12 +0200
In-Reply-To: <20230806133342.1c5af2d8@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 13:33:42 +0200")
Message-ID: <87wmwxemub.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/3] package/python-pylibfdt: add host
 python package
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 26 Jul 2023 13:28:37 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> Signed-off-by: Christian Stewart <christian@aperture.us>
 >> ---
 >> package/python-pylibfdt/python-pylibfdt.mk | 3 +++
 >> 1 file changed, 3 insertions(+)
 >> 
 >> diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
 >> index 5511bd12b3..8850b69b30 100644
 >> --- a/package/python-pylibfdt/python-pylibfdt.mk
 >> +++ b/package/python-pylibfdt/python-pylibfdt.mk
 >> @@ -12,4 +12,7 @@ PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 >> PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 >> PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
 >> 
 >> +HOST_PYTHON_PYLIBFDT_DEPENDENCIES = $(PYTHON_PYLIBFDT_DEPENDENCIES)

 > Changed to:

 > HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig

 > We generally don't do HOST_<pkg>_DEPENDENCIES = <pkg>_DEPENDENCIES in
 > packages.

 > And applied. Thanks!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
