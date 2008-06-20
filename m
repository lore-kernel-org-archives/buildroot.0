From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 21:24:13 +0200
Subject: [Buildroot] problem with dbus.mk
In-Reply-To: <46a136670806200815p7034b6c5y6dbe39035796af62@mail.gmail.com>
	(John Voltz's message of "Fri\, 20 Jun 2008 11\:15\:58 -0400")
References: <46a136670806200815p7034b6c5y6dbe39035796af62@mail.gmail.com>
Message-ID: <87tzfn29lu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John> Hi,
 John> I discovered a bit of a problem in dbus.mk.

 John> DBUS_XML_DEP:=$(BUILD_DIR)/libxml2-2.6.29/.stamp_staging_installed

 John> What happens when libxml2 has not been downloaded, extracted,
 John> or built and you depend on .stamp_staging_installed?

Normally it would work just fine (we do this all the time), but
looking closer at it, the Makefile.autotools.in stuff is horribly
broken as it doesn't have proper dependencies listed.

It also looks like it would break badly for parallel builds (-j)

:/

 John> Build failure. I would suggest a revert on dbus.mk.

I'll revert the libxml2 hunk. We really need to fixup the autotools
stuff or stop using it.

-- 
Bye, Peter Korsgaard
