From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun, 20 Sep 2020 14:31:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/graphicsmagick: remove
 redundant BR2_USE_WCHAR condition
In-Reply-To: <20200920134950.767fa40d@windsurf>
References: <20200918172135.85009-1-grzegorz@blach.pl>
 <20200918172135.85009-2-grzegorz@blach.pl>
 <20200919143332.1d21cc2e@windsurf.hq.k.grp>
 <dbcd34e0-8480-0eb9-123f-d411a2807c5d@blach.pl>
 <20200920134950.767fa40d@windsurf>
Message-ID: <6007aaeb-01b0-3184-1739-05ea7d364519@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2020 13:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 20 Sep 2020 11:18:52 +0200
> Grzegorz Blach <grzegorz@blach.pl> wrote:
> 
>>> In what sense is the BR2_USE_WCHAR dependency redundant ? Redundant
>>> with what ?
>>
>> I mean that graphicsmagick supports C++ whenever WCHAR is enabled or
>> not.
> 
> Are you sure about this ? graphicsmagick.mk is copy/pasted from
> imagemagick.mk, and in imagemagick.mk, this BR2_USE_WCHAR also exists,
> and was explicitly added by:
> 
> commit b339bb5641c59ad2e19aeb95c1387584c7c2aeab
> Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Date:   Mon Aug 12 09:06:58 2013 -0300
> 
>      imagemagick: fix magick++-config fixup error
>      
>      Magic++ bindings are built only with C++ and WCHAR toolchains.
>      Add a WCHAR toolchain check for the magick++ config fixup.
>      Looking into the future the fixup shouldn't bail on a missing file so we
>      can avoid awkward kludges for packages that have many options and config
>      files.
>      Fixes:
>      http://autobuild.buildroot.net/results/33a/33ac4b17866a64379b7bab3c0549f6e075c98dde/
>      
>      Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>      Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Of course, perhaps graphicsmagick is different. Have you done a test
> build with C++ support enabled, but wchar disabled, and confirmed that
> Magick++-config was there ?

Yes, I've done this test and GraphicsMagick++-config exists.

Also I am sure that 
https://github.com/hzeller/rpi-rgb-led-matrix/blob/master/utils/led-image-viewer.cc 
works correctly with WCHAR disabled.

> Thanks!
> 
> Thomas
> 
