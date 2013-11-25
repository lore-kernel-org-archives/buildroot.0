From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Nov 2013 00:03:40 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <5293D598.20408@mind.be>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
 <5293CEC8.9010601@mind.be> <20131125224548.GB3435@free.fr>
 <5293D598.20408@mind.be>
Message-ID: <20131125230340.GC3435@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-11-25 23:56 +0100, Arnout Vandecappelle spake thusly:
> On 25/11/13 23:45, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2013-11-25 23:27 +0100, Arnout Vandecappelle spake thusly:
> >>On 25/11/13 20:05, Yann E. MORIN wrote:
> >>>Arnout,
> >>>
> >>>On 2013-11-25 10:31 +0100, Arnout Vandecappelle spake thusly:
> [snip]
> >>  Anyway, I think it should be:
> >>
> >>BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
> >>	'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
> >
> >I'm using double quotes here, now, instead of single quotes.
> >Otherwise, consider it changed. Thanks!
> 
>  With double quotes, it will not actually be quoted because the
> ROOTFS_$(2)_CMD use adds another level of double quotes and they cancel out.

Yes, I was again too fast to reply: I'm using \"$(BLABLA)\"

My reasoning is I want varuable to be expanded, like in:
    BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="$(TOPDIR)/board/raspberrypi/partitions"

But since $(TOPDIR) is a Makefile constrcut, the shell won't expand it,
so it must be make expanding it (since it is working).

I'll try single quotes, since they look better.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
