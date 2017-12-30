From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:35:51 +0100
Subject: [Buildroot] [PATCH] tar: do not build SELinux support for host
 variant
In-Reply-To: <20171229202608.1767-1-thomas.petazzoni@free-electrons.com>
References: <20171229202608.1767-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171230223551.195bff51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 21:26:08 +0100, Thomas Petazzoni wrote:
> If we don't explicitly disable SELinux support in the host-tar build,
> it might pick up system-wide installed SELinux libraries, causing the
> tar in HOST_DIR/bin/ to depend on the host SELinux libraries, which is
> not desirable to make the SDK portable/relocatable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/tar/tar.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
