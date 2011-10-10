From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 9 Oct 2011 22:25:40 -0400
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <201110092346.22169.yann.morin.1998@anciens.enib.fr>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <00e260122ba4b08d9809dd9eaa00dc3a25f84dbd.1318182187.git.thomas.petazzoni@free-electrons.com>
 <201110092346.22169.yann.morin.1998@anciens.enib.fr>
Message-ID: <201110092225.41496.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 09 October 2011 17:46:21 Yann E. MORIN wrote:
> On Sunday 09 October 2011 19:44:32 Thomas Petazzoni wrote:
> > From: Mike Frysinger <vapier@gentoo.org>
> > 
> > The copy_toolchain_lib_root helper searches the entire sysroot, but is
> > only interested in files in certain subdirs.  So rather than waste time
> > in walking the entire tree, walk the few subdirs at the depth level we
> > are actually going to be poaching files from.
> > 
> > Some simplification suggested by Yann E. MORIN
> > <yann.morin.1998@anciens.enib.fr> and Arnout Vandecappelle
> > <arnout@mind.be>, added by Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com>.
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> 
> BTW, what's the policy when replying: should I also CC: Mike, as he's
> the original author, or just the person that submitted the patch?

i'm just lurking now for buildroot as i'm not working on it anymore, but this 
looks fine
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111009/b71d9123/attachment.asc>
