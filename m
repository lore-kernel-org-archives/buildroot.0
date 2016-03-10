From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 21:02:05 +0100
Subject: [Buildroot] [PATCH] package/uclibc: defconfig: enable
	sha-256/512 password auth support
In-Reply-To: <1457457777-9017-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 8 Mar 2016 18:22:57 +0100")
References: <1457457777-9017-1-git-send-email-peter@korsgaard.com>
Message-ID: <87wppaksoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As recently reported on the mailing list:
 > http://lists.busybox.net/pipermail/buildroot/2016-February/154130.html

 > Our configuration options to use sha-256 / sha-512 password encoding do not
 > work very well with uClibc-ng as our defconfig doesn't enable support for
 > these encodings, breaking E.G. password login with dropbear.

 > Notice that it doesn't break login with the busybox login applet, as we
 > currently force the use of the internal busybox password handling routines
 > when sha-256/512 encoding is used. This workaround can afaik now be removed.

 > To fix this, enable support for these password encodings in our defconfig.
 > Do it unconditionally and not based on BR2_TARGET_GENERIC_PASSWD_* so it
 > also works when a Buildroot toolchain is reused as an external toolchain and
 > as the support code is quite small (~8KB):

 > -rwxr-xr-x 1 peko peko 13360 Mar  7 22:56 output/target/lib/libcrypt-1.0.12.so
 > -rwxr-xr-x 1 peko peko 21552 Mar  7 23:47 output-sha/target/lib/libcrypt-1.0.12.so

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
