Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42581C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE41441561;
	Tue, 26 Jul 2022 18:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE41441561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1mSD2RoAsna; Tue, 26 Jul 2022 18:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8854092C;
	Tue, 26 Jul 2022 18:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8854092C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BABCE1BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A340181447
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A340181447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tvk2gwcY3gwk for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:56:25 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C188143C
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64C188143C
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:56:25 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 26QIpJ2O016732
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 20:51:19 +0200
Date: Tue, 26 Jul 2022 20:51:10 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220726205110.6ecdee70@x230_1.trabucayre.com>
In-Reply-To: <20220726204125.014eb8a2@windsurf>
References: <20220208162409.496110-1-gwenj@trabucayre.com>
 <20220726204125.014eb8a2@windsurf>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH 1/2] package/volk: new package
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 20:41:25 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue,  8 Feb 2022 17:24:08 +0100
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > VOLK is the Vector-Optimized Library of Kernels
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---
> >  DEVELOPERS             |  1 +
> >  package/Config.in      |  1 +
> >  package/volk/Config.in | 31 +++++++++++++++++++++++++++++++
> >  package/volk/volk.hash |  3 +++
> >  package/volk/volk.mk   | 39 +++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 75 insertions(+)
> >  create mode 100644 package/volk/Config.in
> >  create mode 100644 package/volk/volk.hash
> >  create mode 100644 package/volk/volk.mk  
> 
> I've updated to version 2.5.1, switched to the .tar.xz tarball, added
> COPYING-LGPL as a license file, added a missing
> BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS dependency, and
> applied.
> 
> Thanks a lot!
> 
> Thomas

Thanks to all!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
