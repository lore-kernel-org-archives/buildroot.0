From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Apr 2019 23:58:17 +0200
Subject: [Buildroot] Linux arch default cfgs and fragments
In-Reply-To: <CANQCQpZ3fyxSBbvkPURYj9LSYUKe7H9av+qvEwA3jvRFRrphaQ@mail.gmail.com>
References: <CANQCQpZ3fyxSBbvkPURYj9LSYUKe7H9av+qvEwA3jvRFRrphaQ@mail.gmail.com>
Message-ID: <4d2a6967-1451-7ed3-5465-05ca0d718019@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/04/2019 19:38, Matthew Weber wrote:
> Wanted to open the debate on the topic of using arch defconfigs and
> the negatives of where fragments may over time or between target
> kernel minor revisions have different end results because of the arch
> defconfig default state.
> 
> I'm wondering if when a arch defconfig is used the fragments against
> it should be validated as actually being in the final expanded
> config....  I see the merge config script has support to validate this
> but by default it isn't part of the process.

 I'm not sure in which context you're talking here. Is it for the in-tree
defconfigs? For those, it's fine for me if the exact configuration changes when
the kernel gets bumped, and it's up to the person doing the bump to make sure
that it stays reasonable/usable.

 Or is your suggestion that for our defconfigs, we should switch to the arch
defconfig + fragments as the general rule? I don't really agree with that. I'm
under the impression that the arch defconfigs are not very usable. They tend to
enable almost everything, seemingly randomly sometimes as module and sometimes
linked in. For example, the ARM defconfig has roughly 900 drivers...

 If it is for how users are maintaining their kernel configs, I don't think
there's anything we should prescribe.

 Regards,
 Arnout
