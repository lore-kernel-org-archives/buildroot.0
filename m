From: Koen Martens <gmc@sonologic.nl>
Date: Fri, 7 Jul 2017 20:29:55 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <20170707201643.79454a0c@windsurf>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
 <20170706211612.5c4bf11c@windsurf.lan>
 <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
 <20170707094443.3de6a9e0@windsurf.lan>
 <20170707173911.GA26346@sunra> <20170707201643.79454a0c@windsurf>
Message-ID: <20170707182955.GA14836@sunra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Fri, Jul 07, 2017 at 08:16:43PM +0200, Thomas Petazzoni wrote:
> On Fri, 7 Jul 2017 19:39:11 +0200, Koen Martens wrote:
> > Anyway, i'm trying to utils/test-pkg capnproto with
> > CAPNPROTO_AUTORECONF = YES, but get failures such as:
> > 
> > /bin/bash:
> > /home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/bin/autoreconf: No
> > such file or directory
> > 
> > Interestingly,
> > /home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/usr/bin/autoreconf
> > does exist, so with usr/bin instead of bin.
> 
> Are you doing completely clean builds here? If you have already done a
> run of test-pkg before, make sure to clean up the build folders.
> 
> We have recently moved $(HOST_DIR)/usr to $(HOST_DIR), and it seems
> like you have a mix of things before and after this change.
> 
> If that still doesn't work after a full rebuild, let us know, there
> might be a real bug somewhere, though I would assume the autobuilders
> would have caught such an obvious problem.

*doh*, indeed I had some old stuff in ~/br-test-pkg, thanks!

- Koen

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170707/24b768f5/attachment.asc>
