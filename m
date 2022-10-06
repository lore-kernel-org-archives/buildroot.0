Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A7C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE9E83F55;
	Thu,  6 Oct 2022 20:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE9E83F55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKw4l5qO1VOy; Thu,  6 Oct 2022 20:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B27383F44;
	Thu,  6 Oct 2022 20:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B27383F44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3D5A1BF310
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB29583F44
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB29583F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqBZHiVB1_x9 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:13:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE2E83FA2
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE2E83FA2
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:13:05 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 296KD2pb027729
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Oct 2022 22:13:02 +0200
Date: Thu, 6 Oct 2022 22:13:40 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221006221340.45c07636@x230_1.trabucayre.com>
In-Reply-To: <20221006215057.49eec773@windsurf>
References: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
 <20221006215057.49eec773@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v4] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
On Thu, 6 Oct 2022 21:50:57 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Thu,  6 Oct 2022 10:27:57 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > - Since gnuradio 3.10 swig was replaced by pybind. Now python libraries,
> >   bindings and python wrappers are produces using pybind: this why
> > python-pybind is a buildtime dependency. This one is a stagging only
> > package (nothing installed into target directory -> no select
> > BR2_PACKAGE_PYTHON_PYBIND added to Config.in but GNURADIO_DEPENDENCIES is
> > updated with python-pybind).  
> 
> I am sorry, but this still doesn't make any sense, and will in fact
> cause build failures. A package cannot have a target package in its
> <pkg>_DEPENDENCIES variable without selecting it.
> 
> If python-pybind is needed at build time on the host, then
> GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
> needs to be done in Config.in.
> 
> If python-pybind is needed on the target, then two options:
> 
>  (1) It's needed only at runtime => it should be selected in Config.in.
> 
>  (2) It's needed at build-time => it should be selected in Config.in
>  *and* and added as a dependency in GNURADIO_DEPENDENCIES. However, I'd
>  like to see a serious justification, because it is really uncommon to
>  have target Python packages be build-time dependencies.
> 
I'm totally agree: gnuradio needs host-python-pybind.
In fact pybind package is not really clear to me:
- there is no host-python-pybind
- python-pybind is used to populate staging (PYTHON_PYBIND_INSTALL_STAGING =
  YES) but nothing is installed into target (PYTHON_PYBIND_INSTALL_TARGET = NO)

If I remember well (but unable to find thread) one of previous bump has
required a long discussion with as result this status: maybe guillaume (in CC)
could help to clarify situation.
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
Regards,

Gwenhael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
