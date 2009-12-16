From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 15:47:56 +0100
Subject: [Buildroot] avahi dependencies on host tools
In-Reply-To: <5f2b60912160550x6d3ae47eu4f625f0259737e95@mail.gmail.com>
References: <20091216102451.339e6ba9@surf>
	<5f2b60912160550x6d3ae47eu4f625f0259737e95@mail.gmail.com>
Message-ID: <20091216154756.7e5b3db2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 Dec 2009 14:50:26 +0100,
Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :

> IMHO, I'd like for Buildroot to build the least amount of host tools
> so that build times can be kept down. I often start from
> scratch... :-)

True, but on the other hand, the approach we've been following since
Buildroot maintenance has been taken over by Peter is that we should
only rely on "basic" tools on the host. That's the reason why we build
autoconf, automake, glib, pkg-config and other stuff for the host as
needed. It makes the compilation process a little longer, but on the
other hand, it makes the build process a *lot* more predictable.

In the past, we had tons of reports of build failures that were caused
by issues in varying versions of the host tools. And these problems are
particularly annoying since the Buildroot developers often can't
reproduce them.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
