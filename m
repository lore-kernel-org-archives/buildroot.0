From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 24 Nov 2010 16:20:44 -0500
Subject: [Buildroot] [PATCH v2] linux: strip installed modules
In-Reply-To: <87r5ea4emv.fsf@macbook.be.48ers.dk>
References: <87oc9nad27.fsf@macbook.be.48ers.dk>
	<1290038143-17595-1-git-send-email-vapier@gentoo.org>
	<87r5ea4emv.fsf@macbook.be.48ers.dk>
Message-ID: <201011241620.45723.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, November 24, 2010 16:04:40 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  Mike> The installed kernel modules should have useless build cruft
>  Mike> stripped out of them.  On my system, a default build went from a
>  Mike> very unreasonable 30MB to a normal 3MB (on disk) and from 14MB to
>  Mike> 3MB when compressed due to the info stored in the kernel modules
>  Mike> alone.
> 
> Committed with a small change to not use binutils strip specific options
> (we support sstrip as well).

so STRIP_STRIP_UNNEEDED should have those flags added to it for the binutils 
case ... i'll send a patch to fix that.  otherwise we're leaving a crap in the 
target fs that only takes up space.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101124/ba504b95/attachment.pgp>
