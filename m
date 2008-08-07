From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 07 Aug 2008 15:55:04 +0200
Subject: [Buildroot] Python / Lua socket programming
In-Reply-To: <489AEA22.80700@gmail.com>
References: <489AEA22.80700@gmail.com>
Message-ID: <489AFEB8.6000406@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leonardo Giordano wrote:

> For lua, I should add luasocket library but I don't know how.
> 
> Any comments?

You'll need to build lua first, then luasocket as another package, independently.
luasocket relies on lua headers/libs. You'll probably need to fix some
paths in lua(socket) in order for luasocket to find lua stuff inside the
buildroot.

these steps might help:
cd lua-5.1.3
make linux
make install INSTALL_TOP=/home/hinkok/Desktop/lua/out
cd ../luasocket-2.0.2
LUAINC=-I/home/hinkok/Desktop/lua/out/include INSTALL_TOP_SHARE=/home/hinkok/Desktop/lua/out/share INSTALL_TOP_LIB=/home/hinkok/Desktop/lua/out/lib/lua/5.1 make
make install INSTALL_TOP_SHARE=/home/hinkok/Desktop/lua/out/share INSTALL_TOP_LIB=/home/hinkok/Desktop/lua/out/lib/lua/5.1


HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
