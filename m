From: Koen Martens <gmc@sonologic.nl>
Date: Fri, 7 Jul 2017 19:39:11 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <20170707094443.3de6a9e0@windsurf.lan>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
 <20170706211612.5c4bf11c@windsurf.lan>
 <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
 <20170707094443.3de6a9e0@windsurf.lan>
Message-ID: <20170707173911.GA26346@sunra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Jul 07, 2017 at 09:44:43AM +0200, Thomas Petazzoni wrote:
> On Fri, 07 Jul 2017 08:58:08 +0200, Koen Martens wrote:
> > >Since upstream uses Git, we prefer to have a Git-formatted patch, i.e
> > >generated with "git format-patch -N". It should also have a proper
> > >commit title, i.e a single line at the beginning that summarizes the
> > >commit, separated from the rest of the commit log by one empty line.  
> > 
> > Sure, except the published tarball is from a subdirectory of the
> > upstream git repo. So creating a git patch with format-patch results
> > in a patch that needs 'patch -p2' to apply in buildroot. I understand
> > this is impossible. What do you prefer i do? Manually modify the
> > patch to remove the subdir that should be stripped?
> 
> Gah, OK. Then perhaps a quick comment in the patch description would be
> nice, like:
> 
> [Patch cannot be generated with git format-patch, as the upstream Git
> repository directory layout doesn't match the tarball directory layout]

It's a temporary patch anyway, i have an open merge request with
upstream.

Anyway, i'm trying to utils/test-pkg capnproto with
CAPNPROTO_AUTORECONF = YES, but get failures such as:

/bin/bash:
/home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/bin/autoreconf: No
such file or directory

Interestingly,
/home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/usr/bin/autoreconf
does exist, so with usr/bin instead of bin.

I have a one-line capnproto.conf i feed to test-pkg:

BR2_PACKAGE_CAPNPROTO=y

What am i doing wrong?

- Koen

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170707/f686fde5/attachment.asc>
