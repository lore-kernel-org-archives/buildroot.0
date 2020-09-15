From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 22:25:32 +0200
Subject: [Buildroot] [PATCH] package/nginx: use /run for PIDFile
In-Reply-To: <20200915194958.658-1-buildroot@heine.tech>
References: <20200915194958.658-1-buildroot@heine.tech>
Message-ID: <20200915222532.5dcba8fc@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 21:49:56 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Fixes:
> 
> systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
> a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
> /run/nginx.pid; please update the unit file accordingly.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks for this. Does this means we also need to fix:

$ git grep PIDFile=/var *
package/bandwidthd/bandwidthd.service:PIDFile=/var/run/bandwidthd.pid
package/dhcpcd/dhcpcd.service:PIDFile=/var/run/dhcpcd.pid
package/htpdate/htpdate.service:PIDFile=/var/run/htpdate
package/minidlna/minidlnad.service:PIDFile=/var/run/minidlna/minidlna.pid
package/nginx/nginx.service:PIDFile=/var/run/nginx.pid
package/nss-pam-ldapd/nslcd.service:PIDFile=/var/run/nslcd/nslcd.pid
package/openvmtools/vmtoolsd.service:PIDFile=/var/run/vmtoolsd.pid
package/postgresql/postgresql.service:PIDFile=/var/lib/pgsql/postmaster.pid

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
