From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:40:31 +0200
Subject: [Buildroot] [Patch v6 1/7] pkg-virtual: fix host dependencies
 handling
In-Reply-To: <20170625205614.6723-2-eric.le.bihan.dev@free.fr>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
 <20170625205614.6723-2-eric.le.bihan.dev@free.fr>
Message-ID: <20170702234031.09d58336@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 22:56:08 +0200, Eric Le Bihan wrote:
> If $(BR2_PACKAGE_HAS_HOST_FOO) is defined, then the pkg-virtual
> infrastructure will check if $(BR2_PACKAGE_PROVIDES_HOST_FOO) is not
> empty.
> 
> But later, $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES) will be set from
> $(BR2_PACKAGE_PROVIDES_FOO), ignoring $(BR2_PACKAGE_PROVIDES_HOST_FOO).
> 
> So fix this discrepancy by setting $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES)
> from $(BR2_PACKAGE_PROVIDES_FOO) only if $(BR2_PACKAGE_PROVIDES_HOST_FOO)
> is empty.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/pkg-virtual.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, after adding the comments suggested by Arnout.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
