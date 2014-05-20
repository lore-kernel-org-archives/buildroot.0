From: cem akpolat <akpolatcem@gmail.com>
Date: Tue, 20 May 2014 16:38:46 +0200
Subject: [Buildroot] Fwd: Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAAXf6LWNcwXYyDHBKx0HZUndv2BE3jZYqKwQt=-7GMjjuGuNzA@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
 <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
 <20140520113955.475370b3@free-electrons.com>
 <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
 <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
 <CAAXf6LUC7Vki85_4iVr-AhijdjpXxHQoYOVSgUAdJcta4-jb6A@mail.gmail.com>
 <CAMm5YqqioD+6fDWrTW+Jo=wxpCWRet33MJ_OL7=pyFCgbL1ojQ@mail.gmail.com>
 <CAAXf6LU+UjV3-xWQa5K8CNu79z-2cOoHZgAhmCrxbgth_YFLiw@mail.gmail.com>
 <CAMm5YqoWFFVf5RkG_N0_S2R3xawSt0T9rEgH4AMJNDu27Ox7Zw@mail.gmail.com>
 <CAAXf6LWn_BwZPG7B_zoQPqN4Sr=4b+wLNz+-EKHfCdU0LD6nHQ@mail.gmail.com>
 <CAMm5YqqUYHNGXRYeBzLAcv_ZF5y83GpODD84ZhZpXGxSrURoDQ@mail.gmail.com>
 <CAAXf6LWNcwXYyDHBKx0HZUndv2BE3jZYqKwQt=-7GMjjuGuNzA@mail.gmail.com>
Message-ID: <CAMm5YqoA-rGbvRZ=GLb_iqpuUdmBNOe8fbcxvnApJThE3nGsxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I noticed the same failure:  you do not
have g++ on your machine.

Then I checked whether there is any link to g++, actually there is any g++
command, I assigned through the command sudo ln -s /usr/bin/g++-4.8 g++,
then recompile it again.
The compilation is now finished without errors. If I see this issue next
time, the only thing that I will do is to look at package/Makefile.in. I
assume that the whole configuration, if any of them aren't overwritten in a
package, is in the previous mentioned file. If I see the same error, first
of all I should check the commands that you provided me.

I cannot notice every detail sometimes, buildroot is quite new to me :).

Thank you so much,



Cem Akpolat


On Tue, May 20, 2014 at 4:25 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Cem,
>
> On Tue, May 20, 2014 at 3:29 PM, cem akpolat <akpolatcem@gmail.com> wrote:
> > Hi Thomas,
> >
> > the line starting wirh @@@@
> >
> >
> > akpolat at akpolatX240:~/mysvn/buildroot$ make
> > package/Makefile.in:211: @@@@@@@ TARGET_CPP
> >
> value='/home/akpolat/mysvn/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-cpp'
> > origin='file'
>
> Well this looks normal too. I'm puzzled about the cause of your original
> error.
>
> >
> >
> > You may have to install 'g++' on your build machine
>
> This message gives the explanation for the host-m4 error: you do not
> have g++ on your machine.
> The config.log file says:
>
> configure:5351: checking how to run the C preprocessor
> configure:5421: result: cpp
> configure:5441: cpp
> -I/home/akpolat/mysvn/buildroot/output/host/usr/include conftest.c
> ./configure: line 2631: cpp: command not found
> configure:5441: $? = 127
>
> So the host toolchain is not present, and this is needed to build the
> target toolchain.
>
> However, in a previous run it seemed you already had the target
> toolchain, so I wonder how you achieved this.
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140520/291a689f/attachment.html>
