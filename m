From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:14:28 +0200
Subject: [Buildroot] [PATCH v2 0/2] Add support for AXFS filesystem type
In-Reply-To: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <20151013231428.2e611e06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ariel D'Alessandro,

On Mon,  5 Oct 2015 13:55:00 -0300, Ariel D'Alessandro wrote:
> This patch series adds support for using the AXFS filesystem type.
> 
> The Advanced XIP File System is a Linux kernel filesystem driver that enables
> files to be executed directly from flash or ROM memory rather than being copied
> into RAM.
> 
> More info can be found here: http://elinux.org/AXFS
> 
> Changes from v1:
> * Removed unnecessary call to $(generic-package) in axfsutils.mk.
> 
> Ariel
> 
> Ariel D'Alessandro (2):
>   axfsutils: add new package
>   axfs: add new filesystem type

You received some feedback on both patches. Could you address this
feedback, and submit a new version of the patches?

Note that adding the axfs patches as a kernel extension, as suggested
by Yann E. Morin, is optional and can perfectly be done as a set of
follow-up patches: it is not mandatory to have this part of the current
series.

However, one thing that I remember about AXFS is that you could decide
when creating the root filesystem, which parts of which files would be
stored uncompressed (so that they can be XIP-ed) and which parts of
which files would be stored compressed (to save space). This allowed to
combine the nice aspects of a XIP-capable filesystem, with the nice
aspects of a compressed filesystem. I remember there was even a tool to
run on the target to "measure" the filesystem accesses, and give some
hints on which pages of data should be stored uncompressed vs. which
pages should be stored compressed. Is this actually implemented in
AXFS ? If so, do you plan to add support for such functionality ?

In any case, I'll mark your patches as "Changes Requested" in
patchwork, so please resubmit a new version when you have time,
otherwise we'll forget about your contribution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
