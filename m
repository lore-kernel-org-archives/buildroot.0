From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 13:01:13 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
Message-ID: <20130711130113.02ef2730@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 11 Jul 2013 11:37:10 +0200, Thomas De Schampheleire wrote:

> What is the strategy with respect to cleaning up the user's
> environment when building buildroot?
> Because there are a number of other variables that users can have (and
> do have) that corrupt the build, for example:
> 
> C_INCLUDE_PATH
> CPLUS_INCLUDE_PATH
> LIBRARY_PATH
> LD_LIBRARY_PATH
> PERL5LIB
> GCC_EXEC_PREFIX
> 
> In the twisted environments that I'm working in, I'm unsetting these
> from a wrapper around buildroot make. However, it seems that there
> already are a number of cleanups done inside buildroot itself, so it
> makes sense to add the above variables to the list.
> 
> What do you think?

We have are a bit inconsistent on this. Some variables are unset from
the main Makefile, and a bunch of others are checked in
support/dependencies/dependencies.sh. For example, LD_LIBRARY_PATH
which you mentioned get checked in support/dependencies/dependencies.sh.

Looks like a bit of cleanup in this area might be useful.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
