From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 15 Sep 2008 14:52:09 +0200
Subject: [Buildroot] [patch] oprofile: bump version to 0.9.4 and make
 architecture independent
In-Reply-To: <6a2e33620809110808v73658fd3s8cfd986faac9d6c7@mail.gmail.com>
References: <1216995456.18524.3.camel@localhost>
	<1218539953.7930.14.camel@localhost>
	<6a2e33620809110808v73658fd3s8cfd986faac9d6c7@mail.gmail.com>
Message-ID: <20080915145209.7f337278@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Sep 2008 17:08:26 +0200
"Fathi Boudra" <fboudra@gmail.com> wrote:

> Hi,
> 
> it fails to build for me on powerpc:
> /usr/bin/install: cannot stat
> `/home/test/build-area/toolchain/buildroot/build_powerpc/oprofile-0.9.4/events/powerpc/events':
> No such file or directory
> /usr/bin/install: cannot stat
> `/home/test/build-area/toolchain/buildroot/build_powerpc/oprofile-0.9.4/events/powerpc/unit_masks':
> No such file or directory
> 

Weird, seems to be the ifeq's for sorting out which architecture should
be used that fails. I snatched the vital parts from your patch about
that.

I'll try converting in to Makefile.autotools.in while I am at it.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
