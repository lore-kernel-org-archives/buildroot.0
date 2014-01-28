From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 28 Jan 2014 11:16:48 +0100
Subject: [Buildroot] [PATCH] lvm2: fix static building when
	BR2_PREFER_STATIC_LIB is used
In-Reply-To: <87bnyw5sa2.fsf@dell.be.48ers.dk>
References: <1390207114-2808-1-git-send-email-fabio.porcedda@gmail.com>
 <8761p5nlox.fsf@dell.be.48ers.dk>
 <CAHkwnC-oqmBKoFOygQt3nBsMdNXQ6pUyvrKJkqkJcL5WRoAbSQ@mail.gmail.com>
 <87bnyw5sa2.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC_UsVdtwsdtupMNBtG07gMR=hQfedPMR3cccM-MMHb0Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 28, 2014 at 11:12 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
>  > On Mon, Jan 27, 2014 at 10:45 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  >>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>  >>
>  >> > To fix static building:
>  >> > - Add "--enable-static_link" to the configure options.
>  >> > - Because the shared executables don't build with
>  >> >   BR2_PREFER_STATIC_LIB add a patch to disable it.
>  >>
>  >> > Fixes:
>  >> > http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/
>  >>
>  >> Thanks. Has this patch been submitted upstream?
>
>  > Hi Peter,
>  > I've not submitted to upstream this patch.
>  > I think to be able to submit it to upstream it needs more work to be done.
>  > Unfortunately right now i don't have much free time to do that.
>  > IMHO there is a chance that upstream does not want to changes the
>  > behavior of lvm static building to suits buildroot.
>
> Ok, in that case - Do we really want to support static linking of LVM2?
> We can also just make it depend on !BR2_PREFER_STATIC_LIB (and also
> adjust udisk).
>
> lvm2 is probably not often used in situations where static linking is
> critical, is it?

It's fine for me.
I'll sent a patch for disabling static linking for lvm2.

> I dislike adding feature patches to Buildroot if they cannot go
> upstream.

Best regards
-- 
Fabio Porcedda
