From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:22:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix link error with
 gettext
In-Reply-To: <1406836160-13823-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406836160-13823-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140731232242.63765db2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 31 Jul 2014 21:49:20 +0200, Bernd Kuhls wrote:
> -lintl needs to be added at the end of the link command, Makefile
> has variable LIBS for this purpose, so use it instead of LDFLAGS.
> 
> Fixes
> http://autobuild.buildroot.net/results/276/276581f6dbbe330799c3a7eaa26b453e38a22907/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dnsmasq/dnsmasq.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks. I didn't know that doing

	make LIBS+=-lfoo LIBS+=-lbar

was actually working. But I tried, and it does.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
