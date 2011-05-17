From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 10:53:38 +0200
Subject: [Buildroot] [PATCH] board: mini2440: Add custom patches and
 configs for 2.6.38 kernel series.
In-Reply-To: <BANLkTi=nd4=RF2mGFMFGZhRp25B+UOmDmw@mail.gmail.com>
References: <1305615351-8516-1-git-send-email-marek.belisko@open-nandra.com>
	<20110517094052.65767f36@surf>
	<BANLkTi=nd4=RF2mGFMFGZhRp25B+UOmDmw@mail.gmail.com>
Message-ID: <20110517105338.0fe0db78@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 May 2011 10:48:56 +0200
Belisko Marek <marek.belisko@gmail.com> wrote:

> >>>   Patching kernel
> for p in board/friendlyarm/mini2440/ ; do \
> 		if echo $p | grep -q -E "^ftp://|^http://" ; then \
> 			toolchain/patch-kernel.sh
> /home/open-nandra/projects/buildroot/output/build/linux-2.6.38.6
> /home/open-nandra/projects/buildroot/dl `basename $p` ; \
> 		elif test -d $p ; then \
> 			toolchain/patch-kernel.sh
> /home/open-nandra/projects/buildroot/output/build/linux-2.6.38.6 $p
> linux-\*.patch ; \
> 		else \
> 			toolchain/patch-kernel.sh
> /home/open-nandra/projects/buildroot/output/build/linux-2.6.38.6
> `dirname $p` `basename $p` ; \
> 		fi \
> 	done
> >>>   Configuring kernel
> 
> Any idea why???

They must be named linux-*.patch. See 

	toolchain/patch-kernel.sh /home/open-nandra/projects/buildroot/output/build/linux-2.6.38.6 $p linux-\*.patch ; \ 

in the "test -d $p" case.

In your board directory, you can store patches for Linux, patches for
U-Boot, patches for Barebox or whatever, so it makes sense to keep a
linux- prefix, in my opinion.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
