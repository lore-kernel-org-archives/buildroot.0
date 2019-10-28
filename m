From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 28 Oct 2019 14:04:04 +0100
Subject: [Buildroot] buildroot opencv3 python3 gst1-validate
In-Reply-To: <1787882546.2177972.1572265527090@mail.yahoo.com>
References: <1787882546.2177972.1572265527090.ref@mail.yahoo.com>
 <1787882546.2177972.1572265527090@mail.yahoo.com>
Message-ID: <2065f268-3992-fb47-d91d-f047a9c937d4@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ross,

Please do not contact Buildroot contributors directly by email, you 
should rather post this kind of questions to the mailing list 
(buildroot at buildroot.org).


I don't see how you would presume that I built opencv3 with python3, 
since the patch you mention (http://patchwork.ozlabs.org/patch/1185306/) 
is only about gst1-validate. Maybe there is something I'm missing out ?


I did not ran a full build with this patch, I use the utils/test-pkg 
tool included in Buildroot to make sure the build succeeds for that 
particular package, which is the case. My primary goal here is to port 
as much as possible Py2 only packages to Py3, in an effort to remove 
Python2 which is getting EOL in 2 months.


Regards,

Titouan
On 10/28/19 1:25 PM, grunpferd at netscape.net wrote:
> G'day,
> 
> I was interested in your patch to get gst1-validate to build with python3.
> 
>  From your post I presume you have successfully been able to build 
> opencv3 with python3.
> 
> Is this the case?
> 
> I am currently building against the buildroot git master.
> 
> 
> I am trying to build opencv3 with python3 under buildroot.
> However after the build of opencv is almost complete.
> 
> I get the following error:
> 
> [ 99%] Built target opencv_stitching
> make[3]: Entering directory 
> '/h/rfg/w/buildroot_ptg9/output/build/opencv3-3.4.6/buildroot-build'
> Scanning dependencies of target opencv_python3
> make[3]: Leaving directory 
> '/h/rfg/w/buildroot_ptg9/output/build/opencv3-3.4.6/buildroot-build'
> make[3]: Entering directory 
> '/h/rfg/w/buildroot_ptg9/output/build/opencv3-3.4.6/buildroot-build'
> [100%] Building CXX object 
> modules/python3/CMakeFiles/opencv_python3.dir/__/src2/cv2.cpp.o
> /h/rfg/w/buildroot_ptg9/output/build/opencv3-3.4.6/modules/python/src2/cv2.cpp:9:10:fatal 
> error: Python.h: No such file or director
> y
>  ???9 | #include <Python.h>
>  ?????| ^~~~~~~~~~
> compilation terminated.
> make[3]: *** 
> [modules/python3/CMakeFiles/opencv_python3.dir/build.make:63: 
> modules/python3/CMakeFiles/opencv_python3.dir/__/src2/cv2
> .cpp.o] Error 1
> make[3]: Leaving directory 
> '/h/rfg/w/buildroot_ptg9/output/build/opencv3-3.4.6/buildroot-build'
> 
> 
> So it looks to me like some confusion between python and python3 headers.
> 
> 
> Is it possible to get a copy of any configuration .config that builds 
> with python3 gst1 and opencv?
> 
> 
> Just so I can check some of the assigned buildroot options.
> 
> I am also keen to try your patch for gst1-validate
> 
> 
> Regards,
> 
> Ross Green
> 
> 
