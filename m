From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jul 2011 10:37:08 +0200
Subject: [Buildroot] Buildroot ext3 filesystem
In-Reply-To: <CAEYzJUFAEuYQJ_Q+tsBZR7hf2t27-M7k=FCAN-SeWBAvDD5etQ@mail.gmail.com>
References: <CADfuMF6LHMTTVunskwU3hxcFgqa3nWi=V3rLUs1CSWcd9hdqhQ@mail.gmail.com>
 <CAEYzJUFAEuYQJ_Q+tsBZR7hf2t27-M7k=FCAN-SeWBAvDD5etQ@mail.gmail.com>
Message-ID: <201107211037.09095.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 15 July 2011 11:20:59, Bj?rn Forsman wrote:
> It is not possible at the moment. But it's easy to convert an ext2
> filesystem to ext3 or ext4:
> 
> # ext2 -> ext3
> tune2fs -j image.ext2 && mv image.{ext2,ext3}

 This also requires and e2fsck, because genext2fs creates a type 0 filesystem 
while journal is only supported in type 1.

> # ext3 -> ext4
> tune2fs -O extents,uninit_bg,dir_index image.ext3 && mv
> image.{ext3,ext4} && e2fsck -fDC0 image.ext4

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
