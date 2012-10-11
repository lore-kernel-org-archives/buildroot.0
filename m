From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 11 Oct 2012 17:14:38 +0300
Subject: [Buildroot] rpm5
In-Reply-To: <CABtOAfwBcWbZ+xDF72OVSxM=99A9WcihQ-BcoBoMUBiJJQk27A@mail.gmail.com>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
 <CABtOAfx507KKScdea=Ptz-BzhYCh8tBQjL4S5cphs_MWoBxq4g@mail.gmail.com>
 <CABtOAfwBcWbZ+xDF72OVSxM=99A9WcihQ-BcoBoMUBiJJQk27A@mail.gmail.com>
Message-ID: <5076D44E.2060107@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander

According to this
http://sourceforge.net/mailarchive/forum.php?set=custom&viewmonth=&viewday=&forum_name=beecrypt-devel&style=nested&max_rows=25&submit=Change+View

it is missing  "-lgomp"

I checked the beecrypt-4.2.1 and it reveals following:

grep gomp *

acinclude.m4:  AC_SUBST(OPENMP_LIBS,"-lgomp")
configure: OPENMP_LIBS="-lgomp"

So openmp depends on libgomp

Beecrypt has a configure switch --disable-openmp

Maybe you could try adding that switch into BEECRYPT_CONF_OPT in
Buildroot beecrypt.mk file,
rebuild beecrypt and then try rpm again.

Best regards
Stefan




11.10.2012 13:04, Alexander Khryukin kirjoitti:
>
>
> 2012/10/10 Alexander Khryukin <alexander@mezon.ru
> <mailto:alexander@mezon.ru>>
>
>
>
>     2012/10/10 Alexander Khryukin <alexander@mezon.ru
>     <mailto:alexander@mezon.ru>>
>
>
>
>         2012/10/10 Arnout Vandecappelle <arnout@mind.be
>         <mailto:arnout@mind.be>>
>
>             On 08/10/12 13:28, Alexander Khryukin wrote:
>
>                 Full log
>                 http://pastie.org/4932495
>
>
>              It would be more relevant to post
>             /home/fdkit/buildroot/output/build/rpm-5.2.0/config.log
>
>              Also please post the file 'defconfig' which is generated
>             when you do
>             'make savedefconfig'.  This will allow us to try to reproduce.
>
>              Also can you mention which BR version you're using?
>
>              However, before doing any of that, do a 'make clean' and
>             recompile
>             to see if that fixes your problem.
>
>              (It works for me, BTW).
>
>              Regards,
>              Arnout
>             -- 
>             Arnout Vandecappelle                               arnout
>             at mind be
>             Senior Embedded Software Architect                
>             +32-16-286540
>             Essensium/Mind                                    
>             http://www.mind.be
>             G.Geenslaan 9, 3001 Leuven, Belgium                BE 872
>             984 063 RPR Leuven
>             LinkedIn profile:
>             http://www.linkedin.com/in/arnoutvandecappelle
>             GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB
>             2450 2F1F
>
>
>         Hi!
>         Thanks for the response
>
>
>         defconfig http://pastie.org/5029882
>
>         config.log
>
>         http://pastebin.com/L5CLKg06
>
>
>         Every time it fails at
>
>         checking whether to build with BeeCrypt library... no
>         configure: error: mandatory BeeCrypt library not found
>         when it installed
>
>
>
>     Seems problem in
>
>      undefined reference to `GOMP_parallel_end'  on 10296,1 string
>
>
>
> Bump
> Problem still exist
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/617a3600/attachment.html>
