From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:28:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: ssl needs threads
In-Reply-To: <20200905110703.84566-1-fontaine.fabrice@gmail.com>
References: <20200905110703.84566-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905232800.3c5552a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 13:07:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ssl support which has been added in version 1.0.0 needs threads:
> 
> /home/buildroot/autobuild/instance-3/output-1/build/hiredis-1.0.0/ssl.c:42:10: fatal error: pthread.h: No such file or directory
>  #include <pthread.h>
>           ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/80ac7500055d167e5ec9a964046de7cca4b4f9f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hiredis/hiredis.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
