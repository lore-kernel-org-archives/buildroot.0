From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 13:25:17 +0200
Subject: [Buildroot] [PATCH] package/attr: fix building out-of-tree
In-Reply-To: <20130523123208.57177273@skate>
References: <1369304728-21798-1-git-send-email-yann.morin.1998@free.fr>
 <20130523123208.57177273@skate>
Message-ID: <20130523132517.7b028641@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, 23 May 2013 12:32:08 +0200, Thomas Petazzoni wrote:

> > This needs touching a m4 macro, so requires autoreconf.
> > 
> > But since this is not a true autotools-package, autoreconf whines
> > about missing macros. So we have to explicitly pass '-I m4'.
> > 
> > But since this is not a true autotools-package, the build then fails
> > with missing definition for _() as the configure scripts gets confused.
> > So, we just call autoconf, not autoreconf.
> 
> If it's not a true autotools-package, then it shouldn't be using the
> autotools-package infrastructure, I'd say.
> 
> And making a change to the source code at the configure step (such
> as autoconf or autoreconf) is fundamentally going into the wrong
> direction with regard to out-of-tree support. All steps until configure
> are done only once, on the source tree, and then all steps starting
> from the configure step are done for both the target build and the host
> build.
> 
> Therefore, autoreconf/autoconf should not be part of the configure
> step anymore. I'm sending an e-mail about that in a moment.

Also, since this package doesn't use automake, most likely its
Makefiles are not out-of-tree capable, so in this case, there's no
point in fixing the configure script to be out-of-tree capable if the
rest of the build process isn't. Unless of course the entire package is
fixed to support out-of-tree, but I believe 'attr' is a very small
package which is not really worth fixing first. There will be many more
bigger packages that would be more useful to fix for out-of-tree
builds, I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
