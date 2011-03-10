From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Mar 2011 12:37:37 +0100
Subject: [Buildroot] 2011.02 pkg-config problems?
In-Reply-To: <20110310122659.7d9abef7@surf> (Thomas Petazzoni's message of
	"Thu, 10 Mar 2011 12:26:59 +0100")
References: <WC20110307121409.5600B6@terrafix.co.uk>
	<8762rr8bs8.fsf@macbook.be.48ers.dk> <20110310122659.7d9abef7@surf>
Message-ID: <871v2f8av2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Thu, 10 Mar 2011 12:17:43 +0100
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Thanks for reporting this. The problem is that pkg-config doesn't have
 >> any explicit support for cross compilation, so we have to guess if a
 >> given variable refers to a target path or a host path. For this
 >> specific problem you could work around it by passing an explicit
 >> --with-fontrootdir=/usr/share/fonts/X11 to the configure step of the
 >> xfonts packages, but I have fixed pkg-config in git to only prepend
 >> the sysroot location when the includedir + libdir variables are
 >> requested, and not all variables like we did for 2011.02:
 >> 
 >> http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabe

 Thomas> Maybe we need to release 2011.02.1 with this fix ?

Possibly. Lets give it a few days and see if anything else shows
up.

-- 
Bye, Peter Korsgaard
