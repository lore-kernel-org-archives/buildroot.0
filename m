From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Nov 2013 23:28:37 +0100
Subject: [Buildroot] Buildroot and Git repository (u-boot + kernel)
In-Reply-To: <CAAs3wMiTfo8tiLmgCGH9G_fz+zvmAO6YdhvgVpVm28gaOHtBjg@mail.gmail.com>
References: <CAAs3wMgyCOV_oeTjL0GFTAux9tPsZXeEifTgACSqKcPQSN=ABg@mail.gmail.com>
 <20131120135421.0602e149@skate>
 <CAAs3wMiTfo8tiLmgCGH9G_fz+zvmAO6YdhvgVpVm28gaOHtBjg@mail.gmail.com>
Message-ID: <528D3795.1050601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/13 17:47, Freedreamer wrote:
>
> Hi Thomas,
>
> thanks for reply. here in the attachement the config file.Buildroot is
> the last one on git (pulled yesterday)
>
> Regards
>
> Marco
>
>
> 2013/11/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>>
>
>     Dear Freedreamer,
>
>     On Wed, 20 Nov 2013 13:49:03 +0100, Freedreamer wrote:
>
>      > I'm Marco from Italy and that's the first Time I write here . I've
>      > been trying to integrate in buildroot my custom u-boot and kernel I
>      > have on my gitlab. In u-boot repository version I set up  my branch
>      > name but br seems downloading always the master version from git.
>      > Anyone can help me ? Same situation with the kernel.

  What you have configured _should_ work. What buildroot does is:

- clone the repository (shallow clone if possible);

- export a tarball of the requested tag/branch;

- delete the repository again.

  Please note that once the tarball exists in the download directory 
(./dl by default) it will not be downloaded again - you have to do a 
'make linux-dirclean' *and* remove the tarball in order to re-download it.

  Can you remove the tarball from the download directory, run 'make 
linux-source' and post the output?

  Regards,
  Arnout

>
>     Can you post your .config and tell us which Buildroot version you're
>     using?
>
>     Thanks,
>
>     Thomas
>     --
>     Thomas Petazzoni, CTO, Free Electrons
>     Embedded Linux, Kernel and Android engineering
>     http://free-electrons.com
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
