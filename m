From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jul 2018 09:23:12 +0200
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <20180707115617.GA2507@scaer> (Yann E. MORIN's message of "Sat, 7
 Jul 2018 13:56:17 +0200")
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
 <2a850fef-a581-170d-0945-e8a4182b4347@mind.be>
 <20180707115617.GA2507@scaer>
Message-ID: <87efg7vbtr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Well, the most obvious indicator is the output of gcc -dumpmachine... Is there
 >> any reason why we wouldn't be able to treat that as reliable? AFAIU, hundreds of
 >> autotools package will fail if the dumpmachine tuple is not something sane...

 > Does that still output the correct tupple for multilib toolchains?

 > For example, the mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 > toolchain is a big-multi-lib toolchain, with both glibc and uclibc, but
 > it always returns mips-linux-gnu, even when either is explicitly
 > requested:

 >     $ ./mips-2016.05/bin/mips-linux-gnu-gcc -dumpmachine
 >     mips-linux-gnu
 >     $ ./mips-2016.05/bin/mips-linux-gnu-gcc -mglibc -dumpmachine
 >     mips-linux-gnu
 >     $ ./mips-2016.05/bin/mips-linux-gnu-gcc -muclibc -dumpmachine
 >     mips-linux-gnu

 > So that unfortunately does not work... :-(

*Grumble* It looked so nice and simple :/

-- 
Bye, Peter Korsgaard
