From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 05 Dec 2014 12:49:16 -0800
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <5480D628.1070303@gmail.com>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
 <2598910.830VmRFfsL@aquila> <5480B48A.8060705@gmail.com>
 <2300509.9auvbGzPAa@sagittea> <5480D628.1070303@gmail.com>
Message-ID: <54821A4C.2080002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, All,

On 12/04/2014 01:46 PM, Gary Bisson wrote:
> [snip]
>> It looks like you enabled EGLFS in Qt5. EGLFS need framebuffer 
>> version of gpu-
>> viv-bin-mx6q. If you want to use X11, you have to enable xcb in qt5 
>> (as in
>> example in commit log of "07/14 xdriver_xf86-video-imx-viv").
>>
>> I do not see any simple generic solution to prevent user to choose 
>> EGLFS in Qt
>> if X11 backend is selected in gpu-viv-bin-mx6q :-(
>>
>> You will find below configuration I use for X11:
>>     https://gist.github.com/jerome-pouiller/a35bcd4a65a49d5683d1
>
> That might be the case yes although I don't remember specifying EGLFS 
> but I might have mixed up different configs. I'll try building the 
> your config for X11 and let you know.

Using your X11 config + adding the Qt worked fine. Here are the demo 
apps tested:
- tutorial7 from Vivante examples (to make sure 3D acceleration is 
working fine
- hellogl_es2 from Qt5 examples

Tested-by: Gary Bisson <bisson.gary@gmail.com>

As for the review, everything looks good to me apart from the 
qmx6_defconfig which I think should be split in 2 (one qmx6_defconfig 
minimalistic, one qmx6_qt5_demo_defconfig).

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141205/e42a95e3/attachment.html>
