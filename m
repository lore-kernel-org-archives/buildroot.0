From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Aug 2017 19:07:50 +0200
Subject: [Buildroot] Failing bind 9.11.1-P3 configure failure
In-Reply-To: <15dbf45f074-58b7-6223@webprd-a18.mail.aol.com>
References: <15dbf45f074-58b7-6223@webprd-a18.mail.aol.com>
Message-ID: <20170808190750.21fad1a3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 'grunpferd',

On Mon, 7 Aug 2017 20:36:58 -0400, grunpferd at netscape.net wrote:

> 
> It looks like there is some confusion over the local existence of header files resulting in error during configure.
> 
> 
> 
> > Local build of bind here (with a random configuration) succeeds, mind to try
> > the following buildroot patch:
> I used the +       --without-lmdb \ option and that does work.

Thanks for testing...

> 
> 
> I guess the the real issue is why it is looking at local header files at all, rather than the buildroot headers.
> Also I presume why bind wants to try and use -lmdb is to speed up some object store and retrieval,
> so maybe the right solution is to build a local version of mdb and have host headers and library available for the target.

Yes this would be a nice buildroot feature, but I think there is no lmdb (Lightning
Memory-mapped Database) package yet in buildroot to use...

Regards,
Peter

> I have not tested the BR2_COMPILER_PARANOID_UNSAFE_PATH facility, prefer to let the build complete so I can test the resulting rootfs first!
> 
> 
> Ross
> 
> 
