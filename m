From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 11 Jun 2018 03:00:12 -0300
Subject: [Buildroot] [PATCH 0/4] synchronize initab files and enable swap on
 startup
Message-ID: <20180611060016.20755-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Apply to sysvinit a modification made for busybox in commit e9db8122fb
  (reduce number of mkdir calls in inittab).

* Activate swap on system startup. This still requires a swap entry in
  /etc/inittab, which must be provided by the user.

* Synchronize the custom inittab used on Synopsis boards with the one in
  the busybox package.

Carlos Santos (4):
  sysvinit: reduce number of mkdir calls in inittab
  sysvinit: add an inittab entry to activate swap
  busybox: add an inittab entry to activate swap
  board/synopsys: synchronize custom inittab with BusyBox' one

 board/synopsys/axs10x/fs-overlay/etc/inittab | 16 ++++++++++------
 package/busybox/inittab                      |  1 +
 package/sysvinit/inittab                     |  6 +++---
 3 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.17.0
