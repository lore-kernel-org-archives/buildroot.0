From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Apr 2018 20:18:30 +0100
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410205516.0b7958bd@windsurf>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>	<87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf>	<20180410165409.GD19381@momiji>
 <20180410175738.40345498@windsurf>	<20180410171826.GF19381@momiji>
 <20180410205516.0b7958bd@windsurf>
Message-ID: <20180410201830.GH19381@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

On Tue, 10 Apr 2018 20:55:16 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Tue, 10 Apr 2018 17:18:26 +0100, Adrian Perez de Castro wrote:
> 
> > > Then the following paragraph that you wrote:
> > > 
> > >    This series starts with the same three patches as the previous
> > >    submission, and adds on top three additional commits to make
> > >    WebKitGTK+ available on AArch64 (it's a platform we support
> > >    upstream), and adds a couple of patches which are already merged in
> > >    the upstream repository, but are not in the release and are worth
> > >    applying.
> > > 
> > > is a bit unclear. You're saying "adds on top three additional commits
> > > to make WebKitGTK+ available on AArch6". What those three additional
> > > commits ?
> > > 
> > > For the record, your patch series was:
> > > 
> > >   brotli: new package
> > >   woff2: new package
> > >   webkitgtk: update to version 2.20.0
> > >   webkitgtk: Add upstream patch for better memory monitoring  
> > 
> > Ah, right: first I thought of making a separate patch for the small change
> > of marking as available on AArch64. That, plus one commit for the upstream
> > build fix, plus one commit for the upstream memory monitor patch. The first
> > I ended up stashing with ?webkitgtk: update to version 2.20.0?, and the other
> > two are not going to be needed for 2.20.1 (they were merged upstream).
> 
> OK, thanks for the clarification.

Also, I have found out from one of my test builds that in both 2.20.x releases
we have an ugly regression of the JSC JIT support on 32-bit MIPS and ARM when
using the softfp ABI.

A patch for this is at https://bugs.webkit.org/show_bug.cgi?id=183786 but we
(the WebKitGTK upstream) haven't decided yet whether it will be in the next
2.20.x release. Some of us think it is worth a try, so I am in the middle of
backporting the patch (and a few other patches needed by it) on top of 2.20.1,
to include them in Buildroot, which is a good way of trying getting to try
them on top of 2.20.1 and decide if they will go in a release as well.

If you think it would be better to first disable JIT for 32-bit ARM and MIPS
when doing the webkitgtk package version bump, and later on re-enabling it
with the backpoted changes, please let me know.

> > Sorry if I wasn't being very clear here O:-)
> > 
> > If you think enabling the package for AArch64 deserves its own separate
> > commit, let me know and I'll split it back. FWIW, I've been trying AArch64
> > builds for the RaspberryPi 3, and they work fine; we also use them at work
> > for a couple of clients as well without issues.
> 
> I think it's OK to enable on AArch64 at the same time as you do the
> bump. It could be done in separate commits (each change stands on its
> own), but I'm fine with those changes being in the same commit.
>
> Best regards,

Most likely I will keep it along with the version bump, then.

Thanks for all the feedback!


--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/83293599/attachment.asc>
