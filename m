From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 11:40:04 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: add menu entry to install tools.
In-Reply-To: <1398022213-9728-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398022213-9728-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140421114004.33a1911f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 20 Apr 2014 21:30:13 +0200, Eric Le Bihan wrote:
> libcap provides a set of tools to manipulate capabilities, among which
> `setcap(8)` and `getcap(8)`. A new menu entry has been added to install them.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/libcap/Config.in | 14 ++++++++++++++
>  package/libcap/libcap.mk | 13 +++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)

I applied this patch, but I had to make heavy changes to it: you didn't
take into account the !MMU case, and the BR2_PREFER_STATIC_LIB case.
The first was easy to solve: programs cannot be built in a !MMU
configuration. The second one required more work, as your original
patch changes to run 'make' at the root of the libcap sources, which
doesn't work to build only the libcap.a library in a static library
context. So I had to revert your solution, and instead to a 'make' in
the libcap/ directory, and another 'make' in the progs/ directory.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
