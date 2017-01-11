From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jan 2017 12:31:57 +0100
Subject: [Buildroot] [PATCH v2] package/mpd: fix static linking with
	tremor
In-Reply-To: <20170110223925.2896-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 10 Jan 2017 23:39:25 +0100")
References: <20170110223925.2896-1-joerg.krause@embedded.rocks>
Message-ID: <87a8axkf2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Although tremor (the library is named vorbisidec) provides a pkg-config
 > file, mpd does not use it to find tremor. Since version 0.20 does throw
 > an error instead of a warning, that's why the issue was left unnoticed
 > by the autobuilders.

 > Help mpd to find tremor by providing the path to the library and passing
 > LIBS through the environment. We use the host pkg-config tool to get the
 > correct values from the vorbisidec.pc file.

 > Fixes:
 > http://autobuild.buildroot.net/results/6b9/6b97403e70caa12c32494b1c82ce61d3e4e456f6/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 > Changes v2:
 >   - Add autobuild link

Committed, thanks.

-- 
Bye, Peter Korsgaard
