From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 19:18:53 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: add an option to install
 runtime headers
In-Reply-To: <1de54574a4445ff63b1db831f2ca904b731d93e2.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
 <1de54574a4445ff63b1db831f2ca904b731d93e2.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <20160920191853.1f7e0f6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 14:50:38 +0200, Yann E. MORIN wrote:
> When the Linux kernel is patched with new externsions (e.g. aufs), it
> exposes new userland headers that were not necessarily available in the
> headers used to build the toolchain. Those headers will expose new
> features, like new filesystems internals.
> 
> Add an option for such packages to request the kernel installs its
> headers.
> 
> We do install those headers in a non-standard location, so that:
> 
>   - they do not override those provided by the toolchain;
> 
>   - they do not get inadvertently used.
> 
> Packages that really need those headers will have to add the correct -I
> path to their CPPFLAGS.
> 
> Note: this is not documented on-purpose, as we expect the set of
> packages that need that to be very limited. In which case, we'll
> notice they need those headers, and we can instruct the submitter
> to use these option and variable.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I have not applied this patch. Instead, I've tuned a bit the aufs-util
package so that we can directly use the headers from
$(LINUX_DIR)/include/uapi.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
