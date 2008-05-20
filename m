From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 20 May 2008 11:32:46 -0700
Subject: [Buildroot] Bootloaders
In-Reply-To: <326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>
	<48330E51.6050505@dspfl.com>
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>
Message-ID: <326f33790805201132t3092ac51h967a635a4d87c33c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Excuse me, I meant to say, make sure you do a "make clean" in both uClibc
and the main buildroot directory before doing continuing with "make" in your
Buildroot directory. There is no need to do a make clean for the kernel
since you didn't modify anything in it. Sorry about that.

On Tue, May 20, 2008 at 11:31 AM, Arun Reddy <reddyac@gmail.com> wrote:

> Jason,
>
> I had the same problem with the build process breaking and complaining
> about uClibc not having LFS support. There are some things you need to make
> sure you do. First of all, go into your Buildroot .config and make sure the
> LFS flag is toggled (within the toolchain submenu). Now change the uClibc
> .config LFS flag, which you seem to have already done. Do a make clean in
> both the kernel and uClibc directories (to make sure any junk binaries are
> cleaned out before continuing the build), then go back to the buildroot
> directory and make. That should take care of the LFS problem.
>
> As for the grub.mk modification, can you post the exact error you get with
> the debian site not being able to be resolved? I can cross reference that
> with my own grub.mk and see where I downloaded grub from.
>
>
> On Tue, May 20, 2008 at 10:45 AM, Jason Valenzuela <jvalenzuela@dspfl.com>
> wrote:
>
>> Arun Reddy wrote:
>>
>> > I am new to Buildroot as well. I have successfully created an x86 target
>> > with Grub as the bootloader. I was wondering if the error you're getting
>> > says something about not being able to resolve the debian ftp site? Are
>> > you able to even download grub from the correct repository first? I just
>> > want to know if it's a compiling problem or a problem with retrieving
>> > grub. If it's the latter than the problem lies within the actual
>> > Makefile, in that the repository is broken and you need to change the
>> > path for your development system to go grab it from.
>>
>> Ok so the buildroot make process it trying to pull a .diff from the
>> debian site that doesn't exist. I found that this is a known problem in
>> buildroot's bug tracking system. I tried two things, first I found the
>> actual .diff elsewhere, downloaded it into the dl directory and tried a
>> make. That crashes with complaints about uClibc being built without
>> large file support. Enabling large file support in uClibc's make
>> menuconfig also doesn't build.
>>
>> Next I tried to modify the grub.mk so that it downloads a slightly newer
>> .diff from the debian site. Was a real long shot and of course didn't
>> work either.
>>
>> So now I'm trying to simply build grub on my host system and see if I
>> can go from there.
>>
>>
>> Jason Valenzuela
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080520/9c83a14c/attachment-0001.htm 
