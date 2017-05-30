From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 08:59:27 +0200
Subject: [Buildroot] package hwloc does not install to staging
In-Reply-To: <66428c29-990f-e0d4-9164-92e5dae4e736@sfu.ca>
References: <66428c29-990f-e0d4-9164-92e5dae4e736@sfu.ca>
Message-ID: <20170530085927.5cf55844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 16:20:46 -0700, Graham Holland wrote:

> I'm curious if there is a reason for the hwloc package not including
> the following:
> 
> HWLOC_INSTALL_STAGING = YES
> 
> so that the hwloc.h header is copied to the staging directory
> 
> I am porting a package that has a dependency on hwloc and which uses
> pkg-config in its build system to detect hwloc compiler flags. If I
> modify the hwloc.mk file to include the above, then this works
> correctly.

There is no specific reason other than the fact that nobody needed it
until now. So don't hesitate to send a patch adding
HWLOC_INSTALL_STAGING = YES (and possibly your additional package if
it's some public available software package).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
