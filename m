From: Christian Stewart <christian@paral.in>
Date: Sat, 02 Jul 2016 19:00:49 +0000
Subject: [Buildroot] [PATCH v2 3/3] aufs-util: new package
In-Reply-To: <1461936744-1528-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1461936744-1528-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <1467486054169-cb888515-ddf0f3ca-351ee8ec@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atul,
On Fri, Apr 29, 2016 at 6:32 AM Atul Singh
<atul.singh.mandla@rockwellcollins.com> wrote:
> + $(MAKE) -C $(@D) CPPFLAGS=?-I $(LINUX_BUILDDIR)/usr/include/?
HOSTCC=?$(TARGET_CC)? HOSTLD=?$(TARGET_LD)? INSTALL=?$(INSTALL)? all +endef
FYI, this is wrong - HOSTCC should be $(HOSTCC), as it's used to build some
small utilities called by aufs-util like ?ver? on the host.
Even setting it like so I can't seem to get the makefile to use the host cc
properly?
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160702/4a7e985b/attachment.html>
