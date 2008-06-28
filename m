From: Fathi Boudra <fboudra@gmail.com>
Date: Sat, 28 Jun 2008 22:11:23 +0200
Subject: [Buildroot] Add libcap/elfutils/systemtap to buildroot
In-Reply-To: <200806190804.50624.fboudra@gmail.com>
References: <200806190804.50624.fboudra@gmail.com>
Message-ID: <200806282211.26259.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

reply to myself and cc'ed to uclibc ml.

On Thursday 19 June 2008 08:04:49 Fathi Boudra wrote:
> did someone tried to cross-build systemtap and his dependencies on
> buildroot/uclibc ?
> So far, I have libcap but fail on building elfutils.

my 1st issue with elfutils is fixed:
it is related to uClibc. It doesn't provide __mempcpy().
fixed using a define to mempcy().

Now, I have another failure: argp.h not found.
AFAICS, it is glibc specific and again, uClibc doesn't provide it.
I guess the way to go is argp-standalone ?

maybe, someone faced this kind of issues ?

cheers,

Fathi
