From: Koen Martens <gmc@sonologic.nl>
Date: Tue, 19 Nov 2019 10:49:51 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linuxconsoletools: bump
 version to 1.7.0
In-Reply-To: <20191119091257.5ac42dda@windsurf.home>
References: <20191117135913.GD13372@coltrane>
 <20191118223853.64c89953@windsurf.home> <20191119064433.GB32125@coltrane>
 <20191119091257.5ac42dda@windsurf.home>
Message-ID: <70a81f98d956cddb1b4575cc017a2983@sonologic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-11-19 09:12, Thomas Petazzoni wrote:
> Hello Koen,
> 
> On Tue, 19 Nov 2019 07:44:33 +0100
> Koen Martens <gmc@sonologic.nl> wrote:
> 
>> > I don't understand why you say that, because:
>> >
>> > config BR2_PACKAGE_SDL2
>> >         bool "sdl2"
>> >         depends on !BR2_STATIC_LIBS
>> 
>> Well, it doesn't pick up that dependency is what i meant, so i need
>> to depend on it in this package explicitly as well.
> 
> OK, I guess I was confused by the formulation. Having to replicate
> those "depends on" is perfectly normal in the context of Buildroot, but
> your commit log made it sound like there was something unusual.

That is probably because I was a bit confused by the behaviour, given 
that
I'm not a Kconfig guru. Arnout explained it to me, and I understand it
better now. I'll see about rewording the commit message.

>> > This looks wrong because you're no longer passing TARGET_CFLAGS, so
>> > this should be:
>> >
>> > 	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>> >
>> > (I think the option is -std, not --std).
>> 
>> I'll see if I can find some time to address your comments. Might be a 
>> week
>> or two before I find the time.
> 
> OK, then I'll guess I'll try to apply the patch and do the fixup
> locally. Of course, I'll notify you if I do that.

I don't think there is any hurry, the update doesn't introduce any 
spectacular
new features or bugfixes, so it can wait. You're probably busy enough as 
it is.
I'll see if I can expedite things a bit.

>> Meanwhile, I'm unsubscribing from the list again since it is just too
>> much. I'll resubscribe when I have a new patch ready.
> 
> You don't have to unsubscribe each time: you can switch to nomail mode,
> i.e a mode where you are subscribed to the mailing list, but you do not
> receive all the e-mails. This allows you to send patches whenever you
> want, without being flooded by the admittedly significant mailing list
> traffic. Since we always Cc: contributors when replying to their
> patches, you would receive our replies even if you're in nomail mode.
> Just login to the mailman web interface, and you will be able to switch
> to nomail.

Ah thanks, that's an excellent suggestion. I'm a bit out of practice 
with this
whole mailman thing.

Cheers,

Koen
