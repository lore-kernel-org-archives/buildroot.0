Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC88FECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A4AE40949;
	Fri, 23 Sep 2022 12:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A4AE40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgvNz_Dk82rj; Fri, 23 Sep 2022 12:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B8BD405A9;
	Fri, 23 Sep 2022 12:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8BD405A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7D21BF349
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578D6405A9
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 578D6405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5s-JyQxbArAa for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:42:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 366F34011C
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 366F34011C
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:42:00 +0000 (UTC)
Received: from x230_1.trabucayre.com ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 28NCfvxv007819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:41:58 +0200
Date: Fri, 23 Sep 2022 14:42:26 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220923144226.144975f3@x230_1.trabucayre.com>
In-Reply-To: <20220923110159.558e373f@windsurf>
References: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
 <20220917175705.325903a1@windsurf>
 <20220923104005.30fed5a3@x230_1.trabucayre.com>
 <20220923110159.558e373f@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: bump version to
 3.10.3.0
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

Hello,

On Fri, 23 Sep 2022 11:01:59 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 23 Sep 2022 10:40:05 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > > > +	select BR2_PACKAGE_PYTHON_NUMPY      
> > > 
> > > Why are you removing the "# runtime" comment here? Your patch doesn't
> > > change numpy to a build time dependency.
> > >     
> > Your review of v1 has highliteted the fact numpy is required at runtime (of
> > course) but also at the buildtime (cmake checks for dependencies and stop
> > when a requirement isn't satisfied). This why I have removed this comment.  
> 
> But how come target numpy is needed at *build* time ? Isn't this just a
> silly check that makes sense in native build situation, but not in
> cross-compilation situation ?
>
I have read some piece of code to check: with gnuradio 3.10 swig was replaced
by pybind and some cpp bindings uses numpy functions. So it seems numpy is
really required at buildtime, and not only to check dependencies for a native
build
> 
> > > >  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> > > > -GNURADIO_DEPENDENCIES += python3
> > > > +GNURADIO_DEPENDENCIES += python3 python-pybind \
> > > > +	host-python-numpy host-python-packaging      
> > > 
> > > Could you clarify if you need python-pybind on the target or on the
> > > host? And also explain in the commit log why host-python-numpy and
> > > host-python-packaging are now needed?    
> > True. I will do that. And bump to the 3.10.4.0 version at the same time.  
> 
> Thanks! Make sure to be very clear on the explanations of which
> dependency is needed on the host vs. on the target, and which is needed
> at build time vs. run time.
> 
I will try :)
> Thanks a lot!
> 
> Thomas

Regards
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
