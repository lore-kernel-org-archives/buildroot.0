From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:53:37 +0100
Subject: [Buildroot] [PATCH 4/4] sysv init scripts: use symbolic names
 in trap command
In-Reply-To: <1414345306-27184-4-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
 <1414345306-27184-4-git-send-email-dywi@mailerd.de>
Message-ID: <20141026185337.58c8a7d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Sun, 26 Oct 2014 18:41:46 +0100, Andr? Erdmann wrote:
> Not really necessary(*), but checkbashisms complains about
> "trap with signal numbers".
> 
> (*) Quoting man 1p trap:
>    trap [action condition...]
>    [...]
>    The condition can be EXIT, 0 (equivalent to EXIT),
>    or a signal specified using a symbolic name, without the SIG prefix
>    [...]
>    XSI-conformant systems also allow numeric signal numbers[...]
> 
> Only one file is affected by this commit, and it should be checked
> whether it really needs to ignore SIGTERM/SIGHUP or if the trap commands
> can simply be removed:
> 
>  package/proftpd/S50proftpd
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
> ---
>  package/proftpd/S50proftpd | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
