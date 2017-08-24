From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:13:14 +0200
Subject: [Buildroot] [PATCH] package/rpcbind: Do not mark .service and
 .socket files executable
In-Reply-To: <20170823234414.3326-1-andrew.smirnov@gmail.com>
References: <20170823234414.3326-1-andrew.smirnov@gmail.com>
Message-ID: <20170824231314.73e54f07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Aug 2017 16:44:14 -0700, Andrey Smirnov wrote:
> Do not mark .service and .socket files executable, otherwise systemd
> will give us a warning about it.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/rpcbind/rpcbind.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. However, we have a few other packages also
installing .service as 755:

package/minidlna/minidlna.mk:   $(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
package/nss-pam-ldapd/nss-pam-ldapd.mk: $(INSTALL) -m 755 -D package/nss-pam-ldapd/nslcd.service \
package/transmission/transmission.mk:   $(INSTALL) -D -m 0755 $(@D)/daemon/transmission-daemon.service \

Perhaps we want to fix those as well ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
