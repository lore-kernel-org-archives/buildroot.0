From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 08:10:06 +0200
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
 <877ghppyyf.fsf@dell.be.48ers.dk>
 <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
Message-ID: <20130620081006.5adbce32@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Thu, 20 Jun 2013 07:45:26 +0300, Assaf Inbal wrote:
> >
> > Care to resend with these issues fixed? Thanks.
> 
> 
> See attached.

+# Luaposix attempts to run Lua as a part of the configure proccess, it needs to
+# find the location of liblua.so in order for the binary to execute
+LUAPOSIX_CONF_ENV = LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"

I still don't quite understand why this is needed. All binaries built
and installed in $(HOST_DIR)/usr/bin are compiled with a RPATH of
$(HOST_DIR)/usr/lib, so normally, passing a LD_LIBRARY_PATH is not needed.

Can you check if the host lua in $(HOST_DIR)/usr/bin/ has the correct
RPATH, by doing:

readelf -d $(HOST_DIR)/usr/bin/lua | grep RPATH

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
