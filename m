From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 11:19:32 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <87h8zq9r6u.fsf@dell.be.48ers.dk>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com> <20170607212720.GA23160@scaer>
 <87h8zq9r6u.fsf@dell.be.48ers.dk>
Message-ID: <d6af409f-8318-d97e-9193-cb07f94de67a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-06-17 22:10, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Waldemar, Thomas, All,
>  > On 2017-06-06 21:35 +0200, Thomas Petazzoni spake thusly:
>  >> On Tue, 6 Jun 2017 19:56:59 +0200, Waldemar Brodkorb wrote:
>  >> > We do not support uClibc-ng/musl C library version choice support,
>  >> > do the same for GNU C Library.
>  >> > Add me as Maintainer for the package.
>  >> > 
>  >> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>  >> 
>  >> On this one, I'd like to have the opinion of others. Arnout? Peter?
>  >> Yann? What do you think about this?
>  >> 
>  >> I don't have a very clear-cut opinion about this one.
> 
>  > Neither do I.
> 
>  > On principle, I agree that we should drop versions. But glibc is part of
>  > the toolchain, and the toolchain has always been special.
> 
>  > True, we do not have a version for uClibc-ng, 

 I think there is in fact more reason to have multiple versions for uClibc-ng
than for glibc. Multiple versions are useful in any situation when there are ABI
changes in the newer version so that binaries linked with the older version no
longer work. glibc is very careful about ABI changes, uClibc-ng somewhat less so.

 So yes, I'm in favour of removing this version choice. Also for binutils, by
the way. Yes, there may be regressions, but then those should be fixed, not
swept under the carpet for some time until the new version becomes the default.

 GCC is different, because newer GCC versions do break compatibility with older
libraries, and they do break existing (badly written) source code. In that sense
I think it was a bad idea to remove GCC 4.9, because GCC 5 did break binary
compatibility for C++... But I wasn't here at the time and that ship has sailed now.


>  > but we do have some
>  > traction on the maintainer! ;-) So we know things are gonna be fixed
>  > soonish, or that we can grab a temporary backport, both very easily.
> 
>  > Not so much for glibc in my experience...
> 
> True, but I also don't recall any package breakage because of issues in
> newer glibc versions (as glibc is "standard").

 I think mostly because they release much more slowly.


 Regards,
 Arnout

> I also don't feel strongly about it, but it is true that it would limit
> the number of combinations and be more in line with musl/uClibc-ng, so
> I'm OK with doing it.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
