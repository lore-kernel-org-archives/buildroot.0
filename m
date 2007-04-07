From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Sat, 7 Apr 2007 06:31:44 -0700 (PDT)
Subject: [Buildroot] frame buffer problems
In-Reply-To: <43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
	<43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>
Message-ID: <2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The frame buffer test program I am using does the following:

A.  Open /dev/fb/0 with fb_ptr = open("/dev/fb/0", O_RDWR);
B.  ioctl(frame_buffer_ptr, FBIOGET_FSCREENINFO, &fix_info);
C.  ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);
D.  fbp = (char *)mmap(0, screensize, READ | WRITE, MAP_SHARED, fb_ptr, 0);


1.  If the kernel is compiled using buildroot version 17224
    and run in a buildroot version 17224 root filesystem it
    is failing with errno = -1 on

    errno = ioctl(frame_buffer_ptr, FBIOGET_FSCREENINFO, &fix_info);

2.  If the kernel is compiled using buildroot version 15763 but
    run in a buildroot 17224 root filesystem, the failure occurs
    when trying to map the framebuffer to memory using mmap with
    a return value of -1.


Nina




> On 4/6/07, nina.holly at aerende.com <nina.holly@aerende.com> wrote:
>> Hi,
>>     I am using Linux 2.6.10 with devfs on ARM.  I know that
>> devfs is deprecated/obsolete.  The framebuffer works fine
>> with buildroot svn version 15763.  But when I switched to
>> buildroot version 17224 I get a return value < 0 when I try to execute
>>
>> ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);
>
> Was the return value -14 or -19?
>
>   Luis
>
