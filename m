From: Paul Jones <paul@pauljones.id.au>
Date: Sun, 6 Jun 2010 17:29:35 +1000
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
	configuredownload site
In-Reply-To: <20100605154934.6ebd9068@surf>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com><fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com><002101cb0223$38af8910$aa0e9b30$@pauljones.id.au><20100604103232.3f415c39@surf>
	<20100605154934.6ebd9068@surf>
Message-ID: <000001cb054a$04f5af80$0ee10e80$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Saturday, 5 June 2010 11:50 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 07/46] u-boot: remove option to
> configuredownload site
> 
> On Fri, 4 Jun 2010 10:32:32 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > Thanks for the feedback. I'll add something that allows to download
> > arbitrary tarballs. That's something that I also did for my Linux
> > kernel code cleanup in Buildroot, so I'll reuse the same scheme. I'll
> > post an updated version of this patch probably during this WE.
> 
> Here my proposal to improve U-Boot support to take into account the issue
> you reported:
> 
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=bootloaders-
> cleanup&id=13ef908685caecd17ba67953fd1fee8a559231a2

That is perfect! Thanks. Tested and working.

There seems to be a bug in your bootloaders-cleanup branch somewhere.
If I do a make distclean and then configure the kernel to be built into a
uImage I get the following error:
(have attached .config)

Verbose user fault messages (DEBUG_USER) [N/y/?] n
Verbose kernel error messages (DEBUG_ERRORS) [N/y/?] n
Enable stack utilization instrumentation (DEBUG_STACK_USAGE) [N/y/?] n
Kernel low-level debugging functions (DEBUG_LL) [N/y/?] n
#
# configuration written to .config
#
make[1]: Leaving directory
`/home/peejay/mini2440-dev/buildroot/output/build/linux-2.6.32.13'
touch
/home/peejay/mini2440-dev/buildroot/output/build/linux-2.6.32.13/.configured
mkdir -p /home/peejay/mini2440-dev/buildroot/output/build/u-boot-tools
cp /home/peejay/mini2440-dev/buildroot/output/host/usr/bin/mkimage
/home/peejay/mini2440-dev/buildroot/output/build/u-boot-tools
cp: cannot stat
`/home/peejay/mini2440-dev/buildroot/output/host/usr/bin/mkimage': No such
file or directory
make: ***
[/home/peejay/mini2440-dev/buildroot/output/build/u-boot-tools/mkimage]
Error 1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 19284 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100606/0ca3b1fd/attachment-0001.obj>
