From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 28 Feb 2012 14:06:28 -0800
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <jijhcf$a6d$1@dough.gmane.org>
References: <jhub5r$smv$1@dough.gmane.org> <4F435977.1060001@lucaceresoli.net>
 <ji0b7n$2hl$1@dough.gmane.org> <201202282038.54757.arnout@mind.be>
 <jijfkp$qv0$1@dough.gmane.org> <4F4D4751.1030906@gmail.com>
 <jijhcf$a6d$1@dough.gmane.org>
Message-ID: <4F4D4FE4.3020506@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/2012 01:36 PM, Grant Edwards wrote:
> On 2012-02-28, Steve Calfee<stevecalfee@gmail.com>  wrote:
>> On 02/28/2012 01:06 PM, Grant Edwards wrote:
>>> On 2012-02-28, Arnout Vandecappelle<arnout@mind.be>   wrote:
>>>> On Tuesday 21 February 2012 14:54:47 Grant Edwards wrote:
>>>> [snip]
>>>>> I don't want to replace the default skeleton.  I want to add some
>>>>> files to it, and possible modify a few.  The documentation describes
>>>>> two ways to do that:
>>>>>
>>>>>     1) package/customize
>>>>>
>>>>>     2) post-build script
>>>>>
>>>>> I'm told 1) is now depricated, so I'm switching to 2).
>>>>>
>>>>> Where under board/mycompany/myproduct do you put "extra" files that
>>>>> will be added to the standard skeleton?
>>>> I put it in board/mycompany/myproduct/skeleton.  Although
>>>> rootfs-additions would be a better name than skeleton.
>>> Ah, perhaps I've misunderstood what a custom skeleton was for the past
>>> several years.  I thought it was the basis for the filesystem.  Is the
>>> custom skeleton something that's _added_ on top of the default
>>> skeleton rather than used in place of it?
>>>
>> Perhaps, but it is your script. If you want to completely replace the
>> existing skeleton you can, but I think it makes more sense to just
>> overlay new stuff on top of the default skeleton.
> I seem to be completely lost.  Is board/mycompany/myproduct/skeleton
> above a post-build script or a custom skelecton (something you set
> BR2_ROOTFS_SKELETON_CUSTOM_PATH to point to)?
Hi Grant,

I was not aware of that config option. In fact there are no uses of it 
in the current /board... stuff. What I and what I think others have done 
is create my own mini-skeleton in the board.... directory. I can then 
stick in scripts, /etc/ files and maybe even externally built binaries 
into /usr/bin/ in my local area. Then when the post build script is 
executed I just copy all the files from my skeleton to the target 
skeleton. This will overlay the default stuff (that are duplicates in my 
area) and add any new stuff. After the post-build script the target 
skeleton will get all packaged up as a rootfs for your target system.

Someone else will have to describe what that option is for.

Regards, Steve
>> This makes your new skeleton much smaller, and since it is run after
>> every build, you don't have to wonder if changes make it to the
>> target filesystem, it always does.
