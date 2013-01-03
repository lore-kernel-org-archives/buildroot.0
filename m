From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 03 Jan 2013 17:24:36 +0200
Subject: [Buildroot] [PATCH] perf: new package
In-Reply-To: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50E5A2B4.6090405@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.1.2013 17:07, Thomas Petazzoni kirjoitti:
> This patch adds a new package that allows to build the 'perf'
> userspace tool that comes in the tools/perf directory of the kernel
> sources.
>
> It is an alternative proposal to the one done by Kaiwan Billimoria
> <kaiwan.billimoria@gmail.com>, in that it creates the package in
> package/perf/. It therefore properly integrates with the Buildroot
> package infrastructure.
>
> Of course, the package depends on the Linux kernel to be built by
> Buildroot, in order to get Perf sources matching the version of the
> kernel that will be executed.
>
> One remaining issue is that this package only builds properly with
> kernel >= v3.7 (but it was the same with Kaiwan proposal) : the
> NO_LIBELF variable, which allows to get rid of the libelf dependency,
> has only been introduced between 3.6 and 3.7. If we want to support
> older kernel versions, we'll have to create a package for libelf.

Here is an elfutils 0.155 (which contains libelf) for buildroot that I
posted some time ago.
Patch #4 is missing from that list because it was too big to submit to
this list.

http://lists.busybox.net/pipermail/buildroot/2012-December/063855.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063856.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063864.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063858.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063857.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063859.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063861.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063860.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063863.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063862.html
http://lists.busybox.net/pipermail/buildroot/2012-December/063865.html

Regards
Stefan
