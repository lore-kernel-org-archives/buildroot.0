From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Thu, 12 Apr 2007 08:00:28 -0700 (PDT)
Subject: [Buildroot] frame buffer problems
In-Reply-To: <87tzvoogsd.fsf@sleipner.barco.com>
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>   
	<43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>   
	<2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>   
	<87tzvoogsd.fsf@sleipner.barco.com>
Message-ID: <2831.63.193.249.101.1176390028.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "nh" == nina holly <nina.holly@aerende.com> writes:
>
> Hi,
>
> nh> The frame buffer test program I am using does the following: A.
> nh> Open /dev/fb/0 with fb_ptr = open("/dev/fb/0", O_RDWR);
>
> Do you have a /dev/fb/0?

Yes, I do have a /dev/fb/0.

>What is it's major/minor numbers?

% ls -l /dev/fb/0
crw-rw-rw- 1 root root 29, 0 Dec 31 17:00 /dev/fb/0

> What is the return value of open?

Return value of open = -1

>
> nh> ioctl(frame_buffer_ptr, FBIOGET_FSCREENINFO, &fix_info); C.
> nh> ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);
>
> And of the ioctls?

Return value of ioctl for fixed info    = -1
Return value of ioctl for variable info = -1


I have another frame buffer program that draws a checkerboard
on the screen.  On the same buildroot version and board the
return values from open and the ioctls are not less than zero,
but the program crashes with a segmentation fault when pixels
are written to the screen buffer.  The return values are

Return value of open = 3
Return value of ioctl for fixed info    = 0
Return value of ioctl for variable info = 0



Thanks,

Nina

>
> --
> Bye, Peter Korsgaard
>
