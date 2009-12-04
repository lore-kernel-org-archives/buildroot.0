From: Olivier Perron <olivier.perron12@gmail.com>
Date: Fri, 4 Dec 2009 16:49:21 +0100
Subject: [Buildroot] Trying to build in an usual place: /opt instead of /
In-Reply-To: <200912011242.47113.minimod@morethan.org>
References: <5cd84ac80912010510k26f4af64x6234af2e35adbde1@mail.gmail.com> 
	<5cd84ac80912010610m79367ab8y592538cc0dac1823@mail.gmail.com> 
	<5cd84ac80912010618n334b9ecck27b26d2b493dca39@mail.gmail.com> 
	<200912011242.47113.minimod@morethan.org>
Message-ID: <5cd84ac80912040749h6ab022b8nc221d7ccc5298d7d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 1, 2009 at 7:42 PM, Michael S. Zick <minimod@morethan.org> wrote:
> On Tue December 1 2009, Olivier Perron wrote:
>> [...]
>> >>>
>> >>
>> >> Why not using chroot ?
>> >>
>> >
>> > Because I still need to access /dev ?
>> >
>>
>> Hum... bad answer !
>> # mkdir /opt/dev
>> # mount -o bind /dev /opt/dev
>> before chrooting should do the trick.
>>
>
> You don't need that, unless you want the changes made in
> the chroot/dev to show up outside of the chroot.
>
> Just initialize the device nodes in chroot/dev, they will
> work just fine there (the kernel uses the device numbers,
> not the path).
>
> Presuming a bare busybox in chroot/bin - (/opt/test/bin)
> Here is the short version:
>
> mount -t proc proc /opt/test/proc
> mount -t sysfs sysfs /opt/test/sys
> chroot /opt/test /bin/busybox sh
> /bin/busybox --install -s
> mdev -s
>
> Your done. ?Have fun.
>
> Mike

Mike,

this doesn't work (well not completely).
Once chrooted, when I want to start X I got an error which says:
Fatal server error:
xf86OpenConsole: Cannot find a free VT: Inappropriate ioctl for device

My solution (to mount with the -bind option) works ok.

Cheers
Olivier
