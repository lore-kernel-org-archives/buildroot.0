From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 18 Nov 2015 05:27:52 +0200
Subject: [Buildroot] [PATCH 2/2] board: add support for Chromebook Snow
In-Reply-To: <564A3F3E.1020207@mind.be>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <8ac071d88d311f605b895f6b8df18fc4bdd07d55.1447689401.git.alex.suykov@gmail.com>
 <564A3F3E.1020207@mind.be>
Message-ID: <20151118032752.GA893@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Nov 16, 2015 at 09:40:30PM +0100, Arnout Vandecappelle wrote:

> > +Create the partitions, marking the kernel partition as bootable.
> > +
> > +	$CGPT add -i 1 -b $start -s $kernelsize \
> > +		-t kernel -l kernel\
> > +		-S 1 -T 1 -P 10 $SD
> > +	$CGPT add -i 2 -b $[start+kernelsize] -s $rootfssize \
> > +		-t data -l rootfs $SD
> 
>  Wouldn't it be possible to do all this in a post-image script that generates an
> SD card image?

Seems to be possible. The resulting image has secondary GPT in the wrong
location, but as long as the primary one is ok it should not cause trouble.

This also adds host-parted dependency, but that would be needed anyway.
I was working with a partitioned card and did not notice it, but cgpt
does not write protective MBR.

Sending v2.
