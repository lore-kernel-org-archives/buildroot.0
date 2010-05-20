From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 May 2010 12:34:05 +0200
Subject: [Buildroot] Basic stupid questions regarding buildroot
In-Reply-To: <1A3C06457633904EAC567D23DA05171702AA8455@calrec-exch03.calrecaudio.com>
	(David Wooff's message of "Thu, 20 May 2010 11:23:40 +0100")
References: <1A3C06457633904EAC567D23DA05171702AA8455@calrec-exch03.calrecaudio.com>
Message-ID: <87sk5mx3oi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Wooff <David.Wooff@calrec.com> writes:

 David> Hi,
 David> sorry for these rather basic questions:

 David> 1.  If I download the latest version of buildroot, am I tied to
 David> a particular version of the kernel?  I current have an old
 David> buildroot (from late last year and kernel 2.6.30, but I'm going
 David> to download the latest buildroot because I'm having compilation
 David> problems (since I did a "clean") and it has been suggested that
 David> I use the latest version.  I currently build the kernel
 David> separately.

There's a limited number of kernel versions supported for any buildroot
release, but as you are compiling your kernel seperately you are
completely free to choose your kernel version.

The kernel headers version doesn't have to be the same as the kernel
version (it only has to be new enough to provide headers for whatever
features you need).

 David> 2. Regarding pre-requisite "packages" or build tools, if I have
 David> to manually download a toolset of some description, where does
 David> it have to live?  Is this automatically "known" by any
 David> application which might want to use it?  Is there a list of
 David> anything I need to manually install before attempting to build
 David> buildroot?

You mean stuff on the build host? We do a dependency check when you run
make and error out if anything in missing.

-- 
Bye, Peter Korsgaard
