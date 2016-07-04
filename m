From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:50:11 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-wrapper: prevent use of
 unsupported -fstack-protector*
In-Reply-To: <1447724880-5020-1-git-send-email-rprebello@gmail.com>
References: <1447724880-5020-1-git-send-email-rprebello@gmail.com>
Message-ID: <20160704235011.7088d2fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Nov 2015 23:48:00 -0200, Rodrigo Rebello wrote:
> In cases where, for example, the compiler accepts -fstack-protector*
> options, but the C library does not provide the necessary
> __stack_chk_*() functions, many configure scripts incorrectly assume SSP
> is supported by the toolchain. This is because either no link test is
> performed by them, or the test code used does not actually trigger stack
> protection code emission, producing false positives.
> 
> Forcing toolchain-wrapper to error out on stack protection options when
> SSP is known to be unsupported works as a way to prevent these false
> positives. At the same time, it renders package-specific workarounds,
> like disabling SSP detection by force, unnecessary.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Thanks for this contribution. However, we no longer have SSP related
build issue (the few packages that had to be fixed have been fixed),
and I really dislike making the wrapper more complicated than it
already is. I understand that this is potentially a controversial
decision, but I prefer to not apply this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
