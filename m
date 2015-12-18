From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:40:58 +0100
Subject: [Buildroot] [PATCH 1/2] libv4l: add patches to fix musl build
 issues, and enable on musl
In-Reply-To: <1449007230-3175-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1449007230-3175-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151218224058.5cabc446@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Dec 2015 23:00:29 +0100, Thomas Petazzoni wrote:
> This commit adds two patches to the libv4l package, the first one
> fixes the __off_t usage and the second one fixes locale-related
> function usage. Those two patches allow libv4l to build fine against
> musl, so we remove the dependency of glibc || uclibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...scall-priv.h-Use-off_t-instead-of-__off_t.patch | 108 +++++++++++++++++++++
>  ...rly-use-ENABLE_NLS-for-locale-related-cod.patch | 107 ++++++++++++++++++++
>  package/libv4l/Config.in                           |   7 +-
>  3 files changed, 217 insertions(+), 5 deletions(-)
>  create mode 100644 package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
>  create mode 100644 package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch

Since nobody reviewed, ACKed or NAKed, I applied this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
