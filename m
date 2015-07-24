From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 24 Jul 2015 13:26:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <20150724113147.28d69deb@free-electrons.com>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
 <20150724091742.669aaf4a@free-electrons.com>
 <1437729695.20708.9.camel@embedded.rocks>
 <20150724113147.28d69deb@free-electrons.com>
Message-ID: <1437737186.9920.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-07-24 at 11:31 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Fri, 24 Jul 2015 11:21:35 +0200, J?rg Krause wrote:
> 
> > Sure. The problem is that with version 0.3.0 it was possible to 
> > disable
> > auth DES optionally [1]. This was reverted in version 0.3.2 for
> > backward compatibility with older glibc's. With commit
> > 060b63865c58c716dc94c5987ab19b90899aa340 authdes_create() is 
> > defined by
> > default in rpc_soc.c, which in return calls the undefined
> > authdes_seccreate().
> > 
> > My suggestion would be to remove authdes_create() in rpc_soc.c.
> 
> Where would authdes_seccreate() be normally implemented? For sure the
> libtirpc developers didn't simply call an undefined function, no?

It's implemented in auth_des.c which we removed from building with
patch #1.

gentoo has a patch removing authdes_create(), too [1].

[1]
https://gitweb.gentoo.org/proj/hardened-dev.git/diff/net
-libs/libtirpc/files/0007-no-des.patch?id=74727efe

Best regards
J?rg Krause
