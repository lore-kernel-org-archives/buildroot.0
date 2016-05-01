From: Christian Stewart <christian@paral.in>
Date: Sun, 01 May 2016 03:35:55 +0000
Subject: [Buildroot] [PATCH v2 1/3] aufs: new package
In-Reply-To: <1461936690-1389-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1461936690-1389-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <1462073755408-ed6569b0-db01d863-a1bdac39@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atul,

On Fri, Apr 29, 2016 at 9:31 AM Atul Singh
<atul.singh.mandla@rockwellcollins.com> wrote:
> - Changed the name of variable from BR2_PACKAGE_AUFS_STANDALONE_VERSION to
BR2_LINUX_KERNEL_EXT_AUFS_VERSION.
Trying to compile Buildroot without Aufs selected whatsoever gives me:

Unknown aufs major version. Stop.
This is because you're checking BR2_LINUX_KERNEL_EXT_AUFS_VERSION for the major
version, but it's not set. However, I don't think this should have any effect if
the package isn't selected in the first place.
You might consider instead setting something like AUFS_VERSION_MAJOR_INVALID=yes
and erroring out at aufs configuration time, not makefile variable interpret
time.
Thanks!
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160501/106bee22/attachment.html>
