From: David Raeman <draeman@bbn.com>
Date: Tue, 2 Aug 2016 08:21:04 -0400
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
	HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160801215909.GA5990@free.fr>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160801215909.GA5990@free.fr>
Message-ID: <008001d1ecb8$577afab0$0670f010$@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Mon, Aug 1, 2016 at 5:59 PM, Yann E. MORIN wrote:
>  2- it fixes the python issues we've had with -isystem?

I see that you already backed away from this idea, but I thought I'd
still chime in on the python question.  You may have missed my email
about what is causing the python issue - please see:
http://lists.busybox.net/pipermail/buildroot/2016-July/168710.html.

In a nutshell, the python setup.py script is peeking in the CPPFLAGS
environment variable and is extracting any uses of the -I flag.  Then
it's checking whether system libraries are installed in any of those
locations, to know which modules can be enabled by the build.

So using any flag to specify include directories other than -I will
not work without patching the python setup.py script.

Cheers,
David
