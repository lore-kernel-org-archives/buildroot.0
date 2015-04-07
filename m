From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 00:04:41 +0200
Subject: [Buildroot] [PATCH 6/6 v3] support/download: restore mandatory
 check of hashes
In-Reply-To: <5522F51E.2080700@mind.be>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <21c6a4cd9d79b9279ba50426a2d0baaa1bc3f0b0.1428322317.git.yann.morin.1998@free.fr>
 <5522F51E.2080700@mind.be>
Message-ID: <20150407220441.GV4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-06 23:05 +0200, Arnout Vandecappelle spake thusly:
> On 06/04/15 14:13, Yann E. MORIN wrote:
> > Now that custom external toolchains to be downloaded proprely instruct
> > to not fail on a missing hash, restore the mandatory hash check for
> > everything else.
> 
>  There are also a couple of uclibc versions without hash.

Then they should be added (unless they are git snapshots or the
likes...) ;-)

I'll see which are missing and add them; thanks for noticing.

Regards,
Yann E. MORIN.

>  Otherwise looks good :-)
> 
>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  support/download/check-hash | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/support/download/check-hash b/support/download/check-hash
> > index a091c61..96d12a5 100755
> > --- a/support/download/check-hash
> > +++ b/support/download/check-hash
> > @@ -104,5 +104,5 @@ if [ ${nb_checks} -eq 0 ]; then
> >          exit 0
> >      fi
> >      printf "ERROR: No hash found for %s\n" "${base}" >&2
> > -    exit 0
> > +    exit 3
> >  fi
> > 
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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
