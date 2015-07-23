From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 23 Jul 2015 08:15:22 +0200
Subject: [Buildroot] [PATCH 3/3] package/libtirpc: Do not build
 unsupported API files
In-Reply-To: <20150720235021.06f9e815@free-electrons.com>
References: <1437426915-4608-1-git-send-email-joerg.krause@embedded.rocks>
 <1437426915-4608-3-git-send-email-joerg.krause@embedded.rocks>
 <20150720235021.06f9e815@free-electrons.com>
Message-ID: <1437632122.6881.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2015-07-20 at 23:50 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Mon, 20 Jul 2015 23:15:15 +0200, J?rg Krause wrote:
> > Version 0.3.2 re-enables some APIs for backward compatibility with
> > glibc's SunRPC:
> >   - key_prot
> >   - netname
> >   - rtime
> > 
> > Unfortunalty, this breaks building libtirpc with uClibc and musl:
> >   getpublickey.c:41:28: fatal error: rpcsvc/yp_prot.h: No such file 
> > or directory
> 
> Should this be part of
> 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch ? yp_prot.h 
> is
> also NIS related.

I see! So, I will squash these two patches and submit a v2.

Best regards
J?rg Krause
