From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:40:27 +0200
Subject: [Buildroot] [PATCH 0/9 v2] musl: add compatibility cdefs.h
 header (branch yem/cdefs)
In-Reply-To: <cover.1471556612.git.yann.morin.1998@free.fr>
References: <cover.1471556612.git.yann.morin.1998@free.fr>
Message-ID: <20160819114027.33ffd63a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:50:17 +0200, Yann E. MORIN wrote:

>       package/musl-compat-headers: provide compatibility headers not in musl
>       package/rpcbind: fix musl build
>       package/aircrack-ng: drop a musl-compatibility patch
>       package/android-tools: drop musl-compatibility cdefs patching out
>       package/bcusdk: drop a musl-compatibility patch
>       package/libsepol: drop a musl-compatibility patch
>       package/linknx: drop a musl-compatibility patch
>       package/qlibc: drop a musl-compatibility patch

I've applied those patches to master. It's a bit late to apply such a
change, but having this compatibility cdefs.h header can help solve a
number of remaining build issues, so let's have it.

>       build/advanced: add option to check for use of cdefs.h

This one, I am really really not sure. It's a whole lot of additional
complexity just to check a very specific problem. I'm not sure we want
to include such an additional complexity just for the sake of making
upstream packages "cdefs.h clean".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
