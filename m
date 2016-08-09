From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 12:03:37 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <20160807114606.GJ22524@waldemar-brodkorb.de>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
 <20160807114606.GJ22524@waldemar-brodkorb.de>
Message-ID: <20160809120337.1d10afe4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Aug 2016 13:46:06 +0200, Waldemar Brodkorb wrote:

> > Waldemar: what about simply disabling C++ support in the Blackfin
> > internal toolchain support for 2016.08 ?  
> 
> Give me the next week to find a solution, otherwise we should
> disable it.

I see you mailed me about this, asking to disable C++ support for now
in Blackfin.

> > >         m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/  
> > 
> > relocation truncated to fit: R_68K_GOT16O
> > 
> > I guess the mxgot hack could be used here as well? Waldemar?  
> 
> Yes. I can prepare a patch.

Patch committed.

> > >         m68k |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/  
> > 
> > Again: relocation truncated to fit: R_68K_GOT16O
> > 
> > Waldemar, we really have lots of packages that need the -mxgot flag.
> > Should we enable it globally?  
> 
> No, it will generate not so optimal code for all packages, I would
> rather like to fix all packages which require this workaround and
> might discuss, if this can be automatically used by gcc with the gcc
> developers.

I've committed your patch on gnuplot. Though I believe it would be nice
for gcc to have some kind of -mautoxgot option to tell "please use the
optimized mechanism if possible, and if not, fallback to the mxgot
mechanism".

> > >         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/754959831528764b5ed908b000c1e6d24a151c2c/  
> > 
> > /tmp/ccnMF6vi.s: Assembler messages:
> > /tmp/ccnMF6vi.s: Fatal error: Tried to convert PC relative branch to absolute jump
> > 
> > Waldemar ?  
> 
> Depends, will php7 be available for BR2_STATIC_LIBS or not? If not I
> will just ignore it for now :)

Sadly for you, I just sent a minute ago a patch that fixes the build of
PHP on BR2_STATIC_LIBS configurations :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
