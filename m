From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:53:24 +0100
Subject: [Buildroot] [PATCH 3/4] sysv init scripts: replace &>/dev/null
 redirection
In-Reply-To: <1414345306-27184-3-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
 <1414345306-27184-3-git-send-email-dywi@mailerd.de>
Message-ID: <20141026185324.5fb88ca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Sun, 26 Oct 2014 18:41:45 +0100, Andr? Erdmann wrote:
> "<command> &>/dev/null" is supposed to redirect all output to /dev/null.
> 
> However, in shells that don't support it (dash, ash without bash extensions),
> a command like "echo a &>/dev/null" is interpreted as
> 
> (a) "echo a" in background
> (b) write nothing to /dev/null (redirect <empty command> to /dev/null)
> 
> This commit replaces "&>..." with ">/dev/null 2>&1".
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
> ---
>  package/network-manager/S45network-manager | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
