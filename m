From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jun 2021 15:04:51 +0200
Subject: [Buildroot] [PATCH] package/lvm2: default standard install to y
In-Reply-To: <877disd5lk.fsf@dell.be.48ers.dk>
References: <20210616173303.2234867-1-arnout@mind.be>
 <877disd5lk.fsf@dell.be.48ers.dk>
Message-ID: <c8486320-9032-33c3-8227-b9baf90af341@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/06/2021 14:43, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > Until commit 5c07dfcc1a52e2804011574a3e022523a20546c8
>  > BR2_PACKAGE_LVM2_STANDARD_INSTALL would default to y. Indeed, the
>  > default read:
> 
>  >       default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
> 
>  > Since the legacy symbol is normally not selected, this defaults to y.
> 
>  > Commit 5c07dfcc1a52e2804011574a3e022523a20546c8 inadvertedly removed the
>  > entire line instead of just the condition.
> 
>  > Fixes: https://bugs.busybox.net/show_bug.cgi?id=13846
>  > For-stable: 2021.02, 2021.05
>  > Cc: dominique.tronche at atos.net
>  > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > --
>  > As an experiment, I added the For-stable tag (which I invented myself).
>  > Peter, is this useful? Should we propose this in the documentation?
> 
> It could be. Typically just mentioning that this is a fix and/or CC me
> is enough, but it cannot hurt certainly.

 I'm mostly thinking about finding out to which stable branches it applies.
Currently, contributors rarely go through the effort of checking that. So the
question is: is it worth your while to ask contributors to check to which stable
branches a fix is applicable?

 I've added "Fixes: <sha1>" tags a few times, but then I realized it doesn't
actually help a lot.

 Regards,
 Arnout
