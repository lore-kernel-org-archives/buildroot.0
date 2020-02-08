From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 08:56:40 +0100
Subject: [Buildroot] [PATCH 0/2] autotools: do not overwrite first
 include path
In-Reply-To: <20200204131300.GD3101@scaer> (Yann E. MORIN's message of "Tue, 4
 Feb 2020 14:13:00 +0100")
References: <20200204124013.17340-1-heiko.thiery@gmail.com>
 <20200204131300.GD3101@scaer>
Message-ID: <87y2tdv7ev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Heiko, All,
 > On 2020-02-04 13:40 +0100, Heiko Thiery spake thusly:
 >> The first patch fixes the issue with the autotools package.
 >> For a detailed explanation take a look into the commit message.
 >> 
 >> The second patch removes the hooks that were introduced to workaround
 >> the issue that is fixed with the first patch.
 >> 
 >> Heiko Thiery (1):
 >> remove the hook for creating the m4 directory
 >> 
 >> Michael Walle (1):
 >> autotools: do not overwrite first include path

 > Series applied to master, thanks! :-)

 > I just slightly reword the commit logs with a little bit of extra
 > details.

It unfortunately seems to cause some breakage :/

E.G. sdl_mixer fails with an autools-related issues since this got
applied:

libtool: Version mismatch error.  This is libtool 2.4.6, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.6
libtool: and run autoconf again.

http://autobuild.buildroot.net/?reason=sdl_mixer-1.2.12

Care to take a look?

-- 
Bye, Peter Korsgaard
