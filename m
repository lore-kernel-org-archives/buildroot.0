From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 21:09:49 +0200
Subject: [Buildroot] Qt5WebKit anf gcc 6.x
In-Reply-To: <1474471693.4311.28.camel@synopsys.com>
References: <1474471693.4311.28.camel@synopsys.com>
Message-ID: <20160921210949.7ce47d0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 15:28:21 +0000, Alexey Brodkin wrote:

> In its turn "-isystem XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include"
> appears in ICU's check Makefile because
> --------------------->8-------------------  
> ./pkg-config_wrapper.sh --cflags icu-i18n
> -IXXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
> --------------------->8-------------------  
> and that include path matches with one entry from?QMAKE_DEFAULT_INCDIRS.
> In that case qmake makes an assumption that it's a system path and adds "-isystem".

Are you sure about this? I don't see this happening anywhere in the
qmake source code. I do see some isystem related code around
QMAKE_CFLAGS_ISYSTEM and INCLUDEPATH.

In any case, I believe this is where the problem is: I don't see why
Qt5 should mess up with the addition of -isystem flags.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
