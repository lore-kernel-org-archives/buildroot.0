From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:25:57 +0200
Subject: [Buildroot] [PATCH v2] package/dhcp: fix target installation
In-Reply-To: <20190724105453.4233-1-unixmania@gmail.com>
References: <20190724105453.4233-1-unixmania@gmail.com>
Message-ID: <20190801182557.53903f52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Jul 2019 07:54:53 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> We don't use "make install" for the target installation so we must pick
> the executables from the ".libs" directories on which libtool generates
> them otherwise we install the automatically generated wrapper scripts.
> 
> This was not necessary before the upgrade to version 4.4.1.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12051
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Chancgs v1->v2
>   Add link to gug report
> ---
>  package/dhcp/dhcp.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. I am not thrilled by the solution though,
and I'm wondering if using make install + removing what we don't want
wouldn't be a nicer solution, but I'm not sure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
