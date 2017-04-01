From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:43:59 +0200
Subject: [Buildroot] [PATCH 3/6] infra: fix 'packages-file-list.txt'
 with TLP
In-Reply-To: <20161114132238.6569-4-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
 <20161114132238.6569-4-jezz@sysmic.org>
Message-ID: <20170401164359.0fb15e51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 14:22:35 +0100, J?r?me Pouiller wrote:
> Until now, `$(BUILD_DIR)/packages-file-list.txt' was not filled properly when
> top level parallelization is enabled. Therefore, all scripts that rely on
> packages-file-list.txt did not work.
> 
> In order to fix it,this patch place target installation task in a critical
> section.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Arnout said:

"""
 I don't think this is the proper approach. The proper approach is
map/reduce, i.e. generate the pieces in per-package files and collect
them together in a final gathering stage. Obviously, this requires a
per-package target first, but that's anyway the way we want to go.

 I thought someone already made that comment but I can't find it in
 that thread...
"""

So I've marked this patch as Changes Requested in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
