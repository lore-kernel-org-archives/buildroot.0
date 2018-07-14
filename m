From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:31:04 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180714222729.00517695@windsurf>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <20180714222729.00517695@windsurf>
Message-ID: <20180714223104.1f13be62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Jul 2018 22:27:29 +0200, Thomas Petazzoni wrote:

> With all those packages migrating to meson, would it be possible to
> look at removing some dependencies from host-ninja/host-meson ? Right
> now, host-ninja forces to build a Python interpreter, either
> host-python or host-python3, and then host-meson forces to build
> host-python3.
> 
> If Ninja is compatible with both Python 2 and Python 3, why can't we
> use the system-provided Python interpreter rather than building our
> own ?
> 
> Does Meson absolutely needs a Python 3 interpreter ?

Just to illustrate what I'm saying: https://i.imgur.com/xLIziDo.png

A thing that clearly is silly is to build both host-python3 and
host-python, we definitely want to fix this. I think the only way to
fix this properly is to introduce hidden Config.in.host options. This
way, host-ninja would know that host-python3 is going to be built, and
will use it instead of building host-python.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
