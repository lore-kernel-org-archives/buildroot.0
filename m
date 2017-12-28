From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:11:39 +0100
Subject: [Buildroot] [PATCH] package/nut: workaround parallel build issue
In-Reply-To: <20171228132422.GC3428@scaer> (Yann E. MORIN's message of "Thu,
 28 Dec 2017 14:24:22 +0100")
References: <20171223152911.12640-1-yann.morin.1998@free.fr>
 <87tvwduxml.fsf@dell.be.48ers.dk> <20171228132422.GC3428@scaer>
Message-ID: <87shbulcys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Nut is not a very big package and has no reverse dependencies, so the
 >> impact of MAKE1 is quite small.

 > I timed a nut build, and indeed the build time for a non-parallel build
 > is split as such (on an otherwise-unloaded machine):

 >     14:18:03 >>> nut 2.7.4 Extracting
 >     14:18:03 >>> nut 2.7.4 Patching
 >     14:18:03 >>> nut 2.7.4 Updating config.sub and config.guess
 >     14:18:03 >>> nut 2.7.4 Configuring
 >     14:18:03 >>> nut 2.7.4 Autoreconfiguring
 >     14:18:10 >>> nut 2.7.4 Patching libtool
 >     14:18:15 >>> nut 2.7.4 Building
 >     14:18:37 >>> nut 2.7.4 Installing to target

 > So it is about 34s, of which 22s to build, while a parallel build would
 > take just about 8s to build.

 > I'll send a patch to use MAKE1.

Great, thanks!

-- 
Bye, Peter Korsgaard
