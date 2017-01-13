From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:16:23 +0100
Subject: [Buildroot] [PATCH] package/mpd: add patch to fix linking with
	ogg
In-Reply-To: <20170112080315.10962-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 12 Jan 2017 09:03:15 +0100")
References: <20170112080315.10962-1-joerg.krause@embedded.rocks>
Message-ID: <87inpjat2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Building mpds internal static xiph library needs to link with libogg.
 > Otherwise building mpd fails with:

 > ```
 > /mips-linux-gnu/bin/ld: libxiph.a(libxiph_a-OggVisitor.o): undefined
 > reference to symbol 'ogg_stream_packetout'
 > ```

 > Add a patch which adds OGG_LIBS to XIPH_LIBS so that the linker finds
 > the necessary ogg library.

 > Fixes:
 > http://autobuild.buildroot.net/results/9f0/9f062dc51daed5c5047faa8d79ecbd4e228f2572/
 > http://autobuild.buildroot.net/results/1cc/1cc097c5022bd3161dc03b0866cb04075c944a64/
 > http://autobuild.buildroot.net/results/2e3/2e3dbcdea34053675a0139c1911b6da1a6670e2c/
 > .. and more.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
