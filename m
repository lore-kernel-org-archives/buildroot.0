From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Jun 2018 06:56:29 +0300
Subject: [Buildroot] udhcpc: no lease, failing
In-Reply-To: <1528947568280-0.post@n4.nabble.com>
References: <1528947568280-0.post@n4.nabble.com>
Message-ID: <20180614035629.kizbione3oozscr5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anuj,

On Wed, Jun 13, 2018 at 08:39:28PM -0700, Anuj Malviya wrote:
> I am getting this problem with Buildroot.
> 
> Starting network: udhcpc: started, v1.27.2
> [    2.928374] net eth0: initializing cpsw version 1.12 (0)
> [    2.933951] net eth0: initialized cpsw ale version 1.4
> [    2.939382] net eth0: ALE Table size 1024
> [    2.945195] libphy: PHY 4a101000.mdio:00 not found
> [    2.950239] net eth0: phy "4a101000.mdio:00" not found on slave 0, err
> -19
> [    2.957426] libphy: PHY 4a101000.mdio:01 not found
> [    2.962456] net eth0: phy "4a101000.mdio:01" not found on slave 1, err
> -19
> [    2.980308] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready

This clearly shows a driver or hardware problem. Userspace can't fix that. So 
this is not related to Buildroot itself. More likely a kernel related issue.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
