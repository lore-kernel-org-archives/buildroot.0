From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 09:35:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-16
In-Reply-To: <20140517063007.AED55100CC0@stock.ovh.net>
References: <20140517063007.AED55100CC0@stock.ovh.net>
Message-ID: <20140517093546.6b5dfca1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/437c77485043f0ef21cc1ffbe45e9cc29a1af374/

Still the static build / libstdc++ problem. We had some good discussion
about it with Gustavo yesterday.

>       bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/f9cee096078555a40307bb37f3695ac83fd68f27/

To be investigated.

>        arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/8869615310642b8de8231ab23d1bbaf57b7cdae1/

This one is fixed by
http://git.buildroot.net/buildroot/commit/?id=fc8fcec306dab7191dc557ee583e90fc1a3a6c29.

>       bfin | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/0d441bf1831b2a657b466e44c29423c45c07decd/

fork() missing. I'll send a patch for this one.

>    powerpc | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/75fc8f0a475ce77706789e77f385a0704207c04d/

This one is fixed by
http://git.buildroot.net/buildroot/commit/?id=fc8fcec306dab7191dc557ee583e90fc1a3a6c29.

>        arc | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/c218be876d3abf7a8e212b6d526595bfd835e1c5/

Missing some compiler intrinsics. I'll send a patch to disable jack2 on
ARC for now.

>     x86_64 |                   samba4-4.1.7 | NOK | http://autobuild.buildroot.net/results/65726ceccbc2d8fa24e178ea66cd44703768bc95/
>     x86_64 |                   samba4-4.1.7 | NOK | http://autobuild.buildroot.net/results/9c3da047ee16ea3d9b828059db3a082738aa1cbc/

Symbol conflict between heimdal code and C library:

default/source4/heimdal/lib/krb5/krb5_err.c:279:23: error: 'link' redeclared as different kind of symbol
[...]
/home/test/test/2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/unistd.h:812:12: note: previous declaration of 'link' was here

Gustavo ?

>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e9b4b232efa66dbde30238b0184bdb61c4226a4c/
>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/07b2dd87650775a1e235b7fbe8cd1a97eaf25f2c/

Compiler issue. I'll add an exception to the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
