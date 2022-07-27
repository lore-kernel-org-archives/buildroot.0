Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3D5C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB4880BF4;
	Wed, 27 Jul 2022 07:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB4880BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cH9ejCRpHsLT; Wed, 27 Jul 2022 07:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA30E80BD4;
	Wed, 27 Jul 2022 07:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA30E80BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 080F61BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E240F40942
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E240F40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VO2idjAY59BN for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:08:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7F2540940
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7F2540940
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 243291814B9; Wed, 27 Jul 2022 09:08:37 +0200 (CEST)
In-Reply-To: <0df51f09ec27a5e7a454d6d71f53ecbf@free.fr>
Date: Wed, 27 Jul 2022 09:08:36 +0200
To: "Julien Olivain" <ju.o@free.fr>
MIME-Version: 1.0
Message-ID: <47-62e0e480-7-17522000@30879654>
User-Agent: SOGoMail 5.7.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1658905723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=15qtMKMMP0JDVOrNO1gPWYhjBIj3maUEZkMoeWBZY+c=;
 b=MH7Y6LeO/zhBad+eQans6hN6wSULuQ+EYE69U9afUsSsPYXiRsiYoftv+JnIJ7g3u0zo0J
 UX31w3qy9H6Ge82xgS53qRClykdfacO3jMNYdQ1P9UbvzuOtTZMYcAC+rYVj0Vc+S2xW+n
 Yqwq1pR86TSlha857lXiTl7Td/b/d2g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=MH7Y6LeO
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/=7Bpython-=7Dprotobuf?=
 =?utf-8?q?=3A_bump_to_version_21=2E3?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Monday, July 25, 2022 23:22 CEST, Julien Olivain <ju.o@free.fr> wrote:

> 
>    Hi Michael, All,
> 
> I successfully runtime-tested this patch in qemu_aarch64_virt_defconfig 
> with
> ola client commands and Python3 RDM discovery.  I'll try to make a 
> runtime
> test for this.
> 
> On 21/07/2022 12:47, Michael Nosthoff via buildroot wrote:
> > protobuf changed its versioning scheme [1]. The Release version is now 
> > only
> > the Minor.Patch version of the language specific version.
> > 
> > C++ stays on version 3, but python got bumped to 4. So the handling in 
> > the .mk
> > files changed to reflect that.
> > 
> > [1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Tested-by: Julien Olivain <ju.o@free.fr>

great, thank you.
I'll add your tag to the v2.

Regards,
Michael

> 
> > ---
> >  package/protobuf/protobuf.hash               | 2 +-
> >  package/protobuf/protobuf.mk                 | 6 ++++--
> >  package/python-protobuf/python-protobuf.hash | 2 +-
> >  package/python-protobuf/python-protobuf.mk   | 3 ++-
> >  4 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/protobuf/protobuf.hash 
> > b/package/protobuf/protobuf.hash
> > index f37b2dee40..1006fd3d64 100644
> > --- a/package/protobuf/protobuf.hash
> > +++ b/package/protobuf/protobuf.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> >  sha256
> > 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d
> > LICENSE
> > -sha256
> > dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9
> > protobuf-cpp-3.20.1.tar.gz
> > +sha256
> > c98a4f17ed57e9e4dafc4a52e76ee012f9a6a13750488b20b4c370a3eb1561fc
> > protobuf-cpp-3.21.3.tar.gz
> > diff --git a/package/protobuf/protobuf.mk 
> > b/package/protobuf/protobuf.mk
> > index c4c33ba7da..5c08421bbc 100644
> > --- a/package/protobuf/protobuf.mk
> > +++ b/package/protobuf/protobuf.mk
> > @@ -7,9 +7,11 @@
> >  # When bumping this package, make sure to also verify if the
> >  # python-protobuf package still works and to update its hash,
> >  # as they share the same version/site variables.
> > -PROTOBUF_VERSION = 3.20.1
> > +PROTOBUF_VERSION_MAJOR = 3
> > +PROTOBUF_VERSION_MINOR = 21.3
> > +PROTOBUF_VERSION = ${PROTOBUF_VERSION_MAJOR}.${PROTOBUF_VERSION_MINOR}
> >  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> > -PROTOBUF_SITE =
> > https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
> > +PROTOBUF_SITE =
> > https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
> >  PROTOBUF_LICENSE = BSD-3-Clause
> >  PROTOBUF_LICENSE_FILES = LICENSE
> >  PROTOBUF_CPE_ID_VENDOR = google
> > diff --git a/package/python-protobuf/python-protobuf.hash
> > b/package/python-protobuf/python-protobuf.hash
> > index ddfa48b491..06ec32c5b5 100644
> > --- a/package/python-protobuf/python-protobuf.hash
> > +++ b/package/python-protobuf/python-protobuf.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> > d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8
> > protobuf-python-3.20.1.tar.gz
> > +sha256
> > ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2
> > protobuf-python-4.21.3.tar.gz
> >  sha256
> > 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d
> > LICENSE
> > diff --git a/package/python-protobuf/python-protobuf.mk
> > b/package/python-protobuf/python-protobuf.mk
> > index b91ba49339..8c21779faf 100644
> > --- a/package/python-protobuf/python-protobuf.mk
> > +++ b/package/python-protobuf/python-protobuf.mk
> > @@ -4,7 +4,8 @@
> >  #
> > 
> > ################################################################################
> > 
> > -PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> > +PYTHON_PROTOBUF_VERSION_MAJOR = 4
> > +PYTHON_PROTOBUF_VERSION =
> > $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
> >  PYTHON_PROTOBUF_SOURCE = 
> > protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
> >  PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
> >  PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
> > --
> > 2.25.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Best regards,
> 
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
