From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2009 10:28:10 +0100
Subject: [Buildroot] using target_skeleton directory
In-Reply-To: <4B2B499F.6080203@diateam.net>
References: <4B2B499F.6080203@diateam.net>
Message-ID: <20091218102810.5b81f330@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

Le Fri, 18 Dec 2009 10:21:35 +0100,
Damien RANNOU <damien.rannou@diateam.net> a ?crit :

> I'm using buildroot-2009.11 and would like to have informations about 
> target_skeleton directory. In the documentation it's said that I can 
> customize my filesystem using |target/generic/target_skeleton/ |and
> just type "make" to have all my files copied into output/target, and
> the .tar.bz2 image file. But I made some tests, and it appears that
> files put in the /root directory (of target_skeleton) are only copied
> if I 'make distclean' before|.|
> 
> Is it a bug ? A documentation problem ?

The target_skeleton directory is copied at the beginning of the
Buildroot build process to output/target/. If this copy has been done,
it is not done again unless you clean up everything. So the behaviour
you're having (need to clean up everything to get the skeleton copied
to the target directory) is expected.

You can try to remove output/build/.root and run make, it should
trigger the copy of the skeleton to the target directory. However, this
is untested, so there may be issues with this.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
