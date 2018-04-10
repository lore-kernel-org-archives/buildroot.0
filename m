From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 23:22:40 +0200
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410201830.GH19381@momiji>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>
 <87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf> <20180410165409.GD19381@momiji>
 <20180410175738.40345498@windsurf> <20180410171826.GF19381@momiji>
 <20180410205516.0b7958bd@windsurf> <20180410201830.GH19381@momiji>
Message-ID: <20180410232240.615a6dc3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 20:18:30 +0100, Adrian Perez de Castro wrote:

> > OK, thanks for the clarification.  
> 
> Also, I have found out from one of my test builds that in both 2.20.x releases
> we have an ugly regression of the JSC JIT support on 32-bit MIPS and ARM when
> using the softfp ABI.
> 
> A patch for this is at https://bugs.webkit.org/show_bug.cgi?id=183786 but we
> (the WebKitGTK upstream) haven't decided yet whether it will be in the next
> 2.20.x release. Some of us think it is worth a try, so I am in the middle of
> backporting the patch (and a few other patches needed by it) on top of 2.20.1,
> to include them in Buildroot, which is a good way of trying getting to try
> them on top of 2.20.1 and decide if they will go in a release as well.
> 
> If you think it would be better to first disable JIT for 32-bit ARM and MIPS
> when doing the webkitgtk package version bump, and later on re-enabling it
> with the backpoted changes, please let me know.

Since I don't know what is the extent of the breakage, and I have a
limited understanding of WebkitGtk anyway, I'll let you decide what is
best.

By "softfp ABI", are you talking soft-float (i.e the hardware has no
FPU at all) or about -mfloat-abi=softfp on ARM, which means that the
FPU may be used, but that integer registers are used to pass floating
point arguments ?

In either case, it would mean that ARM EABIhf is not broken, and
therefore JIT should be not be disabled for all ARM configurations, but
only the ones using softfp.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
