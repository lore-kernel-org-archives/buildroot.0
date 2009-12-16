From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 20:26:18 +0100
Subject: [Buildroot] avahi dependencies on host tools
In-Reply-To: <20091216154756.7e5b3db2@surf> (Thomas Petazzoni's message of
	"Wed, 16 Dec 2009 15:47:56 +0100")
References: <20091216102451.339e6ba9@surf>
	<5f2b60912160550x6d3ae47eu4f625f0259737e95@mail.gmail.com>
	<20091216154756.7e5b3db2@surf>
Message-ID: <87zl5i67qd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> True, but on the other hand, the approach we've been following
 Thomas> since Buildroot maintenance has been taken over by Peter is
 Thomas> that we should only rely on "basic" tools on the host. That's
 Thomas> the reason why we build autoconf, automake, glib, pkg-config
 Thomas> and other stuff for the host as needed. It makes the
 Thomas> compilation process a little longer, but on the other hand, it
 Thomas> makes the build process a *lot* more predictable.

As always it is a tradeoff:

- How common (likely to be installed/available in dist) is the dependency?
- How big/difficult is it to build?
- Do we have specific version requirements?
- Do we need special patches (like we do for pkg-config)?

I would argue for us being able to rely on perl on the host (needed to
build the Linux kernel among many other things), but specific versions
of E.G. auto* is a lot harder.

Intltool is as you say just a perl script, so providing that ourselves
seems the best option.

-- 
Bye, Peter Korsgaard
