From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 19 Mar 2008 10:46:43 +0000
Subject: [Buildroot] Freetype build broken when using freetype-config
Message-ID: <BAY124-W58E8487C0D6A266F6F8F52DC070@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


If I use buildroot (latest version) to build DirectFB and freetype I get a linker error.
The reason for this is that when freetype-config is called it returns /usr/lib/* for the libs.

This is because freetype-config returns /usr/lib/* for the libraries it requires.

In the old freetype makefile (before AUTOTARGETS was used) freetype-config was patched to return the correct libs.

Was this wrong?

I think this is now incorrect again.
Currently it does not build for me but if I revert to the previous versions (i.e keep libdir-la.patch and freetype.mk) all is ok.

I presume I could define a _HOOK_POSTBUILD targets todo the same thing.

Has anyone else seen this?
Daniel Laird


_________________________________________________________________
Play the Andrex Hello Softie Game & win great prizes 
http://www.thehellosoftiegame.co.uk
