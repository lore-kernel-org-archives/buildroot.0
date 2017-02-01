From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Wed, 01 Feb 2017 18:01:31 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_1/2=5D_Add_BR2=5FCMAKE=5FUSE=5FNIN?=
 =?utf-8?q?JA=5FBACKEND_option?=
In-Reply-To: <20170130102316.2a02ed3a@free-electrons.com>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
 <20170125142716.55e7d7b3@free-electrons.com>
 <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
 <20170130102316.2a02ed3a@free-electrons.com>
Message-ID: <1422fd7b4aadc4c1efbec44cf687740c@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2017-01-30 10:23, Thomas Petazzoni a ?crit?:
> OK, understood. But do you have numbers showing that "make foo-rebuild"
> is actually faster with Ninja ?
> 
> In the tests done by Romain, it's only saving 1-2 seconds on the
> total build of a package. So I would suspect that the savings on a
> partial build are even smaller.
> 
> Even if your CMake packages are private, can you give us some numbers
> that show the time benefits of Ninja?

You're right, it is a private package, that's why I had to test on other 
packages I'm not particularly using, to demonstrate.

The benefit is rather small for my package too.

Make:
real	1m1.517s
user	2m23.996s
sys	0m36.197s

Ninja:
real	0m56.312s
user	2m19.078s
sys	0m29.119s

NB: It includes the whole "time make foo-rebuild" command, because time 
output is "strange" when inserted in pkg-cmake.mk (... time 
$$($$(PKG)_MAKE) ...), don't know why...
Looks like:
130.50user 19.88system 0:42.32elapsed 355%CPU (0avgtext+0avgdata 
24680maxresident)k
0inputs+50416outputs (0major+7602195minor)pagefaults 0swaps

To be honest, when I started to add ninja possibility, I expected much 
bigger savings :)
Yet I have the option, so even if the benefit is small, I keep using it.

But in the end, I don't know whether it's worth pushing upstream or 
not...

Besides Buildroot, I also switched another package from CMake/Make to 
Meson (based on Ninja), and the benefit was much more interesting - 
although I have not kept any measure to give here.
I expected the improvement to be caused by Ninja, not Meson. But it 
seems that Meson makes the difference, rather than Make vs Ninja.


-- 
C?dric
