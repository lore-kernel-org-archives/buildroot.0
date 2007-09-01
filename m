From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Sep 2007 12:38:09 +0200
Subject: [Buildroot] White space problem
	in	target/device/Atmel/u-boot/u-boot.mk
In-Reply-To: <a512d1250708310529w5311ec48haf12635551fa51da@mail.gmail.com>
References: <a512d1250708310529w5311ec48haf12635551fa51da@mail.gmail.com>
Message-ID: <20070901103809.GJ11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 31, 2007 at 07:29:43PM +0700, brm wrote:
>Hi,
>      Today when I try to build buildroot for some old ARM board using
>AT914xxx.
>I got this error:
>
>| echo setenv linux /opt/buildroot/binaries/ev40/ev40-linux-2.6.22.1>>
>/opt/buildroot/binaries/ev40/autoscript
>| echo setenv kernel-version 2.6.22.1>> /opt/buildroot/binaries/ev40/autoscript
>| echo setenv kernel-date 20070831>> /opt/buildroot/binaries/ev40/autoscript
>| /bin/sh: 20070831: Bad file descriptor
>| make: *** [/opt/buildroot/binaries/ev40/autoscript] Error 1
>
>       After spend sometime track down the problem, I found that "u-boot.mk"
>in target/device/Atmel/u-boot/ directory contains that portion of shell script.
>       I'm using bash on debian etch. Bach will interpret number in
>front of ">" or ">>" as file descriptor. So that cause the problem.

Yea, that was me. Should be fixed in r19743. Please holler if i missed
an occurance.
