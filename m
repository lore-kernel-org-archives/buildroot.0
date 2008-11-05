From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Nov 2008 07:16:15 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91B4A@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	4 Nov 2008 20\:01\:22 -0500")
References: <20081104125039.199A23C8D7@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B2A@mi8nycmail19.Mi8.com>
	<e4c675870811041536w7c035576ie7690ba0d3c83e8f@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B34@mi8nycmail19.Mi8.com>
	<e4c675870811041553o7b15d778m6fb4bb6052909314@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B38@mi8nycmail19.Mi8.com>
	<e4c675870811041653j7c8e3c50r9ab4f35958681a91@mail.gmail.com>
	<BD79186B4FD85F4B8E60E381CAEE1909C91B4A@mi8nycmail19.Mi8.com>
Message-ID: <87hc6mvgsw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> Yes, it appears HOST_GLIB_BIN is just used to figure out
 hartleys> what HOST_GLIB is supposed to be.

 hartleys> Question: Does this really belong in the top level Makefile?

No, it belongs in libglib2.mk, and we should compile our own glib
tools instead of using whatever may or may not be on the host.

That hunk was added by Ulf (r22663).

Notice that HOST_GLIB is used for more than just glib-genmarshal
(E.G. in libgtk2.mk)

-- 
Bye, Peter Korsgaard
