From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Nov 2009 17:03:26 +0100
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <87my2bdihl.fsf@macbook.be.48ers.dk>
References: <1259073650-3843-1-git-send-email-daniel@caiaq.de>
	<4B0BFF55.2090805@zacarias.com.ar>
	<87my2bdihl.fsf@macbook.be.48ers.dk>
Message-ID: <20091124160326.GX14091@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 24, 2009 at 04:56:22PM +0100, Peter Korsgaard wrote:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  Gustavo> Daniel Mack wrote:
>  >> +SSHFS_DEPENDENCIES = uclibc libglib2
> 
>  Gustavo> Hmmm... doesn't it depend on a userland ssh client (like openssh, maybe dropbear) to keep an open connection/pipe?
> 
> Indeed, and the uclibc dependency should get dropped (see 422ce6536b6)

Ok, will resend. But this is not a build-time dependency, so I'd say
adding BR_PACKAGE_OPENSSH to Config.in will suffice. And I wouldn't add
DROPBEAR there, as I didn't test that.

Daniel
