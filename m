From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 15 May 2007 12:18:50 +0200
Subject: [Buildroot] Iptables incompatible with linux-headers!
In-Reply-To: <1179223088.3613.14.camel@localhost>
References: <1179181946.6609.17.camel@localhost>
	<1179223088.3613.14.camel@localhost>
Message-ID: <20070515101850.GA17144@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2007 at 11:58:08AM +0200, Mats Erik Andersson wrote:
>I have been able to reproduce the strange phenomenon
>that a buildroot setting of
>
>gcc-3.4.4
>binutils-2.17
>buildroot-20070514
>uClibc-0.9.28.3
>busybox-1.5.0
>linux-headers-2.4.27
>dropbear
>iptables-1.3.7 (and 1.3.5)
>
>cannot compile
>
>    iptables-1.3.7/extensions/libipt_string.c
>
>due to non-existing structure members of ipt_string_info.
>However, when I finally got the idea to alter the value
>inside
>
>      package/iptables/iptables.mk
>
>to explicitely replace the header reference by the directory
>
>       KERNEL_DIR=/tmp2/linux-2.4.27
>
>where I separately compiled the kernel, the previous failure is
>changed into success. 

IIRC iptables needs to pickup some kernel-headers. If you use old
versions of linux (old as in not in buildroot), then you should be able
to pass KERNEL_DIR=/there/ to the toplevel make and all should be well.
I did never try if this works, though, so it's possible that you have to
tweak it a little bit (and send the resulting patch which makes sure
that KERNEL_DIR is properly seen in package/* to the list).
>
>Until today I have only used Buildroot for 2.6-kernels
>and I did never encounter the same failure. Would someone
>venture to call this a bug, or is it my handling that could
>have caused my troubles? Aside from one complaint on getopt.h
>when I aimed at a SuSv3-version, the above was the only trouble
>I had in this setting.

I don't remember any details about this getopt thing, i fear..
