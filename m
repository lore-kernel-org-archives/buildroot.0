From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 15:48:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix build without NLS
In-Reply-To: <20190719211152.3812-1-fontaine.fabrice@gmail.com>
References: <20190719211152.3812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190801154822.7d09b947@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jul 2019 23:11:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set USE_GETTEXT depending on BR2_SYSTEM_ENABLE_NLS as otherwise build
> will fail if gettext is not installed on host because USE_GETTEXT is
> enabled by default since version 20190324 and
> https://github.com/iputils/iputils/commit/2615a527209bb408b54028ef6405075cadd4541b
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/127823ddbd75336abc0fe0e9bd11e4f5249df87c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iputils/iputils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
