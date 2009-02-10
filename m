From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 10 Feb 2009 22:40:09 +0100
Subject: [Buildroot] gst-plugins-bad - Anyone built it?
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF3BCCB31@EU1RDCRDC1WX029.exi.nxp.com>
References: <C13DBBE85AD6974B85C118C35890CA5F1AF3BCCB31@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <200902102240.09978.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel James Laird, 10.02.2009:
> Has anyone succesfully built gst-plugins-bad?  I am trying (have
> created a new local package) but am having real difficulty getting
> linking to work.  If anyone has done this I would love to see it!

I did several weeks ago for AVR32 and successfully tested fbdevsink and
displayed a test with image with videotestsrc. There was merely an
RGB<->BGR issue if I recall correctly.

Then I intended to submit it after a little cleanup, but had some errors
on i386, which I don't remember any more and lost interest because I
didn't even use the package at that time.

This is what is currently in my AVR32 tree, I think this was the last
state which worked for me:

GST_PLUGINS_BAD_CONF_OPT = \
		$(DISABLE_NLS) \
		--disable-examples \
		--disable-apexsink

Testing for i386 at home I further had to do 

		--disable-sdltest

because "/usr/bin/sdl-config was found and led to a linker error?"
I put this in quotes, because this is exactly what I've written down at
that time, including the question mark :)

I think my machine doesn't have SDL installed, so this problem didn't
arise there.

What do your linker errors look like?

Markus
