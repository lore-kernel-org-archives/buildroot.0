From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:53:16 +0100
Subject: [Buildroot] [PATCH 2/4] sysv init scripts: remove gettext
 invocations
In-Reply-To: <1414345306-27184-2-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
 <1414345306-27184-2-git-send-email-dywi@mailerd.de>
Message-ID: <20141026185316.602130d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Sun, 26 Oct 2014 18:41:44 +0100, Andr? Erdmann wrote:
> $"str" is supposed to translate str (depending on the current locale).
> In ash/dash/..., it cannot be expanded, so commands like
> 
>  echo  $"Usage: $0 start|stop"
> 
> are printed as '$Usage: SCRIPT start|stop' in [d]ash,
> and as 'Usage: SCRIPT start|stop' in bash.
> 
> This patch removes the '$' in front of '"'.
> 
> Command(s) used for editing:
> 
>   find . -type f -name '[SK][0-9][0-9]*' | \
>      xargs sed -r -e 's@[$](["])@\1 at g' -i
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
> ---
>  package/busybox/S15watchdog  | 2 +-
>  package/inadyn/S70inadyn     | 2 +-
>  package/netatalk/S50netatalk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
