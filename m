From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 12:59:59 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile: don't depend on the umask
In-Reply-To: <1416586748-12936-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150713125959.2d981473@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:00 -0300, Guido Mart?nez wrote:
> Some packages and BR itself create files and directories on the target
> with cp/mkdir/etc which depend on the umask at the time of building.
> 
> To fix this, use a trick inside the Makefile which wraps all rules when
> the umask is not 0022. This sets the umask at the top level, and then
> the building process continues as usual.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied with some additional changes:

    [Thomas: add --no-print-directory, as suggested by Arnout.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
