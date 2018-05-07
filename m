From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 23:38:51 +0200
Subject: [Buildroot] [PATCH v2,1/1] libupnpp: fix build with uclibc
In-Reply-To: <20180504160133.5420-1-fontaine.fabrice@gmail.com>
References: <20180504160133.5420-1-fontaine.fabrice@gmail.com>
Message-ID: <20180507233851.76e14c33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 18:01:33 +0200, Fabrice Fontaine wrote:
> Add patch to avoid failing with error if host_os doesn't start with
> linux
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
>  - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Note: the commit title is not correct: libupnpp builds perfectly fine
with uClibc already, as long as it's on MMU-capable systems, where the
OS part of the tuple is "linux". It's only no-MMU systems that are
affected by the problem, because the OS part of the tuple is "uclinux".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
