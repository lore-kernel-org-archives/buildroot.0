From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 09:41:12 +0200
Subject: [Buildroot] How to login automatically without typing root in
 buildroot x86 64 QEMU?
In-Reply-To: <CAFXrp_e2sDqZGZKM_B2rgBuh_1oXWhJgW6wgMzfBWsGQ_hnV7g@mail.gmail.com>
References: <CAFXrp_e2sDqZGZKM_B2rgBuh_1oXWhJgW6wgMzfBWsGQ_hnV7g@mail.gmail.com>
Message-ID: <20160802094112.072e3382@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Aug 2016 07:24:24 +0100, Ciro Santilli wrote:

> How to configure buildroot to skip that and login directly?

Override the default /etc/inittab, and start a shell process directly
rather than a getty process. I.e, replace:

console::respawn:/sbin/getty -n -L  console 0 vt100 # GENERIC_SERIAL

by:

console::respawn:/bin/sh

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
