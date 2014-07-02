From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 17:46:47 +0200
Subject: [Buildroot] Binutils version used on MIPS
In-Reply-To: <87simjbx8x.fsf@dell.be.48ers.dk>
References: <20140701201445.3caa5150@free-electrons.com>
 <53B3B9F4.9010800@imgtec.com> <87simjbx8x.fsf@dell.be.48ers.dk>
Message-ID: <20140702174647.4021cc92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 02 Jul 2014 17:23:26 +0200, Peter Korsgaard wrote:

> FYI, the current (arch independent) default binutils version is 2.22,
> not 2.24.
> 
> We moved from 2.21 to 2.22 back in october:
> 
> commit 9777dbedb012f68e54e14f9567d9dc0187d53b17
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Sun Oct 6 23:45:10 2013 +0200
> 
>     binutils: default to 2.22
>     
>     2.21.1 is getting quite old, the linker issues with 2.22 seems to be
>     (mostly?) sorted out by now and armhf needs 2.22+, so let's bump the
>     default version.
>     
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> 
> Time has perhaps come to move to 2.23 or 2.24, I don't really know.

Right, but Vicente patch simply removes the usage of a special version
for MIPS, so MIPS now just uses whatever is the default version used
for all architectures in Buildroot. Which I think is the right thing to
do, unless there are special reasons to use a different version than
the default one (such as AVR32 need of an old version, or
Microblaze/PowerPC64LE need of a new version).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
