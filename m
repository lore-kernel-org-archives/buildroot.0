From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue, 16 Jun 2009 17:46:37 +0200
Subject: [Buildroot] [PATCH] iptables: use multipurpose binaries
In-Reply-To: <20090616134039.GA9914@mx.loc>
References: <20090616112441.47d6b67c@bandomeer.europe.flane.local>
	<20090616134039.GA9914@mx.loc>
Message-ID: <20090616174637.18c1c002@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2009 15:40:39 +0200
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:

> On Tue, Jun 16, 2009 at 11:24:41AM +0200, Olaf Rempel wrote:
> >Let iptables use the *-multi binaries:
> 
> Sounds good. Does it build now with IPv6 disabled and how much difference is
> a pure ipv4 versus v4+v6 size() wise?
> 

Yep, v4only builds ok (no runtime test)

i586 v4only:
$ du -scb lib/libuClibc-0.9.30.1.so usr/sbin/ip*tables* usr/lib/xtables
297672  lib/libuClibc-0.9.30.1.so
14      usr/sbin/iptables
38077   usr/sbin/iptables-multi
14      usr/sbin/iptables-restore
14      usr/sbin/iptables-save
324312  usr/lib/xtables
660103  total

i586 v4+v6:
$ du -scb lib/libuClibc-0.9.30.1.so usr/sbin/ip*tables* usr/lib/xtables
301768  lib/libuClibc-0.9.30.1.so
15      usr/sbin/ip6tables
30773   usr/sbin/ip6tables-multi
15      usr/sbin/ip6tables-restore
15      usr/sbin/ip6tables-save
14      usr/sbin/iptables
38077   usr/sbin/iptables-multi
14      usr/sbin/iptables-restore
14      usr/sbin/iptables-save
386304  usr/lib/xtables
757009  total

Regards
Olaf
