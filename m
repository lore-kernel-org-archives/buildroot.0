From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 7 Aug 2016 13:46:06 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160807112654.7b520594@free-electrons.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
Message-ID: <20160807114606.GJ22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Here is the usual analysis of build failures. Waldemar, Alexey, Vlad,
> Gustavo, Frank, Gwenhael, Angelo, Fran?ois, Romain, Bernd, can you have
> a look below? Thanks!
> 
> On Sat,  6 Aug 2016 08:30:28 +0200 (CEST), Thomas Petazzoni wrote:
> 
> >         bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/20d72bb9e0aeb6adbce4239f848d355c7f8339e9/
> 
> This is the usual Blackfin internal toolchain C++ issue. I have built
> a new Blackfin toolchain with -rc1 + the latest patches from Waldemar,
> but we know there is still a remaining problem (or at least one).
> 
> Waldemar: what about simply disabling C++ support in the Blackfin
> internal toolchain support for 2016.08 ?

Give me the next week to find a solution, otherwise we should
disable it.
 
> >         m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/
> 
> relocation truncated to fit: R_68K_GOT16O
> 
> I guess the mxgot hack could be used here as well? Waldemar?

Yes. I can prepare a patch.
 
> >         m68k |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/
> 
> Again: relocation truncated to fit: R_68K_GOT16O
> 
> Waldemar, we really have lots of packages that need the -mxgot flag.
> Should we enable it globally?

No, it will generate not so optimal code for all packages, I would
rather like to fix all packages which require this workaround and
might discuss, if this can be automatically used by gcc with the gcc
developers.
 
> >         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/754959831528764b5ed908b000c1e6d24a151c2c/
> 
> /tmp/ccnMF6vi.s: Assembler messages:
> /tmp/ccnMF6vi.s: Fatal error: Tried to convert PC relative branch to absolute jump
> 
> Waldemar ?

Depends, will php7 be available for BR2_STATIC_LIBS or not? If not I
will just ignore it for now :)

best regards
 Waldemar
