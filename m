From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Sep 2015 14:39:26 -0700
Subject: [Buildroot] User question UTF-8
In-Reply-To: <20150915232141.306098f6@free-electrons.com>
References: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
 <20150915232141.306098f6@free-electrons.com>
Message-ID: <CAJJ6jxs8G2G7QeE40nNH6EhGk9CxV6iqRYNTSbRPqB9wL262qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 15, 2015 at 2:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steve Calfee,
>
> On Tue, 15 Sep 2015 10:11:56 -0700, Steve Calfee wrote:
>
>> I am trying to port a python application to buildroot/busybox. It
>> needs to read disk files from removable drives. The filenames may
>> contain utf-8 chars.
>
> Are you actually sure they are UTF-8 encoded? I don't think characters
> in FAT16/32 filesystems are typically encoded as UTF-8, but rather some
> weird Windows-specific code page encoding.
>

Yes, I am sure. I wrote the vfat fs from ubuntu 14.04. I have also
successfully read the fs from recent raspian on a rpy.

>
>> Currently ls from busybox prints ? for the utf-8 non-ascii chars. Both
>> from console on minicom and from ssh (which should handle utf-8).
>
> Can you instead try if a UTF-8 encoded text file prints correctly? If
> it does, then the problem is really more of a filesystem character
> encoding issue than a problem in the UTF-8 support.
>
I did what you suggested, I wrote a text file with a few non-ascii
chars to the flash drive.

When I moved it back to the dockstar with my built buildroot/busybox.
I cat ed the file to minicom and
one of the names is Irish: Siobh?n McCarthy. And it printed a diamond
with a ? in it. Same when printed from the ssh terminal.

I also tried "export LANG=n_US.UTF-8". still same I am not sure what
the environment vars LC_ALL and LANG do and I did not enable them in
busybox anyway.

Thanks for the suggestions. I thought that all you Europeans here
would have solved this. Is there a defconfig the supports utf-8?

Steve
