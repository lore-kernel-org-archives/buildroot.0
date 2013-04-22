From: Richard Cagley <rcagley@toyon.com>
Date: Mon, 22 Apr 2013 09:12:43 -0700
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <5171D9E4.7090904@mind.be>
References: <BA6FC03EA0815D428FB8A3C279ED4992072B8ECF@mx.toyon.corp>
 <5171D9E4.7090904@mind.be>
Message-ID: <BA6FC03EA0815D428FB8A3C279ED4992072B900D@mx.toyon.corp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,
This is the information I needed. Sounds like I need to find a patched
kernel tarball.
-rich

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Friday, April 19, 2013 4:57 PM
> To: Richard Cagley
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] linux/videodev.h missing
> 
> On 19/04/13 23:47, Richard Cagley wrote:
> > Anyone else seen this error out of the current github trunk?
> > mxc_ipu_hl_lib.c:44:28: fatal error: linux/videodev.h: No such file
or
> > directory compilation terminated.
> 
>   See the help text of imx-lib:
> 
> "It requires a kernel that includes the i.MX specific headers to be
built."
> 
>   In this particular case it's the old Freescale kernel that still has
the ancient
> videodev.h header (it died in v2.6.38). Basically, Freescale assumes
> everybody wants to use Freescale's own stuff.
> 
>   Regards,
>   Arnout
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
