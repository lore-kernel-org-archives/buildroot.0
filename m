From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 24 Sep 2007 15:22:26 +0200
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <d6cda7730709240559nb93d524wcab63f2ee4e6c13a@mail.gmail.com>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190606113.22869.5.camel@cyclops.infocab.com.au>
	<20070924081339.GA31515@aon.at>
	<d6cda7730709240559nb93d524wcab63f2ee4e6c13a@mail.gmail.com>
Message-ID: <20070924132226.GC1335@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 24, 2007 at 01:59:32PM +0100, Thiago A. Corr?a wrote:
>Bernhard,
>
>   The implementation doesn't seam fine. Is there any good reason not
>to wrap strchr in a function instead of a macro? It can be stripped

I don't understand this.

>off by the SUS3 switch just as easily.

$ grep LEGACY toolchain/uClibc/uClibc-0.9.29.config 
# UCLIBC_SUSV3_LEGACY is not set
# UCLIBC_SUSV3_LEGACY_MACROS is not set

>   According to Adam, this is required by mplayer (yeah, they are
>broken, shame on them). I don't see why mplayer and qtopia and
>possibly other packages should be mutually exclusive. Unless one

There is no issue for me. I don't have these LEGACY functions, nor the
macros. Packages that have bugs (i.e. use DEPRECATED or LEGACY as in the
SUSv3 ) should be fixed. IIRC, 'index' is not a reserved name and can be
used applications, be they written in C or C++.

For reserved keywords, let me refer you to the spec of your favourite
language, SUSv, POSIX and those IEEE specs that are relevant for your
system.
