From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Dec 2010 23:03:08 +0100
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101224072947.17101by6ka661utc@www.home.zuerker.org> (Heiko
	Zuerker's message of "Fri, 24 Dec 2010 07:29:47 -0600")
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
	<20101224072947.17101by6ka661utc@www.home.zuerker.org>
Message-ID: <87ipyhpl2b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

Hi,

 >> Could you detail why that specific behaviour on NFS is causing
 >> problems ?

 Heiko> (A rather lengthy explanation)

 Heiko> My situation is a bit different than most people using buildroot.
 Heiko> I'm trying to use buildroot for a full blown, security focused distribution.
 Heiko> Since Devil-Linux is already well established, I have to reproduce the
 Heiko> current features.

 Heiko> Busybox is only used as a static binary in the initramfs to initialize
 Heiko> the system, find the configuration and the distribution media.

 Heiko> We're using the full blown glibc and busybox can't be statically
 Heiko> compiled if nfs support is on, since it needs it for dns resolution.

So your problem is basically that you're trying to do static linking
with glibc, which is known to not work very well, and is considered
deprecated by the glibc developers
(http://www.akkadia.org/drepper/no_static_linking.html). Wouldn't it
make more sense to use uclibc for the initramfs, or alternatively use
dynamic linking?

 Heiko> This may cause other people more issues. I'm sure not everybody can
 Heiko> used the provided config files and has to do some minor adjustments,
 Heiko> but still relies on some of the auto-config features.

Yes, I don't like extra (inconsistent) magic.

-- 
Bye, Peter Korsgaard
