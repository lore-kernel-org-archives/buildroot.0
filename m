From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 31 Jul 2016 14:47:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
In-Reply-To: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1469969267.9042.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-07-31 at 11:51 +0200, Bernd Kuhls wrote:
> After fixing the usual sys/cdefs.h and _P stuff the build still fails
> because Openswan makes use of GLOB_ functions
> 
> /home/bernd/buildroot/br4/output/build/openswan-
> 2.6.48/lib/libipsecconf/parser.l:200:29: error: ?GLOB_BRACE?
> undeclared (first use in this function)
> ??????globresult = glob(try, GLOB_BRACE, NULL, &globbuf);
> ?????????????????????????????^
> /home/bernd/buildroot/br4/output/build/openswan-
> 2.6.48/lib/libipsecconf/parser.l:200:29: note: each undeclared
> identifier is reported only once for each function it appears in
> /home/bernd/buildroot/br4/output/build/openswan-
> 2.6.48/lib/libipsecconf/parser.l:207:41: error: ?GLOB_NOMAGIC?
> undeclared (first use in this function)
> ???????globresult = glob(try, GLOB_BRACE|GLOB_NOMAGIC, NULL,
> &globbuf);
> 
> https://github.com/xelerance/Openswan/blob/master/lib/libipsecconf/pa
> rser.l#L200
> https://github.com/xelerance/Openswan/blob/master/lib/libipsecconf/pa
> rser.l#L207
> [...]
> ?????????????????????????????????????????^
> which musl does not support:
> http://www.openwall.com/lists/musl/2013/09/16/1
> 

Maybe we can add libglob [1] as a package and add it as a musl
dependencies like we do it with netbsd-queue?

[1]?https://github.com/voidlinux/libglob

Best regards
J?rg Krause
