From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 2 Dec 2016 21:22:42 +0100
Subject: [Buildroot] [Question] Driver loading after booting
In-Reply-To: <CADZ=QZ=WSOnq4QvV9oKJ2r5wDgC_VaGJGsW77CZiLOJtSGW=Tg@mail.gmail.com>
References: <CADZ=QZnTvQoKRLKOn1OeJPL+KSPk7RgOzjuPYNUC-OOWO8sitA@mail.gmail.com>
 <CADZ=QZ=WSOnq4QvV9oKJ2r5wDgC_VaGJGsW77CZiLOJtSGW=Tg@mail.gmail.com>
Message-ID: <20161202212242.43f9138c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Yu-Ting,

On Thu, 1 Dec 2016 09:15:30 +0800, Yu-Ting Kao <jackzzjack@gmail.com> wrote:

> Hi all,
> I want to ask a question. It's about raspberry pi board. After I built
> buildroot clean defconfig, I found that there are not drivers loading to
> board. Is this a kind of buildroot design principles?

The principle of defconfigs to be 'minimal' with only basic busybox init
system...

To load custom linux kernel modules add some script under /etc/init.d
e.g /etc/init.d/S02modules ...

Or build a more complex system: change from simple busybox init to
systemd init system, will give you /etc/modprobe.d and /etc/modules-load.d
support...

Regards,
Peter

> 
> Thanks
