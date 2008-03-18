From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 18 Mar 2008 05:54:02 -0700 (PDT)
Subject: [Buildroot]  Freetype build broken when using freetype-config
Message-ID: <16120565.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


If I use buildroot (latest version) to build DirectFB and freetype I get a
linker error.
The reason for this is that when freetype-config is called it returns
/usr/lib/* for the libs.

This is because freetype-config returns /usr/lib/* for the libraries it
requires.

In the old freetype makefile (before AUTOTARGETS was used) freetype-config
was patched to return the correct libs.

Was this wrong?

I think this is now incorrect again.
Currently it does not build for me but if I revert to the previous versions
(i.e keep libdir-la.patch and freetype.mk) all is ok.

I presume I could define a _HOOK_POSTBUILD targets todo the same thing.

Has anyone else seen this?
Daniel Laird
-- 
View this message in context: http://www.nabble.com/Freetype-build-broken-when-using-freetype-config-tp16120565p16120565.html
Sent from the BuildRoot mailing list archive at Nabble.com.
