From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 09:00:58 +0100
Subject: [Buildroot] [PATCH 1/2] dmraid: disable on ARC arch
In-Reply-To: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20140207090058.75ced0b6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu,  6 Feb 2014 23:56:56 +0100, Ryan Barnett wrote:

> diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
> index 028b46c..2f0c5b4 100644
> --- a/package/dmraid/Config.in
> +++ b/package/dmraid/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DMRAID
>  	bool "dmraid"
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_arc

I believe it would be good to have a comment above this line that says
why it's disabled. Maybe something like:

	# causes an internal compiler error on ARC

Ditto for the gpsd issue on Microblaze.

And maybe Cc the ARC and Microblaze "maintainers" : Anton Kolesov
<Anton.Kolesov@synopsys.com> for ARC, and Spenser Gilliland
<spenser@gillilanding.com> for Microblaze.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
