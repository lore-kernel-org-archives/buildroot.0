From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 09 Oct 2018 10:07:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008180230.53ab7972@windsurf>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <20181008180230.53ab7972@windsurf>
Message-ID: <1539072454.1603.11.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2018-10-08 at 18:02 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,??8 Oct 2018 13:51:46 +0200, Lothar Felten wrote:
> > Patch dtc to accept libfdt include guards with and without leading
> > underscore.
> > A compiler warning is added to notify the user.
> > 
> > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> 
> So I guess this would fix the problem when host-dtc is built before
> some old Linux/U-Boot version.
> 
> However, I suppose it doesn't fix the problem when you have a
> recent version of libfdt installed on your system (through your
> distribution), that doesn't play well with those older Linux/U-Boot
> versions. Correct ?

Maybe. I have no libfdt headers on my host. This patch fixes the
failures caused by host-dtc (ver 1.4.7) and older u-boot or kernel
versions.
Building an older kernel without libfdt headers on the host works (it
uses the libfdt from the kernel) as long as host-dtc is not selected.

Just creating a /usr/include/[libfdt/]libfdt_env.h with a single #error
does not  prevent a u-boot-2016.09.01 build, so I suppose the include
paths are ok.

I expect this to be a temporary fix until all targets use a recent u-
boot and kernel.


> Thomas

Lothar
