Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16426C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A486A4188C;
	Mon, 18 Dec 2023 19:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A486A4188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T64mciQUyDli; Mon, 18 Dec 2023 19:52:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D92F640910;
	Mon, 18 Dec 2023 19:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92F640910
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9FD71BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F75660F2B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F75660F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwZmDFe2xZWJ for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:52:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 753F960F28
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753F960F28
Received: by mail.gandi.net (Postfix) with ESMTPSA id E82A8C0003;
 Mon, 18 Dec 2023 19:51:56 +0000 (UTC)
Date: Mon, 18 Dec 2023 20:51:56 +0100
To: Ralf Dragon <hypnotoad@lindra.de>
Message-ID: <20231218205156.619643b1@windsurf>
In-Reply-To: <7f309df0-ae17-419b-8bca-c52d9ec48442@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
 <7f309df0-ae17-419b-8bca-c52d9ec48442@lindra.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702929117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtm2Guh8A1aq9hMDnhynY2TI4UFlzNPyfsRcWmm9bCQ=;
 b=J+giTSkZXGZp3jEqqklIFoim/HB8ruc8NxIKVxTJLpxPpvfHLbBKoKLS0Ffpucej9WMWcv
 m+uiR50k1JRVJ50uJYfbxqtwPDV7jznIhpWY3NjKYGBGFuqkJiFrVzgemRj2oD0PR1STl/
 c+nqongQRJGx/oYCaOs5i/EVYq/zGZ00+Unw9mR9wZF/wwBUeVO5t58fadgW7B5SgmLqHp
 LMFKZEajdcnoM53g22bqekk3bN3x1IvPv7K4DLcYPsFE43kmhQwweIn0QEWKLD02EEYjkV
 SeYumvxRpIskvffgXdXvCtky2LMxW3yVM/2u4pynX1XE3j3V9AZvENBBVzUomw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J+giTSkZ
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ralf,

On Mon, 18 Dec 2023 19:22:14 +0100
Ralf Dragon <hypnotoad@lindra.de> wrote:

> > So it means that python-pyqt5 requires this new python-pyqt5-sip
> > package? How come has python-pyqt5 ever worked?  
> 
> It worked for our community firmware [1] in a buildroot release from 1-2 
> years ago. When we switched to the 2023 release, we had problems, but I 
> could not imagine that it was a problem for everyone. I think that 5.11 
> changed the location of the sip module to PyQt5.sip [2] and required 
> building that in a new module (the build instructions [3] do not say 
> since which release that was needed):
> 
> [1] https://cfw.ftcommunity.de/ftcommunity-TXT/en
> [2] 
> https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
> [3] 
> https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-the-sip-module

Thanks for the additional research. However, we need a bit better than
"I think". Indeed, we need to understand for sure since when things got
broken, so that we understand how this fix should be backported.

> > But, but, according to what you described above, it seems like
> > python-pyqt5 needs python-pyqt5-sip, but here you have a
> > python-pyqt5-sip -> python-pyqt5 dependency.
> > So with your patch applied, it's still possible to enable only
> > python-pyqt5, so we would still have the failure you're mentioning in
> > your commit log.
> >
> > Could you clarify?  
> 
> Both can be compiled independently (when I wrote the patch, I assumed 
> that PyQt5.sip can only be compiled when PyQt5 is available, but it 
> really seems only to depend on the sip library). During runtime, PyQt5 
> does not work without PyQt5.sip, but it seems that PyQt5.sip can be used 
> without PyQt5. That is also how it is modeled in Debian 12.
> 
> So correctly it would be: python-pyqt5 needs python-pyqt5-sip during 
> runtime. I would model that with "select", not "depends on", or?

python-pyqt5 should then "select BR2_PACKAGE_PYTHON_PYQT5_SIP" with a
"# runtime" comment, but it should not have python-pyqt5-sip in its
<pkg>_DEPENDENCIES.

> > Also, it would very, very good to add a runtime test case in
> > support/testing/ for this, as such Python issues are only visible at
> > runtime. I have added Julien Olivain in Cc, who can probably help with
> > this, as he is our resident expert in writing support/testing tests :-)  
> 
> Just python3 -c "import PyQt5" would probably be enough to reproduce 
> this error.

This would already be a good test case indeed.

> I will push another patch with the dependency clarified and the other 
> comments.
> 
> Is it possible that both patches get integrated into the 2023 lts branch?

Yes, if we understand when things got broken exactly, as discussed
above.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
