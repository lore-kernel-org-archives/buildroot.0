From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 21:34:33 +0100
Subject: [Buildroot] [PATCH] lighttpd: requires a Lua 5.1.x
In-Reply-To: <CAB0FRsvFSPO_EKWM01kYG367CNE_FwETWPPNZqK6CxroLk-g+A@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 18 Jan 2016
 21:16:04 +0100")
References: <1453030107-7010-1-git-send-email-francois.perrad@gadz.org>
 <8760yq7lvs.fsf@dell.be.48ers.dk>
 <CAB0FRsvFSPO_EKWM01kYG367CNE_FwETWPPNZqK6CxroLk-g+A@mail.gmail.com>
Message-ID: <87h9ia62zq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > Peter,
 > I try this patch, it fixes only the file src/mod_magnet.c,
 > but it doesn't fix the compilation of src/mod_cml_lua.c

 > ibtool: compile:
 > /home/user/build/sourcery/host/usr/bin/arm-none-linux-gnueabi-gcc
 > -DHAVE_CONFIG_H -DHAVE_VERSION_H -DLIBRARY_DIR=\"/usr/lib/lighttpd\"
 > -DSBIN_DIR=\"/usr/sbin\" -I. -I.. -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_REENTRANT
 > -D__EXTENSIONS__ -DOPENSSL_NO_KRB5 -D_FILE_OFFSET_BITS=64
 > -D_LARGEFILE_SOURCE -D_LARGE_FILES
 > -I/home/user/build/sourcery/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 > -Wall -W -Wshadow -pedantic -std=gnu99 -c mod_cml_funcs.c  -fPIC -DPIC
 > -o .libs/mod_cml_la-mod_cml_funcs.o
 > mod_cml_lua.c: In function 'lua_to_c_get_string':
 > mod_cml_lua.c:54:18: error: 'LUA_GLOBALSINDEX' undeclared (first use
 > in this function)
 >   lua_gettable(L, LUA_GLOBALSINDEX);

Hmm, are you sure you applied the patch correctly?

From the diff, it seems like you didn't patch mod_cml_lua.c:

https://redmine.lighttpd.net/projects/lighttpd/repository/revisions/3070/diff/branches/lighttpd-1.4.x/src/mod_cml_lua.c?utf8=%E2%9C%93&type=sbs

-- 
Venlig hilsen,
Peter Korsgaard 
