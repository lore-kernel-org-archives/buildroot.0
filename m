From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:37:42 +0100
Subject: [Buildroot] [PATCH v5] Add support for Flattened Image Trees
In-Reply-To: <1412343834-2532-1-git-send-email-yegorslists@googlemail.com>
References: <1412343834-2532-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141208223742.226b35ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Fri,  3 Oct 2014 15:43:54 +0200, Yegor Yefremov wrote:
> This patch introduces a new file system image type FIT. User
> can specify one or more *.its files, that will be compiled and
> copied into images or installed into /boot directory.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Sorry for the long delay getting back to you about this. We discussed
this patch at the D?sseldorf Buildroot Meeting, and it was decided that
it was not the effort supporting generating FIT images directly in
Buildroot:

 * Depending on whether you want a FIT image that bundles your
   kernel+DTB and sits in your filesystem, or a FIT image that
   actually bundles your filesystem, it would have to be generated at a
   completely different time (first case should be handled as a normal
   Buildroot package, second case more as a filesystem image).

 * It's all about calling a single mkimage command, which can easily be
   enabled for the host in the "Host utilities" menu of Buildroot, and
   then called from either a post-build or a post-image script
   depending on your use-case.

Therefore, we've decided to mark your patch as 'Rejected' in patchwork.
Thanks nonetheless for your contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
