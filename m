From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 12 Apr 2011 18:36:54 -0400
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E4DC@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
	<201104120248.26575.vapier@gentoo.org>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E4DC@EXV1.corp.adtran.com>
Message-ID: <201104121836.55644.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, April 12, 2011 11:20:38 ANDY KENNEDY wrote:
> Yeah, well at the moment it isn't on my plate as I'm writing kernel
> code attempting to get a PHY up and running, so I'll get back to
> this later.

np.  i was just trying to fill out some of your "unknowns".

> I will probably go forth with the mentality of "only
> do static" and attempt to make things work in a sensible manner.

might be better to rename or add a new option.  then the build logic is clear: 
if user *prefers* static linking, we'll still build/install shared libs, but 
we'll generate static programs everywhere.  if the user *only* wants static 
builds, then we can skip the shared lib stuff entirely.

> Question:  Where should I put the libs?  I'm guessing that I should
> have all libs install to STAGING_DIR, but I want to make sure I'm
> doing the right thing.

i believe that is correct.  staging is where all the generated stuff goes that 
you need to link other packages against, but it isnt the target rootfs tree 
which is used at runtime on the target hardware.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110412/9d3be647/attachment-0001.asc>
