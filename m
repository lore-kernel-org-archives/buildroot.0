From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Apr 2018 17:18:26 +0100
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410175738.40345498@windsurf>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>	<87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf>	<20180410165409.GD19381@momiji>
 <20180410175738.40345498@windsurf>
Message-ID: <20180410171826.GF19381@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 10 Apr 2018 17:57:38 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 
> On Tue, 10 Apr 2018 16:54:09 +0100, Adrian Perez de Castro wrote:
> 
> > The change for AArch64 is just listing BR2_aarch64 in WEBKITGTK_ARCH_SUPPORTS,
> > the addition is in the first patch.
> 
> Then the following paragraph that you wrote:
> 
>    This series starts with the same three patches as the previous
>    submission, and adds on top three additional commits to make
>    WebKitGTK+ available on AArch64 (it's a platform we support
>    upstream), and adds a couple of patches which are already merged in
>    the upstream repository, but are not in the release and are worth
>    applying.
> 
> is a bit unclear. You're saying "adds on top three additional commits
> to make WebKitGTK+ available on AArch6". What those three additional
> commits ?
> 
> For the record, your patch series was:
> 
>   brotli: new package
>   woff2: new package
>   webkitgtk: update to version 2.20.0
>   webkitgtk: Add upstream patch for better memory monitoring

Ah, right: first I thought of making a separate patch for the small change
of marking as available on AArch64. That, plus one commit for the upstream
build fix, plus one commit for the upstream memory monitor patch. The first
I ended up stashing with ?webkitgtk: update to version 2.20.0?, and the other
two are not going to be needed for 2.20.1 (they were merged upstream).

Sorry if I wasn't being very clear here O:-)

If you think enabling the package for AArch64 deserves its own separate
commit, let me know and I'll split it back. FWIW, I've been trying AArch64
builds for the RaspberryPi 3, and they work fine; we also use them at work
for a couple of clients as well without issues.

Cheers,


--
 Adri?n ?

> > Anyway, I was waiting a bit until the 2.20.1 release, which just happened:
> > 
> >   https://webkitgtk.org/2018/04/10/webkitgtk2.20.1-released.html
> > 
> > Updating to 2.20.1 directly is IMHO better because it includes the fix for
> > building with multimedia disabled, and a fix to improve memory consumption
> > on devices with smaller amounts of memory ? which is particularly welcome
> > for embedded :-)
> > 
> > I'm making a test build with 2.20.1 as I wrote this mail, if all goes well
> > the new patch set will supersede this one.
> 
> OK, thanks. Some clarification about the above would be nice. Perhaps
> it was just a mistake in your cover letter ?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/506c727b/attachment.asc>
