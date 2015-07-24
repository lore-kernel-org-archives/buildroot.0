From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 11:31:47 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <1437729695.20708.9.camel@embedded.rocks>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
 <20150724091742.669aaf4a@free-electrons.com>
 <1437729695.20708.9.camel@embedded.rocks>
Message-ID: <20150724113147.28d69deb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 24 Jul 2015 11:21:35 +0200, J?rg Krause wrote:

> Sure. The problem is that with version 0.3.0 it was possible to disable
> auth DES optionally [1]. This was reverted in version 0.3.2 for
> backward compatibility with older glibc's. With commit
> 060b63865c58c716dc94c5987ab19b90899aa340 authdes_create() is defined by
> default in rpc_soc.c, which in return calls the undefined
> authdes_seccreate().
> 
> My suggestion would be to remove authdes_create() in rpc_soc.c.

Where would authdes_seccreate() be normally implemented? For sure the
libtirpc developers didn't simply call an undefined function, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
