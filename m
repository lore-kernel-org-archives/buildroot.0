From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:51:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix basename call
 under musl
In-Reply-To: <1442269611-30641-1-git-send-email-brendanheading@gmail.com>
References: <1442269611-30641-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150920145133.5d83fe04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Mon, 14 Sep 2015 23:26:51 +0100, Brendan Heading wrote:
> Fixes:
> http://autobuild.buildroot.net/results/9c3/9c3889fe80e58b7a35c242332f993992044d2f6b/
> 
> ibrcommon was relying on a glibc extension to basename(3) which allowed it
> to accept a const char* parameter (instead of char*). Fixed by testing
> for __GLIBC__; if not defined (such as when musl is in use) a fallback
> block is used which creates a temporary copy of the path.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  ...data-File.cpp-support-POSIX-basename-call.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch

Applied, thanks. However, I believe a better fix would be to use an
autoconf test rather than really on this crazy set of #ifdef for the
different platforms.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
