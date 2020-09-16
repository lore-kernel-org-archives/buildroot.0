From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 08:45:36 +0200
Subject: [Buildroot] [PATCH v2]  package/{bandwithd, dhcpcd, htpdate,
 minidlna, nginx, nss-pam-ldapd,
 openvmtools}: use PIDFile=/run in systemd services
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915194958.658-1-buildroot@heine.tech>
 <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916084536.094c5b17@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 23:56:45 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Fixes:
> 
> systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
> a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
> /run/nginx.pid; please update the unit file accordingly.
> 
> Details:
>  - https://github.com/systemd/systemd/pull/10712
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

I think we would normally prefer one patch for each. For example, for
htpdate, we also need to fix the PIDFile path so that it has a .pid
extension.

Also, is there something that needs to be done with Postgresql:

package/postgresql/postgresql.service:PIDFile=/var/lib/pgsql/postmaster.pid

is it expected to have the PIDFile in /var/lib ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
