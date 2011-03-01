From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2011 17:23:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux.mk: depend on actual kernel
 image instead of stamp file
In-Reply-To: <1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
	<1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110301172355.2c535403@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Feb 2011 00:44:54 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Use the real output file (kernel image) as target instead of a stamp
> file. This way Buildroot cannot be tricked into thinking that the kernel
> image is installed when it's not.

Well, we switched *all* packages from dependencies on installed files
to dependencies on stamp files when migrating them from hand-coded
makefiles to the package infrastructures, so I don't think we should do
the opposite for the Linux kernel package.

But maybe we need to provide for each package (kernel included) a clean
and nice mechanism to delete their stamp files so that they get
reinstalled at the next make invocation.

Regardless of the solution chosen, I think any change in this direction
should come with a clear update in the documentation. I don't want to
see dozens of different hacks^Wmechanisms to do partial rebuilds being
added all over the place without any coherency nor documentation.

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
