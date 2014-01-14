From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Tue, 14 Jan 2014 08:13:51 -0600
Subject: [Buildroot] [PATCH] openssl: fix bug #6770
In-Reply-To: <52D4DDC2.9030904@mind.be>
References: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
 <52D4DDC2.9030904@mind.be>
Message-ID: <OF1D1765AA.083F3C2A-ON86257C60.004DDE03-86257C60.004E2C44@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot-bounces at busybox.net wrote on 01/14/2014 12:48:34 AM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
> buildroot at busybox.net, Peter Korsgaard <jacmet@uclibc.org>
> Date: 01/14/2014 01:49 AM
> Subject: Re: [Buildroot] [PATCH] openssl: fix bug #6770
> Sent by: buildroot-bounces at busybox.net
> 
> On 10/01/14 00:20, Gustavo Zacarias wrote:
> > openssl 1.0.1f Makefile.org doesn't quote $(CC) when passing the
> > parameter in another invocation of make, hence breaking when the
> > compiler string contains a space with multiple strings (for example 
with
> > ccache).
> 
>   It would be nice if the autobuilders would capture this issue. E.g. by 

> enabling ccache 50% of the time (and clearing the cache every time, 
> because we know it doesn't work correctly and because failures would be 
> impossible to reproduce).

Until they can, I'll keep posting bugs from my internal builder that does
verification builds across (arm/PPC/x86) architectures and has ccache 
enabled.
I won't catch all package configurations, but would cover most of the 
commonly
used packages. 

Matt
mlweber1 at rockwellcollins.com

> 
>   Regards,
>   Arnout
> 
> >
> > Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
