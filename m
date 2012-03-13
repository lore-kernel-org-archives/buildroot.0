From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Tue, 13 Mar 2012 15:52:51 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for u-boot.sb file
	format
In-Reply-To: <20120313151754.55dc8629@skate>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-3-git-send-email-eric.jarrige@armadeus.org>
 <20120313151754.55dc8629@skate>
Message-ID: <191BFB74-CD98-4B51-91C9-441D230537C0@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 13 mars 2012, at 15:17, Thomas Petazzoni wrote:

> Forgive my ignorance about this .sb format, but does U-Boot
> automatically uses the elftosb tool? I don't see it being directly used
> in your patch, so I'm confused.

That's it. when asked to build the u-boot.sb build target (make 
u-boot.sb) U-Boot automatically call the elftosb tool to finalize the Safe
Boot build process. So this tool should already be accessible through 
the system PATH. I mean U-Boot assumes this tool to be installed on
the host environment. The link is done in patch by changing the
UBOOT_MAKE_TARGET.

Eric
