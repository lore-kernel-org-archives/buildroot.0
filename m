From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 22:12:35 +0200
Subject: [Buildroot] [PATCH v2 2/6] package/linux-headers: add support
 for custom headers
In-Reply-To: <20180912102256.3164-3-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-3-mark.corbin@embecosm.com>
Message-ID: <20180923221235.6950a2e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:52 +0100, Mark Corbin wrote:
> Add support for building toolchains against custom headers. Allows
> the selection of a manual version, custom tarball or custom git
> repository for the kernel headers. This enables toolchains to be
> built against custom kernel headers without having to build a full
> kernel.
> 
> This is particularly useful for new architectures, such as RISC-V
> where updated kernel headers may not have made it into the mainline
> kernel yet.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  package/linux-headers/Config.in.host   | 40 ++++++++++-
>  package/linux-headers/linux-headers.mk | 94 +++++++++++++++-----------
>  2 files changed, 93 insertions(+), 41 deletions(-)

I have applied, but after doing two changes:

 - Dropping the spurious change of indentation in the
   LINUX_HEADERS_APPLY_LOCAL_PATCHES hook.

 - Splitting this commit into two. A first commit does just the
   reorganization of linux-headers.mk, another adds support for custom
   tarball/git in linux-headers.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
