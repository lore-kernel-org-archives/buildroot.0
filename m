From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 24 Nov 2015 11:01:15 -0500
Subject: [Buildroot] [v3 0/2] openssl: parallel build
In-Reply-To: <CAMQcK5+S=aDv3qtA6vdzeqgqSq6Xd4xUBYjvHQat=pg1Ot72gA@mail.gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <20151118135709.125f4afd@free-electrons.com>
 <CAMQcK5+S=aDv3qtA6vdzeqgqSq6Xd4xUBYjvHQat=pg1Ot72gA@mail.gmail.com>
Message-ID: <20151124160115.GK23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 Nov 2015 13:41, Ryan Barnett wrote:
> On Wed, Nov 18, 2015 at 6:57 AM, Thomas Petazzoni wrote:
> >Does Gentoo has some more patches?
> 
> No this is the only patch for openssl 1.0.2d. There also hasn't been
> any updates to this patch other then the one that is currently there.

that's incorrect.  you have to look at the ebuild and then see that we apply
four parallel patches for 1.0.2d, one of which specifically for this issue.

https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/openssl/openssl-1.0.2d-r2.ebuild?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
		epatch "${FILESDIR}"/${PN}-1.0.2d-parallel-build.patch
		epatch "${FILESDIR}"/${PN}-1.0.2a-parallel-obj-headers.patch
		epatch "${FILESDIR}"/${PN}-1.0.2a-parallel-install-dirs.patch
		epatch "${FILESDIR}"/${PN}-1.0.2a-parallel-symlinking.patch #545028
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151124/dccb3f2f/attachment.asc>
