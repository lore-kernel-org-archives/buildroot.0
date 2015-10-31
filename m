From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:55:50 +0100
Subject: [Buildroot] [PATCH 1/1] ofono: bump to version 1.17
In-Reply-To: <1446230985-12935-1-git-send-email-petr.vorel@gmail.com>
References: <1446230985-12935-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20151031155550.0c2636b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Fri, 30 Oct 2015 19:49:45 +0100, Petr Vorel wrote:
> Updated patch with uClibc support - merge with upstream support
> for musl.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/ofono/0001-uclibc-backtrace.patch | 55 +++++++++++++++++--------------
>  package/ofono/ofono.hash                  |  2 +-
>  package/ofono/ofono.mk                    |  2 +-
>  3 files changed, 32 insertions(+), 27 deletions(-)

I've applied, thanks!

However, their patch for the musl build is really crappy. Instead, they
should add a configure.ac check for the backtrace related functionality
and use the result of that check instead of testing __GLIBC__. If you
have the courage to improve this and submit it upstream, it would be
good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
