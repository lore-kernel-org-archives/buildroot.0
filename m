From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 11 Jan 2017 20:56:27 +0100
Subject: [Buildroot] [PATCH v2] package/mpd: fix static linking with
	tremor
In-Reply-To: <8760llkbqg.fsf@dell.be.48ers.dk>
References: <20170110223925.2896-1-joerg.krause@embedded.rocks>
 <8760llkbqg.fsf@dell.be.48ers.dk>
Message-ID: <1484164587.2499.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-01-11 at 13:44 +0100, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> Although tremor (the library is named vorbisidec) provides a pkg-
> config
> ?> file, mpd does not use it to find tremor. Since version 0.20 does
> throw
> ?> an error instead of a warning, that's why the issue was left
> unnoticed
> ?> by the autobuilders.
> 
> ?> Help mpd to find tremor by providing the path to the library and
> passing
> ?> LIBS through the environment. We use the host pkg-config tool to
> get the
> ?> correct values from the vorbisidec.pc file.
> 
> ?> Fixes:
> ?> http://autobuild.buildroot.net/results/6b9/6b97403e70caa12c32494b1
> c82ce61d3e4e456f6/
> 
> ?> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ?> ---
> ?> Changes v2:
> ?>???- Add autobuild link
> 
> It seems like this isn't sufficient:
> 
> http://autobuild.buildroot.net/results/2e3/2e3dbcdea34053675a0139c191
> 1b6da1a6670e2c/build-end.log
> 
> Perhaps we need to add libogg to the pkg-config line as well?

This is not a static linking issue. My read is that mpd forgets to
consider OGG_LIBS in XIPH_LIBS. I will contact upstream about this
issue.

J?rg
