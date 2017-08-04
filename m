From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Aug 2017 16:40:14 +0200
Subject: [Buildroot] Tslib patch problem
In-Reply-To: <598438FF.7020702@wil.waw.pl>
References: <5984335C.1030403@wil.waw.pl>
	<598438FF.7020702@wil.waw.pl>
Message-ID: <20170804164014.0bb15e3b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Aug 2017 11:06:07 +0200, Marcin Bara?ski wrote:

> buildroot for myd-sama5d3x board on ubuntu i get an error. Can you help
> me to get this work fine?
> 
> root at ubuntu:/opt/linux/Buildroot-at91/buildroot-at91# make

Where is your U-Boot coming from ? Atmel no longer has its own
Buildroot fork, they recommend to use the mainline Buildroot:

  http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_Buildroot_for_AT91

In addition, running Buildroot as root is not recommended.

> >>> tslib 412d99d Patching package//tslib  
> 
> Applying tslib_add_finddef_and_inputattach_utils.patch using patch:
> patching file tests/Makefile.am
> Hunk #1 FAILED at 12.
> Hunk #2 FAILED at 27.
> 2 out of 2 hunks FAILED -- saving rejects to file tests/Makefile.am.rej

The patch tslib_add_finddef_and_inputattach_utils.patch in
package/tslib doesn't apply. This patch doesn't exist in the official
Buildroot, so it's a problem on your side: you have added a patch that
doesn't apply.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
