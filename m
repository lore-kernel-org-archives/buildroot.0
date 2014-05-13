From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 13 May 2014 10:57:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-11
In-Reply-To: <20140513094426.335d2361@free-electrons.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
Message-ID: <CAHXCMMKB_x6BEMSD-hXmVO-erariQAD-Yt8xC2nArBxfQf+9hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Tue, May 13, 2014 at 9:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 12 May 2014 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:
>
>>      nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/7864cd5789a9f9b9f0603d738f4e63822d8469dd/
>
> Will be fixed once http://patchwork.ozlabs.org/patch/348125/ is
> committed.
>
>>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6a89535c0806939dcb6d4160899bd242a0648fb8/
>
> uClibc static linking issue.
>
>>     mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8ca7fb8e4b1da8c1a7e4d646469779e4032877ab/
>
> /home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(control_shm.o): In function `_snd_ctl_shm_open':
> control_shm.c:(.text+0x1550): warning: gethostbyname is obsolescent, use getnameinfo() instead.
> /home/test/test/2/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4): undefined reference to `_snd_module_rawmidi_virt'
> collect2: error: ld returned 1 exit status
>
>>       bfin |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
>
> Weird stuff going on. Samuel?

This is related to the bfin "_" symbol prefix in clapack.
I'm cooking a patch disabling clapack and its reverse deps. on bfin.

Regards

-- 
Samuel
