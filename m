From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 08 Jan 2013 20:47:39 +0200
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <50EC62A2.8020505@petroprogram.com>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130108180957.30c9f629@skate> <50EC62A2.8020505@petroprogram.com>
Message-ID: <50EC69CB.20003@petroprogram.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


Thomas, this is what my getnameinfo() function from
$(STAGING_DIR)/usr/include/netdb.h  looks like:

/* Translate a socket address to a location and service name.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int getnameinfo (__const struct sockaddr *__restrict __sa,
            socklen_t __salen, char *__restrict __host,
            socklen_t __hostlen, char *__restrict __serv,
            socklen_t __servlen, unsigned int __flags);
#endif    /* POSIX */

__END_DECLS

#endif    /* netdb.h */

And here is the snip of my proxychain building

[7m>>> proxychains 3.1 Building[27m
PATH="/mnt/hee/new/buildroot-2012.08/output/host/bin:/mnt/hee/new/buildroot-2012.08/output/host/usr/bin:/mnt/hee/new/buildroot-2012.08/output/host/usr/sbin/:/root/perl5/bin:/root/perl5/bin:/root/perl5/bin:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
PERLLIB="/mnt/hee/new/buildroot-2012.08/output/host/usr/lib/perl" 
/usr/bin/make -j4  -C
/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/
make[1]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1"
/usr/bin/make  all-recursive
make[2]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1"
Making all in proxychains
make[3]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains"
Making all in docs
make[4]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs"
Making all in en
make[5]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs/en"
make[5]: Kohteelle "all" ei tarvitse tehd? mit??n.
make[5]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs/en"
make[5]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs"
make[5]: Kohteelle "all-am" ei tarvitse tehd? mit??n.
make[5]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs"
make[4]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains/docs"
make[4]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/proxychains-3.1/proxychains"
/bin/sh ../libtool --mode=compile
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I..     -pipe -funit-at-a-time -Wno-error -Os
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c
libproxychains.c
/bin/sh ../libtool --mode=compile
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I..     -pipe -funit-at-a-time -Wno-error -Os
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c
core.c
mkdir .libs
 /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -pipe -funit-at-a-time -Wno-error -Os -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Wp,-MD,.deps/libproxychains.pp -c libproxychains.c  -fPIC -DPIC -o
.libs/libproxychains.o
 /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -pipe -funit-at-a-time -Wno-error -Os -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Wp,-MD,.deps/core.pp -c core.c  -fPIC -DPIC -o .libs/core.o
 /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -pipe -funit-at-a-time -Wno-error -Os -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Wp,-MD,.deps/libproxychains.pp -c libproxychains.c -o libproxychains.o
>/dev/null 2>&1
 /mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -pipe -funit-at-a-time -Wno-error -Os -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Wp,-MD,.deps/core.pp -c core.c -o core.o >/dev/null 2>&1
/bin/sh ../libtool --mode=link
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc 
-pipe -funit-at-a-time -Wno-error -Os -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl,-S -Wl,-O1
-Wl,--as-needed -Wl,-z -Wl,combreloc -Wl,--enable-new-dtags
-Wl,--hash-style=gnu -o libproxychains.la -rpath /usr/lib -version-info
3:0:0  libproxychains.lo core.lo -ldl
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
-shared  .libs/libproxychains.o .libs/core.o  -ldl  -Wl,-S -Wl,-O1
-Wl,--as-needed -Wl,-z -Wl,combreloc -Wl,--enable-new-dtags
-Wl,--hash-style=gnu -Wl,-soname -Wl,libproxychains.so.3 -o
.libs/libproxychains.so.3.0.0
(cd .libs && rm -f libproxychains.so.3 && ln -s libproxychains.so.3.0.0
libproxychains.so.3)
(cd .libs && rm -f libproxychains.so && ln -s libproxychains.so.3.0.0
libproxychains.so)
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-ar
cru .libs/libproxychains.a  libproxychains.o core.o
/mnt/hee/new/buildroot-2012.08/output/host/usr/bin/i586-unknown-linux-uclibc-ranlib
.libs/libproxychains.a
creating libproxychains.la


Stefan


8.1.2013 20:17, Stefan Fr?berg kirjoitti:
> Hi Thomas
>
> 8.1.2013 19:09, Thomas Petazzoni kirjoitti:
>> Dear Stefan Fr?berg,
>>
>> On Sun, 23 Dec 2012 02:20:29 +0200, Stefan Fr?berg wrote:
>>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>>> ---
>>>  package/Config.in                  |    1 +
>>>  package/proxychains/Config.in      |    7 +++++++
>>>  package/proxychains/proxychains.mk |   10 ++++++++++
>>>  3 files changed, 18 insertions(+), 0 deletions(-)
>>>  create mode 100644 package/proxychains/Config.in
>>>  create mode 100644 package/proxychains/proxychains.mk
>> This new package generates the following build failure:
>>
>>   http://autobuild.buildroot.org/results/7364b557c1fea642a3631c4735dd93f02ba70dd5/build-end.log
>>
>> Can you try to investigate and see if you can provide a patch to fix it?
>>
>> Thanks!
>>
>> Thomas
> Well, I can try to make a patch to that  libproxychains.c:291:5: error:
> conflicting types for 'getnameinfo'  error but I can't test it in arm
> because I don't
> have any real arm machine here and my poor hard drive is already so
> stuffed that building arm qemu-image would be difficult
>  :-(
>
> But I will take a look of this
>
> Stefan
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
