From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 10:13:25 +0100
Subject: [Buildroot] moving package divine from autotools-package to
 generic-package
In-Reply-To: <513A5360.8080707@googlemail.com>
References: <513A5360.8080707@googlemail.com>
Message-ID: <20130309101325.7b8352e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Fri, 08 Mar 2013 22:08:48 +0100, Carsten Schoenert wrote:

> But, the archive on directfb.org is broken, inside the archive in the
> lib/ directory the Header idivine.h is missing. Inside the Git Repo
> everything is fine. I wrote up the maintainer and describe the issue but
> until now no response from there.
> So I tried to change package divine from a autotools-package to a
> generic package because the Git Repo just shipped a file autogen.sh for
> package preparation.

No, no, it should continue to be an autotools-package. It has a
configure.in, and Makefile.am, it is autotools based, so it should
remain an autotools-package.

Now, since you're getting it from git instead of a tarball, the
configure script and Makefile.in are not pre-generated, so we have to
get them generated.

Can you just try to do:

DIVINE_AUTORECONF = YES

in the package recipe?

Looking at what the autogen.sh script does, I think our autoreconf
logic should work. Otherwise, we will just add a hook in the package
recipe in order to call autogen.

But clearly, converting to generic-package is the wrong way to go.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
