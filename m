From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 00:45:06 +0200
Subject: [Buildroot] [PATCH 20/20] external-toolchain: add Sourcery
 CodeBench ARM 2012.03
In-Reply-To: <201208221636.16437.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <CAHkwnC8sEW3NSwCKpfMwbGWbJgVQ_zKKga5kRduutvFUnPKNqg@mail.gmail.com>
 <20120822155122.2cf57b60@skate> <201208221636.16437.yann.morin.1998@free.fr>
Message-ID: <503D49F2.1000501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/12 16:36, Yann E. MORIN wrote:
>> >  I'm a bit hesitant here. If newer glibc toolchains re-include the RPC
>> >  support, is it worth supporting libtirpc and do all the changes I had
>> >  proposed? Or should we just give up and say we only support
>> >  glibc toolchains that include RPC support? Maybe not nice, since
>> >  libtirpc brings quite a few features compared to in-toolchain RPC
>> >  support.
>> >
>> >  Comments from others?
> In glibc, RPC is now considered obsolete, and still planned for removal,
> albeit no time-line exists AFAIK.
>
> So, although glibc now again installs RPC headers, I think working on
> the libtirpc replacement is still the way to go. It's just that it's less
> critical for now.
>
> Also, there is currently no provision in crosstool-NG to build glibc/eglibc
> with --enable-obsolete-rpc (although that should be easy to add; will do
> shortly).
>
> In the end, I don not think that your work on libtirpc is still valuable,
                 ^^^^^^^not???
> because at the very least, it offers some insights on the road to go, and
> even provides a good overview of the issues at hand, and how to possibly
> solve those.

  At the very least it is useful to be able to use tirpc instead of uClibc RPC.
And I agree that this patch set is good for the future.  Also, it's in such
a good state already that it would be a real shame to discard it.

  Some of the preparatory patches (1-4, 7-10) can definitely be applied in the
short term, even if libtirpc isn't included.  Especially patch 4 is a good one
to make sure people don't run into the issue anymore with locally installed
external toolchains.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
