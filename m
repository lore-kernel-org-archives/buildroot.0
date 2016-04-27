From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:58:29 +0200
Subject: [Buildroot] [PATCH] yajl: remove obsolete patch
In-Reply-To: <1461614083-29745-1-git-send-email-joerg.krause@embedded.rocks>
References: <1461614083-29745-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160427225829.591fe687@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 21:54:43 +0200, J?rg Krause wrote:
> Commit 302563539dacb284576a443401cdfd061eb2e1e8 fixes link with libm for all
> targets linking against libyajl{,_s}. This makes patch "0001-cmake-uClibc-Fix
> -missing-libm-for-tests" obsolete so it is safe to remove it.
> 
> Instead of renumbering all remaining patches the patch defined in YAJL_PATCH
> is fetched and put intto the packages directory. Having all the patches in one
> places makes the number and order of the patches applied to the package more
> clear.
> 
> Align patch "0003-Link-with-shared-libyajl-in-a-shared-build" with commit
> 302563539dacb284576a443401cdfd061eb2e1e8 and remove linking with libm from
> test/api/CMakeLists.txt.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...red-and-the-static-library-have-the-same-.patch | 34 ++++++++++++++++++++++
>  ...1-cmake-uClibc-Fix-missing-libm-for-tests.patch | 30 -------------------
>  ...ink-with-shared-libyajl-in-a-shared-build.patch | 12 ++++----
>  package/yajl/yajl.hash                             |  1 -
>  package/yajl/yajl.mk                               |  1 -
>  5 files changed, 41 insertions(+), 37 deletions(-)
>  create mode 100644 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch
>  delete mode 100644 package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
