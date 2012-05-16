From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Wed, 16 May 2012 08:55:25 -0400
Subject: [Buildroot]  Buildroot and linux-pam?
In-Reply-To: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
References: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
Message-ID: <CADiAo4K8TGbzt0Ea1uFXx5vLoSL_TbijL9fofbT33Nm8oHGutg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:

> You're apparently modifying the config.h manually, which is generated
> by ./configure script. Isn't it possible by passing environment
> variables to the ./configure script, to ensure that the problematic
> test gets the appropriate value?

There are few functions (ruserok_af, innetgr) that uClibc is likely
missing (or they are excluded per current configuration), and while
calls to these functions ought to be disabled via configure, per
existing code they are not. This might be a reportable bug*, but as my
goal was to find a way to compile it in principle, I used such brute
force replacing them with dummy macros just to get through. Another
hack was overwriting makefiles in docs since Buildroot's toolchain may
be missing some doc generation facilities, and I see little value in
them anyway at least for Buildroot.

Thanks for your comment.

------------------------
* But even if reported properly, it may take some time for it to be
reflected in a realase tarball, so perhaps for current adoption such
manual mending of config.h can be admitted.

-- 
Dmitry Golubovsky

Anywhere on the Web
