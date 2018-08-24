From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:34:09 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <20180726171524.479-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Thu, 26 Jul 2018 19:15:23 +0200")
References: <20180726171524.479-1-m.niestroj@grinn-global.com>
Message-ID: <8736v4kvsu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > When using uclibc libdevmapper.so was calling dm_task_get_info_base()
 > function recursively, leading to segmentation fault. This was
 > happening because uclibc linker loader just takes first existing
 > 'dm_task_get_info' (which is 'dm_task_get_info_base') symbol in elf
 > binary, instead of default version.

 > Add upstreamable lvm2 patch [1], which introduces
 > --enable-symvers[=STYLE] switch. Use that switch to disable symbol
 > versions, as we do not plan to support binaries compiled against
 > old libdevmapper library.

 > [1] https://www.redhat.com/archives/dm-devel/2018-July/msg00187.html

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 > ---
 > Changes v2 -> v3: none

 > Changes v1 -> v2:
 >  * Add SoB in patch itself (suggested by Thomas)
 >  * Make this patch first in series, so it can be applied for LTS
 >    branches (sugested by Thomas)
 >  * Rebase patch on current lvm2 Buildroot master version (2.02.173),
 >    so it can apply cleanly

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
