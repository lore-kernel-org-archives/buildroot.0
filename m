From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 22 Jan 2015 00:20:02 +0100
Subject: [Buildroot] [PATCH try 4] wine: New package
In-Reply-To: <54C03142.4010105@openwide.fr>
References: <54BED214.6080601@dawncrow.de> <54C03142.4010105@openwide.fr>
Message-ID: <54C03422.8050500@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.01.2015 um 00:07 schrieb Romain Naour:
> I'm building your wine package on my 64bits host and the build fail
> because freetype library in HOST_DIR is build for it, but wine is
> build for 32bits host.
> 
> see my config.log output:
> configure:10886: checking for -lfreetype
> configure:10911: /usr/bin/gcc -m32 -o conftest -O2 -I/home/naourr/git/buildroot/test/wine/host/usr/include -I/home/naourr/git/buildroot/test/wine/host/usr/include -I/home/naourr/git/buildroot/test/wine/host/usr/include/freetype2   -L/home/naourr/git/buildroot/test/wine/host/lib -L/home/naourr/git/buildroot/test/wine/host/usr/lib -Wl,-rpath,/home/naourr/git/buildroot/test/wine/host/usr/lib conftest.c -lfreetype -L/home/naourr/git/buildroot/test/wine/host/usr/lib -lfreetype    >&5
> /usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: skipping incompatible /usr/lib64/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: cannot find -lfreetype
> /usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: skipping incompatible /home/naourr/git/buildroot/test/wine/host/usr/lib/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: skipping incompatible /usr/lib64/libfreetype.so when searching for -lfreetype
> /usr/bin/ld: cannot find -lfreetype
> collect2: error: ld returned 1 exit status
> 
> It seems that --enable-win64 must be added to HOST_WINE_CONF_OPTS
> for 64bits host.

Wow, good catch, thanks!
Guess it didn't failed on my machine because i also have 32-bit freetype installed on the host.
