From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 11:20:33 +0200
Subject: [Buildroot] [CFT, PATCH] libelf 64bit problems vs. ltrace
In-Reply-To: <20070919193600.GD817@aon.at>
References: <0709192052250.18886@somehost> <20070919193600.GD817@aon.at>
Message-ID: <20070920092033.GB27699@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 09:36:00PM +0200, Bernhard Fischer wrote:
>On Wed, Sep 19, 2007 at 09:06:54PM +0200, Cristian Ionescu-Idbohrn wrote:
>>but libvorbis fails to build:
>>
>>  In file included from mdct.c:44:
>>  ../include/vorbis/codec.h:26:21: error: ogg/ogg.h: No such file or
>>  directory
>>
>>Can't seem to be able to build ltrace; something to do with configure not
>>being able to locate gelf.h, but it's there:
>>staging_dir/usr/include/libelf, as libelf build ok; I get a configure
>>error:
>>
>>  checking gelf.h usability... no
>>  checking gelf.h presence... no
>>  checking for gelf.h... no
>>  configure: error: ***** gelf.h not found *****
>>
>>config.log says in more than one place:
>>
>>  /usr/include/libelf/gelf.h:49:2: error: #error "GElf is not supported on
>>    this sysystem."
>>
>>and bails out further down with:
>>
>>  configure:3629: checking for gelf.h
>>  configure:3636: result: no
>>  configure:3643: error: ***** gelf.h not found *****
>>
>>ac_cv_header_gelf_h=no may have something to do with it.
>>
>>Any ideas?
>
>I've updated ltrace some months ago, but i admit that i have no idea
>which box this big patches are on :-/
>...
>$ ls -ltrn buildroot.mine.OLD.OLD/package/ltrace/
>total 804
>-rw-r--r-- 1 1000 1000 627890 Apr  6 14:58 ltrace-svn-20070406.00.patch
>-rw-r--r-- 1 1000 1000 173414 Apr  6 15:04 ltrace-svn-20070406.01.autoreconf.patch
>-rw-r--r-- 1 1000 1000   2298 Apr  6 15:07 ltrace.mk
>-rw-r--r-- 1 1000   40    241 Apr  6 15:25 Config.in
>
>I.e. Not too good.
>
>Perhaps try this updated version?

The attached builds at least (with largefile enabled for a start).
Can you confirm that this works for you so i can apply it?

Too big for the list, so it's here:
http://uclibc.org:/~aldot/buildroot/br2.libelf64-cluebait+ltrace-update.00.diff.bz2

TIA for testing it..
