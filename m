From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 29 Jun 2007 17:28:15 +0300
Subject: [Buildroot] build fails with current uclibc
In-Reply-To: <20070629122556.5f4c5c3a@newbox>
References: <20070628212634.51a2fb0d@newbox> <20070628223106.GH4096@aon.at>
	<001501c7ba26$7f25dd60$6614a8c0@softalap>
	<20070629122556.5f4c5c3a@newbox>
Message-ID: <20070629172815.0a92e6cf@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Jun 2007 12:25:56 +0300
Ivan Kuten wrote:

> > >
> 
> Wchar and locale uCLibc build is correct - i just enabled wchar&locale in uclibc config 
> but not in BR2_ENABLE_LOCALE. Sorry for confusion.
> 

>Hi,
>
>The problem is in *iconv* binary for target, wchar support seems to be ok.
>For successful compilation, remove iconv from makefile. I spend 1 day 
>digging in this problem and finaly decide to disable iconv in the target 
>platform.
>Attached is patch that must be copied into buildroot/toolchain/uClibc/ dir.

>BR,
>Assen Stoyanov

Again, I messed with ucLibc install - if doing from clean install build root this problem appears
and indeed Assen's patch fixes behaviour. 

However doing make from uclibc dir and uclibc .config I can make compile successfully - so it's more buildroot issue that of uclibc.

BR, Ivan
