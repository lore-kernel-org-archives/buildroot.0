From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:53:36 +0100
Subject: [Buildroot] [PATCH v4] open-lldp: new package
In-Reply-To: <20180116150152.32583-1-laurent_pubs@yahoo.com>
References: <20180116150152.32583-1-laurent_pubs@yahoo.com>
Message-ID: <20180116235336.591a7f8f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 16:01:52 +0100, Laurent Charpentier wrote:
> The lldpad package comes with utilities to manage an LLDP interface with
> support for reading and configuring TLVs. TLVs and interfaces are individual
> controlled allowing flexible configuration for TX only, RX only, or TX/RX
> modes per TLV.
> 
> http://open-lldp.org/
> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>

Thanks a lot, I've applied your patch. See below for a few comments
though.

> ---
>  DEVELOPERS                                         |  3 +
>  package/Config.in                                  |  1 +
>  ...1-vdptool-fixed-compile-error-for-getline.patch | 27 ++++++++
>  ...-functions-work-with-both-gnu11-and-gnu89.patch | 73 ++++++++++++++++++++++

Could you make sure to submit those two patches to the upstream
open-lldp project ?


> +# Create the m4 directory (missing from the archive).
> +# This is required for autoconf.
> +define OPEN_LLDP_BOOTSTRAP

The name of the hook wasn't really good anymore, since we're not doing
the bootstrap in there. So I renamed it to OPEN_LLDP_CREATE_M4 instead.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
