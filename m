From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 23 Jan 2011 16:07:30 -0500
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <877hdvapq0.fsf@macbook.be.48ers.dk>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
	<877hdvapq0.fsf@macbook.be.48ers.dk>
Message-ID: <201101231607.30938.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, January 23, 2011 05:17:43 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  Mike> The new version of libpcap changed how its install targets work. 
> The Mike> main "install" target now always depends on "install-shared", so
> we Mike> need to force the DYEXT variable to "none" in order to bypass
> shared.
> 
> Does that then still install the shared lib for normal
> (!PREFER_STATIC_LIB) builds, or should this only be passed for the
> static case?

hmm, well Thomas' suggestion before doesnt work ... the current autotools 
Makefile only adds $(PKG)_MAKE_OPT to the build step instead of all the steps.  
so ignore this patch until that can be fixed.

the other 3 patches in this set dont require this one
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110123/70542dc5/attachment.asc>
