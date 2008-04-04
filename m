From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 3 Apr 2008 18:52:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <20080331142838.8386C3C4EF@busybox.net>
References: <20080331142838.8386C3C4EF@busybox.net>
Message-ID: <16477104.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
>Author: jacmet
>Date: 2008-03-31 07:28:38 -0700 (Mon, 31 Mar 2008)
>New Revision: 21594
>
>Log:
>avahi: depend on dbus-daemon in staging_dir
>
>Depend on dbus-daemon in staging_dir instead of in target_dir as
>fakeroot updates the timestamp on the target_dir version every time,
>so the avahi makefile thinks it always needs to recompile avahi.

Hi jacmet,

Thanks for this info. i always wondered why libusb, ncurses , zlib used to
run at the end everytime i give make world. when i looked at the respective
make file, i found that in (package): option, respective target_dir lib
files are mentioned which rather should point to staging_dir/usr/lib library
files. kindly let me know if this is correct. if correct, then i can send
pacthes to change this.

Regards
Gururaja

ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)

zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)

libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-avahi-tp16400626p16477104.html
Sent from the BuildRoot mailing list archive at Nabble.com.
