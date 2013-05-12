From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 May 2013 19:15:25 +0200
Subject: [Buildroot] [PATCH 1/5] beaglebone: update to linux 3.8
In-Reply-To: <CAE4k238zVSi9eW5Ctfb9LWCt8r9xYv5cSZ=FfJVg1NT0tjGpoA@mail.gmail.com>
References: <CAE4k2391Ku1Oi+2ACCetmvr5dO8JBygv_hNTM18BchAbdBA3DA@mail.gmail.com>
 <518DE0EF.8060500@mind.be>
 <CAE4k238zVSi9eW5Ctfb9LWCt8r9xYv5cSZ=FfJVg1NT0tjGpoA@mail.gmail.com>
Message-ID: <518FCE2D.9090308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/13 14:41, Anders Darander wrote:
> On 11 May 2013 08:10, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
[snip]
>       No, the new ordering is good - I do prefer to see things in the
>     'make savedefconfig' order.
>
>
> Ok, good to know. Though I decided to keep the old version of those line,
> and  lock the kernel headers. Though, I'd also prefer to keep the
> savedefconfig ordering.
>
> Adding those comments automatically might be a good exercise for a rainy
> day...

  Seems a pretty difficult task - savedefconfig strips everything that is 
default, so how can it know which comments to keep and which to remove?

>
>
>           >undo changes with 'git checkout -p configs/beaglebone_defconfig'.
>           >
>
>           >>   BR2_LINUX_KERNEL=y
>           >>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>           >>
>           >-BR2_LINUX_KERNEL_CUSTOM_GIT___REPO_URL="git://github.com/__koenkooi/linux.git <http://github.com/koenkooi/linux.git> <http://github.com/koenkooi/__linux.git <http://github.com/koenkooi/linux.git>>"
>           >>
>           >-BR2_LINUX_KERNEL_CUSTOM_GIT___VERSION="linux-ti33x-psp-3.2-__r5a+__gitr09e9651bcf2ee8d86685f2a807__5bc6557b1d3b91"
>           >>
>           >+BR2_LINUX_KERNEL_CUSTOM_GIT___REPO_URL="git://git.ti.com/ti-__linux-kernel/ti-linux-kernel.__git <http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git> <http://git.ti.com/ti-linux-__kernel/ti-linux-kernel.git <http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git>>"
>
>           >>
>           >+BR2_LINUX_KERNEL_CUSTOM_GIT___VERSION="__935f6c2f82056d538b528272e2bdbb__5c08d69a58"
>           >
>           >Isn't there a tag you can clone from? That's much faster,
>         because then
>           >we can (usually) do a shallow clone.
>
>         I'm not sure if there's a tag available in this case.
>
>
> Unfortunsately no tags exists...

  How about using the ti2013.04.00 tag? It's based on 3.8.8 instead of 
3.8.11, though.


>         Ok, so tags preferred if they exists... Good to know, I'll check
>         it and
>         change it if there's a tag.
>
>         The list few years I've mainly been working with another build
>         system,
>         where SHA1's are preferred over tags for network-less building.
>
>
>       Do you know if there's a specific reason for that? The
>     'network-less' doesn't make a difference because the tags are always
>     equally available, unless you clone/fetch with --no-tags.
>
>
> Well, I just looked into it, and it seems that they (openmbedded and thus
> Yocto Project) uses `git ls-remote` to resolve the tag name. I'm not
> quite sure of the rationaly for that, though...

  Weird... Anyway, we don't have that issue in buildroot.

  Regards,
  Arnout

>
> Cheers,
> Anders


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
