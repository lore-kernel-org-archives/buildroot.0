From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 13:09:19 +0100
Subject: [Buildroot] [PATCH] pixman: Bump version to 0.24.2
In-Reply-To: <CAFbHwiTE-oKMz5iyy284Kz++1VwWhei-T=iAhUVx3o2_GJs-jA@mail.gmail.com>
 (Will Newton's message of "Thu, 2 Feb 2012 11:31:09 +0000")
References: <CAFbHwiTE-oKMz5iyy284Kz++1VwWhei-T=iAhUVx3o2_GJs-jA@mail.gmail.com>
Message-ID: <87d39xbfo0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> The patch to disable tests is no longer required as configure
 Will> checks to see if the GTK+ tests should be built.

That's not really true. As far as I can see, the tests are always built
(with png support if available), and the gtk test is used to decide if
the gtk-based demos are built.

The checks use pkg-config, so we need to depend on that.

I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
