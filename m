From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:45:32 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
Message-ID: <20171101104532.43dcd164@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 21:37:28 -0500, Matthew Weber wrote:

> > This is happening only on ARC. Why? Matt Weber proposed a patch,
> > https://patchwork.ozlabs.org/patch/832397/, but I am not terribly
> > convinced because it doesn't explain why this problem happens only on
> > ARC, and why it appeared suddenly.  
> 
> I kicked off a test build reverting the following commit.  We'll see
> in the morning if it changed the behavior or the pass/fail.  (ie bump
> from GCC 6.x to 7.x)
> 5bd21f991f3 Evgeniy Didin     2017-09-21 21:28:28

OK, we'll see the result.

> One interesting thing to notes is the test-pkg is using a external ARC
> GCC6 uclibc toolchain  and the failing builds are all internal
> toolchain and GCC 7.

Yes. But we have other toolchains tested by test-pkg that use gcc 7.x,
so I'm surprised the problem doesn't pop up on other architectures.


> >>          arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9567703c95823be10400c0a330c3997a4cd6a62c | ORPH
> >>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e3ee47e30a01e68a80fcbef3178f8eb051fe509f | ORPH
> >>          sh4 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7d60ebf31fd9df7a5fef7e7723859c32d7972f5b | ORPH  
> >
> > The libfdt/python issue. Matt Weber has proposed a patch to fix it:
> > https://patchwork.ozlabs.org/patch/827287/, however I have some
> > questions/concerns about it.  
> 
> Should we just wait for the November uboot release that resolves the
> underlying design issue upstream?

No, because we want to fix this problem before the next Buildroot
release in November.

Unrelated note: when you're replying to only a few parts of a lengthy
e-mail, it's good practice to delete the parts of the e-mail that are
not relevant. See what I did here :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
