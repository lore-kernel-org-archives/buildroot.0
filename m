From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:12:38 +0200
Subject: [Buildroot] [PATCH] package/tz: fix incorrect timezone setting
 for uclibc
In-Reply-To: <1438323935-7809-1-git-send-email-fancp2007@gmail.com>
References: <1438323935-7809-1-git-send-email-fancp2007@gmail.com>
Message-ID: <20150806091238.03708da3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Fri, 31 Jul 2015 14:25:35 +0800, Scott Fan wrote:
> According to the doc file from <uclibc-src>/docs/
> Glibc_vs_uClibc_Differences.txt, the uclibc library read the
> TZ environment variable, or the /etc/TZ file; the /etc/TZ file
> should be a single line, ending with a newline, containing the
> TZ setting.  For example: echo CST6CDT > /etc/TZ
> 
> Whereas the tzdump cmd would output two lines like this:
>   # Asia/Shanghai
>   CST-8
> 
> This make the uclibc could not read the correct TZ setting, therefore
> e.g. the 'busybox date' cmd always show the UTC timezone.
> 
> This fix remove the redundant first line from the tzdump output.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/tz/tz.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
