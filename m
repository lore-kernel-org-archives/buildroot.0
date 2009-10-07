From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 7 Oct 2009 15:41:05 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add a patch to link against
 SEM_INIT libs
In-Reply-To: <8763armir5.fsf@macbook.be.48ers.dk>
References: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
	<1254826414-20763-2-git-send-email-daniel@caiaq.de>
	<8763armir5.fsf@macbook.be.48ers.dk>
Message-ID: <20091007134105.GW9361@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 03:33:02PM +0200, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  Daniel> This patch is needed to make e2fsprogs being linked against
>  Daniel> SEM_INIT libraries. In this particular case, it causes the
>  Daniel> Makefiles to add -lpthread. Without that, all binaries crash
>  Daniel> at startup, at least on x86.
> 
> But your patch removes stuff (PRIVATE_LIBS_CMT), it doesn't add
> anything?

The e2fsprog make setup is really screwed. They set PRIVATE_LIBS_CMT to
"#" in configure which then causes all subsequent paramters to get
ignored. As I think 'CMT' stands for 'comment', I guess this is
intended. Took me awhile to find out what they do, too ;)

Daniel
