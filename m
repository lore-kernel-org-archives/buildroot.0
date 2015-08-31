From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Aug 2015 14:28:54 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
In-Reply-To: <55E443B0.4010503@gmail.com>
References: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
 <6966330.pLhB8QsgjT@raillard-dv6>
 <20150828100932.738b1809@free-electrons.com>
 <2694397.HiyaVxjcGY@raillard-dv6>
 <20150828132047.5ef4eec8@free-electrons.com>
 <20150828130109.GA2808@waldemar-brodkorb.de>
 <55E32486.5070501@gmail.com>
 <20150831060501.GA9163@waldemar-brodkorb.de>
 <55E443B0.4010503@gmail.com>
Message-ID: <20150831142854.28f7fb92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas,

On Mon, 31 Aug 2015 14:08:16 +0200, Douglas RAILLARD wrote:

> BTW: Are there any benefits in using 2.24 (default) instead of 2.25.1
> and also gcc 4.9.x (default) instead of gcc 5.x ?

It's just because when it comes to toolchain components, we are a bit
conservative, and generally default to the version just before the last
one. New version of gcc/binutils often exhibits some issues on
non-mainstream architectures, so this policy allows to wait a bit that
the big issues are found/fixed before we use them as the default.

For example, gcc 5.x has more strict rules which causes many packages
to not build anymore. Hence, we cannot use it as the default for the
moment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
