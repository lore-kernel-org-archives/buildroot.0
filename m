Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD54C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0CD61142;
	Sun, 24 Jul 2022 10:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC0CD61142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1ltzV1k8aMy; Sun, 24 Jul 2022 10:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35D160B66;
	Sun, 24 Jul 2022 10:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35D160B66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB8B1BF85D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F61607AA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77F61607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVup_YjyNk7s for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:18:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4C16002E
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B4C16002E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id CD94A1814B9; Sun, 24 Jul 2022 12:17:59 +0200 (CEST)
In-Reply-To: <992ad3df-d4ea-9134-bcc4-2c0274ea3ee6@mind.be>
Date: Sun, 24 Jul 2022 12:17:59 +0200
To: "Arnout Vandecappelle" <arnout@mind.be>, "Julien Olivain" <ju.o@free.fr>
MIME-Version: 1.0
Message-ID: <4d-62dd1c80-3-19436700@106240584>
User-Agent: SOGoMail 5.7.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1658657894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=72GGsvqF+8G4czq0ismLB+jiRT3qjma3vUNW1/Kv7QQ=;
 b=dWM3Jo3VolE0FMdTMd/gGnKP7PRssxyKJ28xjo+Lx9eSRV/dcCGKwk1B7CBHBfDY4DNMw7
 HMTHyL7yYyx5VeCDyqGhWfAu9NHfLWiafYP/KvkaG8r51rjyLa8vY5M29+vJ+A7zF4dBt/
 h1cXE0Tc9B/I/LphzPFKBGuJfBLP00w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=dWM3Jo3V
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

Hi Arnoud,
hi Julien,

(julien, i added you as the ola maintainer as this patch might break it)

On Saturday, July 23, 2022 00:33 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 21/07/2022 12:47, Michael Nosthoff via buildroot wrote:
> > protobuf changed its versioning scheme [1]. The Release version is now only
> > the Minor.Patch version of the language specific version.
> > 
> > C++ stays on version 3, but python got bumped to 4. So the handling in the .mk
> > files changed to reflect that.
> 
>   I think that the crazy stuff that was done upstream warrants a bit more 
> consideration on our side...
> 
>   They are basically trying to encode two separate things in the version number:
> 
> - the version of protobuf itself (i.e. the protocol definition) - this is 21.3;
> 
> - the version of the language-specific API - this is 3 for all languages, except 
> for python where it was bumped to 4 because it has breaking changes in the 21.0 
> release.
> 
>   First remark: due to this breaking change, I expect that an update of ola (our 
> only in-tree consumer of python-protobuf) may be needed as well.

The "breaking changes" according to 
https://developers.google.com/protocol-buffers/docs/news/2022-05-06#python-updates
don't actually sound "too breaking" to me.

I tried compiling ola with the bumped version. But it is beyond my knowledge how to test this.
@Julien could you check if this version bump of python-protobuf affects ola?

> 
>   The version of the language-specific API is basically just there to to 
> indicate breaking changes. In the context of Buildroot, I think it's the protoc 
> version which is more relevant.
> 
>   Then there's release-monitoring. For protobuf, it says 21.3. For 
> python-protobuf, we have a mapping to the same protobuf package [1].
> 
I'm not quite sure what you mean here. should we got with
PYTHON_PROTOBUF_VERSION = 4.x.x or do the same as with the cpp version and
just add -4. to the SOURCE?
Where do I see the release-monitoring mapping?
 
> 
> 
> > 
> > [1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ---
> >   package/protobuf/protobuf.hash               | 2 +-
> >   package/protobuf/protobuf.mk                 | 6 ++++--
> >   package/python-protobuf/python-protobuf.hash | 2 +-
> >   package/python-protobuf/python-protobuf.mk   | 3 ++-
> >   4 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> > index f37b2dee40..1006fd3d64 100644
> > --- a/package/protobuf/protobuf.hash
> > +++ b/package/protobuf/protobuf.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> >   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> > -sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
> > +sha256  c98a4f17ed57e9e4dafc4a52e76ee012f9a6a13750488b20b4c370a3eb1561fc  protobuf-cpp-3.21.3.tar.gz
> > diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> > index c4c33ba7da..5c08421bbc 100644
> > --- a/package/protobuf/protobuf.mk
> > +++ b/package/protobuf/protobuf.mk
> > @@ -7,9 +7,11 @@
> >   # When bumping this package, make sure to also verify if the
> >   # python-protobuf package still works and to update its hash,
> >   # as they share the same version/site variables.
> > -PROTOBUF_VERSION = 3.20.1
> 
> > +PROTOBUF_VERSION_MAJOR = 3
> > +PROTOBUF_VERSION_MINOR = 21.3
> > +PROTOBUF_VERSION = ${PROTOBUF_VERSION_MAJOR}.${PROTOBUF_VERSION_MINOR}
> 
>   So I think we should set PROTOBUF_VERSION = 21.3.
> 
> 
> >   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> 
>   And change this into
> PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
> 
>   Note that I don't think it's useful to create a separate variable for the 3. 
> part. This is the only place where it is going to be used, and even if it would 
> be the same for python-protobuf, it's better to have it explicit in each binding 
> instead of in a shared variable.

I'll send a v2 doing that.

> 
>   Regards,
>   Arnout
> 
> [1] https://release-monitoring.org/project/3715/
> 
> > -PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
> > +PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
> >   PROTOBUF_LICENSE = BSD-3-Clause
> >   PROTOBUF_LICENSE_FILES = LICENSE
> >   PROTOBUF_CPE_ID_VENDOR = google
> > diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> > index ddfa48b491..06ec32c5b5 100644
> > --- a/package/python-protobuf/python-protobuf.hash
> > +++ b/package/python-protobuf/python-protobuf.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> > -sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
> > +sha256  ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2  protobuf-python-4.21.3.tar.gz
> >   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> > diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> > index b91ba49339..8c21779faf 100644
> > --- a/package/python-protobuf/python-protobuf.mk
> > +++ b/package/python-protobuf/python-protobuf.mk
> > @@ -4,7 +4,8 @@
> >   #
> >   ################################################################################
> >   
> > -PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> > +PYTHON_PROTOBUF_VERSION_MAJOR = 4
> > +PYTHON_PROTOBUF_VERSION = $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
> >   PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
> >   PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
> >   PYTHON_PROTOBUF_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
