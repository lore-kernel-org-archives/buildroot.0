From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Dec 2016 09:17:50 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: try to fix unreproducible
	errors
In-Reply-To: <20161214000233.7a18fe6a@free-electrons.com>
References: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
 <20161213223739.7735f291@free-electrons.com>
 <CAPi7W83Jr9Cj9qZ=RqAwDjbcjPKQa-ioodc_Mf2zH1HXx=oV9A@mail.gmail.com>
 <20161214000233.7a18fe6a@free-electrons.com>
Message-ID: <CAPi7W83mnepjSMBh_4PchV-Zi1fSmjHMeo6ib1jiPm=vgYn_eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2016-12-14 0:02 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 13 Dec 2016 23:46:31 +0100, Fabrice Fontaine wrote:
>
> > You're right, for the moment, there is only one error on v0.4 but there
> > was 5 on v0.3.2: http://autobuild.buildroot.net/?reason=tinycbor-v0.3.2.
> On
> > these 5 errors, at least 2 of them are related to the same issue that we
> > have on 0.4 as the same error arises:  .config:7: *** missing separator.
> > Stop.
>
> Ah, OK.
>
> > I really think that there is something broken with the Makefile.configure
> > but as I can not reproduce the problem, it is hard to investigate. An
> other
> > possibility would be that the .config that is generated through Makefile
> is
> > interpreted before the file is completely filled. In this case, perhaps
> we
> > should define a TINYCBOR_CONFIGURE_CMDS to create this file before
> > building. Any advise is welcome :-)
>
> I've tried to reproduce
> http://autobuild.buildroot.net/results/8e8/8e8fd1e19d6d07212f29e19a305712
> e715fe781b//
> on gcc20 where the error occurred, just to rule out any build machine
> specific issue. Building just cjson+tinycbor worked fine.
>
> I've done restarted the full configuration of build
> 8e8fd1e19d6d07212f29e19a305712e715fe781b, to see if it helps
> reproducing the build failure or not. If it doesn't, then we clearly
> have a parallel build issue.
>
> I'll keep you informed of the result (if I don't forget). Ping me if
> you don't have news tomorrow evening :)
>
> I ping you ;-)

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161215/01690c92/attachment.html>
