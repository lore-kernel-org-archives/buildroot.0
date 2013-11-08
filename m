From: Peter Katzmann <peter.katzmann@edag.de>
Date: Fri, 08 Nov 2013 11:04:10 +0100
Subject: [Buildroot] Problems to build udev on 2013.08.1
In-Reply-To: <20131108093330.5d32ce2c@skate>
References: <527C9EF1.1020905@edag.de> <20131108093330.5d32ce2c@skate>
Message-ID: <527CB71A.4050303@edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
thank you for your fast answer.
I started immediately a  testbuild with the advised  patch and it is now 
working as expected.

Thanks again

peter

Thomas Petazzoni wrote:
> Dear Peter Katzmann,
>
> On Fri, 08 Nov 2013 09:21:05 +0100, Peter Katzmann wrote:
>
>> i have two buildroot projects. One requires udev.
>> I get always the same error (at the end).
>> So i took my second project, enabled udev there also and the same
>> error. One project is with linaroo and the other one with eglibc/gcc.
>> I also tried the build on different Platforms (Opensuse 12.3/13.1
>> Ubuntu 10.04/12.04/13.10), always the same problem.
>>
>> It seems that somewhere a wrong link or duplicating of the path leads
>> to the error.
>>
>> Attached is the config of the eglibc project.
>>
>> peter
>>
>>     CCLD   collect
>> libtool: link: warning: library
>> `/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libblkid.la'
>> was moved.
> Building from a path that starts with /usr is not supported. This is
> something we have to fix, but it hasn't been done so far.
>
> See https://bugs.busybox.net/show_bug.cgi?id=6470.
>
> Best regards,
>
> Thomas
