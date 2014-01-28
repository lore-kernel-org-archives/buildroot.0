From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
Date: Tue, 28 Jan 2014 23:06:05 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <20140128224133.3a145dd0@skate>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
 <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
 <20140128183202.GC3466@free.fr> <20140128224133.3a145dd0@skate>
Message-ID: <CAHKzcEN7NvA9XAiFEAZ9xpjp16YQYzNX2sucbmQ4ps_yRZrScA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 28 January 2014 22:41, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Tue, 28 Jan 2014 19:32:02 +0100, Yann E. MORIN wrote:
>
>> On 2014-01-28 11:50 +0100, Waldemar Rymarkiewicz spake thusly:
>> > > I am not sure I fully get your patch, what is wrong with putting
>> > > path/to/my_script.sh ? You don't have to specify the full path, a
>> > > relative path works well.
>> >
>> > Nothing is wrong to put full path to your scripts. Just a matter of
>> > what you prefer.
>> >
>> > Try to put script file in buildroot directory and set the post script
>> > variable  using just the name of the script. I does not work for me
>> > and I'm pretty sure it does not work for you as well. This is simply
>> > how Makefile calls the scripts.
>> >to
>> > This patch is just addition to run post scripts referenced by relative
>> > paths as well, nothing more.
>>
>> Why don't you just set:
>>   BR2_ROOTFS_POST_BUILD_SCRIPT="./my-script ./my-second-script"
>> (Ditto for BR2_ROOTFS_POST_IMAGE_SCRIPT.
>>
>> I'd say, we don't need that change. I prefer the user be explixit about
>> what he intends to do, rather than Buildroot guessing.
>
> I agree.

Let's leave it as it is now then.

The point was that neither manual nor menuconfig help explains how a
script should be referenced. By full path, relative or what. In my
case the easiest way was  just to put  "a space-separated list of
scripts" as per help message and it does not work. For someone who is
not dealing with buildroot frequently it can be an issue. Of course
you can always use ./your_script, but still it's not explained
anywhere. Abspath will fix it and it costs nothing, but I understand
your way of thinking.

Thanks,
/Waldek
