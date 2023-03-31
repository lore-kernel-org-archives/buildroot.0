Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B20CC6FD18
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA26942231;
	Fri, 31 Mar 2023 10:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA26942231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAAd9qsYpQne; Fri, 31 Mar 2023 10:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE2B4222B;
	Fri, 31 Mar 2023 10:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE2B4222B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5203C1BF82C
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 10:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344704222B
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 10:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344704222B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xu3JH871oZez for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 10:24:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8D04222A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A8D04222A
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 10:24:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 351361BF20E;
 Fri, 31 Mar 2023 10:24:09 +0000 (UTC)
Date: Fri, 31 Mar 2023 12:24:08 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20230331122408.211f7639@windsurf>
In-Reply-To: <CA+h8R2ppxhXNkWSO9qWar2d21Xg7cWzZ8nJR82PyBF4=5+bpfQ@mail.gmail.com>
References: <20230215073256.186476-1-christian@paral.in>
 <20230312225806.0bf4b0fd@windsurf>
 <CA+h8R2ppxhXNkWSO9qWar2d21Xg7cWzZ8nJR82PyBF4=5+bpfQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680258249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSDfVcmrPeCbMI3hYpsq2eA4rXHGZegt6k4ZSk0D+ZY=;
 b=oRorXeQQKuJ8ftDTNuREZTqJYz+GcLjt39huXKmAhgrn6CX83yAjlla35v8GRldtjhkJdQ
 OLE5tuj4lqQyvGhyfSEYaxpkjGQyjD39KAzYkTAO13yFliX20qdtOV2zX9KDEb7uxarKMs
 52VkXfI/dcLnXlSE6bFTbF5PkiaW/1G7z2Pi9JBMoR7UzxySo6SOSgcuhNbxSXTcWx78AT
 4Zc+BHbmGVAvRbQACNOc8kYJMoNVKRc8g6Ab3jujuICZOc/Hul5JpCEMZVroPl71wjEyqt
 sU7Cu5eN5ADFRefxyKp0KXstqo8wVVYq9R8BaP5obhs3ribN3zCcMDi76w1j9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oRorXeQQ
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Mar 2023 19:45:04 -0700
Christian Stewart <christian@paral.in> wrote:

> > This doesn't make much sense. Why would the toolchain package be needed
> > for HOSTCC_NOCCACHE ? We have several packages that use HOSTCC_NOCCACHE
> > before the toolchain is ready.  
> 
> I suppose HOSTCC_NOCCACHE uses the gcc installed outside of buildroot,
> so it should be fine to remove this dependency.

Yes, the native toolchain must always be provided by the system, it is
not provided by Buildroot. The "toolchain" package only provides the
cross-compilation toolchain, it does nothing about the native toolchain.

> > > +     # Set all file timestamps to prevent the go compiler from rebuilding any
> > > +     # built in packages when programs are built.
> > > +     find $(HOST_GO_BOOTSTRAP_STAGE2_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;  
> >
> > So we have to do this for bootstrap-stage2 but not bootstrap-stage1 ?  
> 
> It's not strictly necessary for either one. I removed it for the next
> revision of the patch.

But your comment above seemed to indicate that it was necessary.

> > > -     depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
> > > +     depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
> > > +     # See https://go.dev/doc/install/source#environment
> > > +     # See src/go/build/syslist.go for the list of supported architectures  
> >
> > This comment looks good, but is unrelated. Separate patch?  
> 
> Is it really necessary to put in a separate patch? It's a minor comment change.
> 
> Feels appropriate to bundle it here with other related changes.

Well, it always makes the review a bit more complicated, as we wonder
why it's there. If you really want to bundle unrelated changes like
this, they should at least be mentioned in the commit log so that the
reviewer knows what's going on.


> > > -# The go build system is not compatible with ccache, so use
> > > -# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> > > +# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.
> > > +# See https://github.com/golang/go/issues/11685.  
> >
> > Why is this comment being changed, with a typo added?  
> 
> Fixed the typo. The comment is being changed because it can fit on a
> single line in 75 characters.
> 
> It just looks cleaner.
> 
> I can revert this if necessary.

Same as above: it's creating some unrelated "noise" in the patch, which
makes things odd when doing a review.

> 
> > >  HOST_GO_MAKE_ENV = \
> > >       GO111MODULE=off \
> > >       GOCACHE=$(HOST_GO_HOST_CACHE) \
> > > -     GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
> > > +     GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
> > >       GOROOT_FINAL=$(HOST_GO_ROOT) \
> > >       GOROOT="$(@D)" \
> > >       GOBIN="$(@D)/bin" \
> > > @@ -154,7 +154,6 @@ define HOST_GO_INSTALL_CMDS
> > >       cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
> > >       cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
> > >
> > > -     # There is a known issue which requires the go sources to be installed  
> >
> > Why is this comment being removed?  
> 
> It's not an issue, per se. The nature of the Go compiler is that it
> needs the sources to work.
> That bug report has been closed for years now and is actually
> unrelated to needing sources anyway.

So perhaps rephrase to explain "Yes the Go compiler needs the sources
to work", rather than just dropping the comment? But here again, it's
unrelated to the patch we're discussing so => separate patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
