From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 09:24:25 +0100
Subject: [Buildroot] [PATCH] package/opentyrian: fix build on bfin
In-Reply-To: <1424390438-2398-1-git-send-email-romain.naour@openwide.fr>
References: <1424390438-2398-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150220092425.408bca64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 20 Feb 2015 01:00:38 +0100, Romain Naour wrote:
> There is a conflict with the _strchrnul symbole from mingw_fixes.c
> and the one from uClibc.
> 
> Add a guard around strchrnul function for unix systems.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a08/a085fb55269971e3c7b8ae8c167e7330c3c042a5/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...-don-t-redefine-strchrnul-for-unix-system.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/opentyrian/0001-mingw_fixes-don-t-redefine-strchrnul-for-unix-system.patch

Applied to master, thanks.

Though one may wonder why this mingw_fixes.c file gets compiled at all
on Unix platforms. Maybe this is what should be fixed instead :)

Seems like Opentyrian is still active upstream:
https://code.google.com/p/opentyrian/source/list.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
