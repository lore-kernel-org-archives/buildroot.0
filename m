From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 21:44:20 +0200
Subject: [Buildroot] [PATCH 1/2] freescale-imx: separate variable
 assignment from Makefile
In-Reply-To: <1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20131001214420.34d3ef48@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Tue,  1 Oct 2013 11:06:29 -0700, Eric Nelson wrote:
> This patch pulls the variable assignments for the site and
> version from freescale-imx.mk and places them into freescale-imx.inc
> so they can be used by components in other trees
> (e.g. gstreamer plugins).
> 
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>  package/freescale-imx/freescale-imx.inc | 9 +++++++++
>  package/freescale-imx/freescale-imx.mk  | 6 +-----

I know there has been past discussion with Arnout on this, but I
clearly don't agree with the introduction of this new .inc extension in
our makefiles.

Due to how make expands variable, I am not sure it is needed for the
FREESCALE_IMX_VERSION and FREESCALE_IMX_SITE variables to be defined
before they are used.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
