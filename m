From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 11 Oct 2016 21:38:39 +0200
Subject: [Buildroot] [PATCH v2] package/upmpdcli: add patch to fix error
 not detecting jsoncpp
In-Reply-To: <8760oysmv5.fsf@dell.be.48ers.dk>
References: <20160925141152.13952-1-joerg.krause@embedded.rocks>
 <8760oysmv5.fsf@dell.be.48ers.dk>
Message-ID: <1476214719.1889.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2016-10-11 at 21:32 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> Fixes:
> ?> http://autobuild.buildroot.net/results/205463c9ea8651911972c2835e2
> 8ded1912c811a
> ?> http://autobuild.buildroot.net/results/5e9279ee60c11a3dacacf6d78f8
> 7f8d1b92968f5
> ?> http://autobuild.buildroot.net/results/97043f8defd5a59ae39b4c7f095
> a10d15c7fe632
> ?> http://autobuild.buildroot.net/results/e775126d5939093289b1a833dd6
> 323ac293322ed
> ?> .. and many more.
> 
> ?> libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
> ?> pkg-config for detecting the libraries and for providing the
> necessary
> ?> details for compiling and linking.
> 
> ?> The current build system of upmpdcli does not use
> PKG_CHECK_MODULES, but
> ?> AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version
> from
> ?> 1.7.2 to 1.7.5 the detection fails, because the test program does
> not
> ?> compile anymore:
> 
> ?> """
> ?> In file included from
> ?> /usr/arm-buildroot-linux-
> gnueabi/sysroot/usr/include/json/autolink.h:9:0,
> ?>??????????????????from
> ?> /usr/arm-buildroot-linux-
> gnueabi/sysroot/usr/include/json/json.h:9,
> ?>??????????????????from test.c:1:
> ?> /usr/arm-buildroot-linux-
> gnueabi/sysroot/usr/include/json/config.h:155:9:
> ?> error: 'int64_t' does not name a type
> ?>??typedef int64_t Int64;
> 
> While changing to pkg-config is perfectly fine (if upstream accepts
> it),
> this problem is really about jsoncpp's config.h using int64_t without
> including <stdint.h>

Gladly, upmpdcli accepted to use pkg-config and jsoncpp fixed this
issue in [1].

[1]?https://github.com/open-source-parsers/jsoncpp/commit/ab0f1e234aa40
147e39cdfd0b97bf6527b8ea5e8

Best regards
J?rg Krause
