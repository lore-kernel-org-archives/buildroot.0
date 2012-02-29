From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 29 Feb 2012 08:41:07 +0100
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <201202282219.30414.arnout@mind.be>
References: <jhub5r$smv$1@dough.gmane.org> <jijhcf$a6d$1@dough.gmane.org>
 <4F4D4FE4.3020506@gmail.com> <201202282219.30414.arnout@mind.be>
Message-ID: <CAAXf6LUS+aYLQ3vneJKJMd+4TNQ6UGH+rAywr4k6C1Z4AXe7Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 28, 2012 at 11:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 28 February 2012 22:06:28 Steve Calfee wrote:
>> > I seem to be completely lost. ?Is board/mycompany/myproduct/skeleton
>> > above a post-build script or a custom skelecton (something you set
>> > BR2_ROOTFS_SKELETON_CUSTOM_PATH to point to)?
>> Hi Grant,
>>
>> I was not aware of that config option. In fact there are no uses of it
>> in the current /board... stuff. What I and what I think others have done
>> is create my own mini-skeleton in the board.... directory. I can then
>> stick in scripts, etc files and maybe even externally built binaries
>> into /usr/bin/ in my local area. Then when the post build script is
>> executed I just copy all the files from my skeleton to the target
>> skeleton. This will overlay the default stuff (that are duplicates in my
>> area) and add any new stuff. After the post-build script the target
>> skeleton will get all packaged up as a rootfs for your target system.
>>
>> Someone else will have to describe what that option is for.
>
> ?If you ask me, BR2_ROOTFS_SKELETON_CUSTOM_PATH is indeed useless and
> should be deprecated.

Although I'm not using it myself, I don't think this needs to be
deprecated. I can imagine that there are users who have a
significantly different skeleton that it would be a nuisance to have
to tweak it from a script.

Although we may recommend in the docs to use the post-build script +
rootfs-additions, I would keep the custom option as well.

Best regards,
Thomas
