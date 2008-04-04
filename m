From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Apr 2008 09:31:58 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
In-Reply-To: <16477104.post@talk.nabble.com> (Hebbar's message of "Thu\,
	3 Apr 2008 18\:52\:35 -0700 \(PDT\)")
References: <20080331142838.8386C3C4EF@busybox.net>
	<16477104.post@talk.nabble.com>
Message-ID: <87zlsavzwx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hebbar" == Hebbar  <gururajakr@sanyo.co.in> writes:

 >> 
 >> Author: jacmet
 >> Date: 2008-03-31 07:28:38 -0700 (Mon, 31 Mar 2008)
 >> New Revision: 21594
 >> 
 >> Log:
 >> avahi: depend on dbus-daemon in staging_dir
 >> 
 >> Depend on dbus-daemon in staging_dir instead of in target_dir as
 >> fakeroot updates the timestamp on the target_dir version every time,
 >> so the avahi makefile thinks it always needs to recompile avahi.

 Hebbar> Hi jacmet,

 Hebbar> Thanks for this info. i always wondered why libusb, ncurses ,
 Hebbar> zlib used to run at the end everytime i give make world. when
 Hebbar> i looked at the respective make file, i found that in
 Hebbar> (package): option, respective target_dir lib files are
 Hebbar> mentioned which rather should point to staging_dir/usr/lib
 Hebbar> library files. kindly let me know if this is correct. if
 Hebbar> correct, then i can send pacthes to change this.

Do you still have that problem now?

 Hebbar> Regards
 Hebbar> Gururaja

 Hebbar> ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)

 Hebbar> zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)

 Hebbar> libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)

No, this seems correct to me. We need the files installed in
TARGET_DIR, so they cannot depend on the files in STAGING_DIR.

-- 
Bye, Peter Korsgaard
