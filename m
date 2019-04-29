From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Apr 2019 09:39:52 -0500
Subject: [Buildroot] Linux arch default cfgs and fragments
In-Reply-To: <4d2a6967-1451-7ed3-5465-05ca0d718019@mind.be>
References: <CANQCQpZ3fyxSBbvkPURYj9LSYUKe7H9av+qvEwA3jvRFRrphaQ@mail.gmail.com>
 <4d2a6967-1451-7ed3-5465-05ca0d718019@mind.be>
Message-ID: <CANQCQpaeXHvgzqScpPDbwHoOhU=f9_5kn-hMPra+aC8A5YVr-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Apr 27, 2019 at 4:58 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/04/2019 19:38, Matthew Weber wrote:
> > Wanted to open the debate on the topic of using arch defconfigs and
> > the negatives of where fragments may over time or between target
> > kernel minor revisions have different end results because of the arch
> > defconfig default state.
> >
> > I'm wondering if when a arch defconfig is used the fragments against
> > it should be validated as actually being in the final expanded
> > config....  I see the merge config script has support to validate this
> > but by default it isn't part of the process.
>
>  I'm not sure in which context you're talking here. Is it for the in-tree
> defconfigs? For those, it's fine for me if the exact configuration changes when
> the kernel gets bumped, and it's up to the person doing the bump to make sure
> that it stays reasonable/usable.
>

Yes for the in-tree arch default configs.  I think we should be
running a configuration check on those when used with fragments to
help the developer know that the fragments are working.

>  Or is your suggestion that for our defconfigs, we should switch to the arch
> defconfig + fragments as the general rule? I don't really agree with that.

Nope not suggesting that.

>  If it is for how users are maintaining their kernel configs, I don't think
> there's anything we should prescribe.

I was just curious if we can make the use of fragments a bit more
foolproof as options get dropped and you have to watch the warnings to
catch when they do.  (Hopefully my response above was clear.  Just
this arch default case or even when initially setting up fragments, it
would be nice to validate they are doing what's intended to the
config)

Matt
