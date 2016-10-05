From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:16:19 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
 <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
Message-ID: <20161005221619.6a958ba0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Oct 2016 22:11:31 +0200, Thomas De Schampheleire wrote:

> I did that now. While I'm still running some more tests, I already
> tested tarball versions 7.10.1 and 7.11.1, and both ARC and Microblaze
> git versions. I currently only tested host-gdb, but for all these
> cases I can get rid of the host-texinfo dependency with following
> extra changes:
> 
> GDB_INSTALL_OPTS += MAKEINFO=true
> GDB_MAKE_OPTS += MAKEINFO=true
> HOST_GDB_INSTALL_OPTS += MAKEINFO=true
> HOST_GDB_MAKE_OPTS += MAKEINFO=true
> 
> The INSTALL_OPTS were needed for the tarball versions, while the
> MAKE_OPTS (and perhaps also the INSTALL_OPTS, not sure) for the git
> versions.

OK.

> I still need to test the (target-)gdb, but I guess it won't make a
> difference as the Makefiles are the same.

Worth testing to check that everything is alright.

> Is this too simplistic? Am I missing something?

If it works, then all good.

Note that for binutils, we have a different work-around: we touch
all .info files so that they have a date that is later than the source
files they are generated from. But that only works for tarball releases
(that contain .info files). For binutils fetched from Git, we depend on
host-texinfo.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
