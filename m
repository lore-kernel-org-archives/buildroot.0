From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 20:22:06 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Deselect all unconfigured
	compression options
In-Reply-To: <20171019105917.11803-1-camh@xdna.net> (Cam Hutchison's message
 of "Thu, 19 Oct 2017 21:59:17 +1100")
References: <20171019105917.11803-1-camh@xdna.net>
Message-ID: <87tvysbbu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:

 > The LINUX_KCONFIG_FIXUP_CMDS are meant to deselect any compression
 > option that are not selected in the buildroot configuration. But it only
 > deselects the last one in the list instead of all of them because it
 > overwrites the LINUX_COMPRESSION_OPT_ variable instead of appending to
 > it. Only the last option set to that variable gets deselected.

 > This produces the warning:

 > .config:2216:warning: override: KERNEL_GZIP changes choice state

 > is emitted when buildroot runs olddefconfig when buildroot configures a
 > kernel with a custom config that has a different kernel compression
 > option set to what is configured in buildroot.

 > Accumulate all the deselected compression options instead of overwriting
 > them to ensure all non-selected options get deselected..

 > Signed-off-by: Cam Hutchison <camh@xdna.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
