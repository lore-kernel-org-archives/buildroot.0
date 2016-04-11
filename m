From: Lukas Musil <dizzy.lukas@gmail.com>
Date: Mon, 11 Apr 2016 11:57:06 +0200
Subject: [Buildroot] Problem with building system with unicode support
Message-ID: <CADRWh5YmmDuD2GPrHDLKU1VfhYs-wmqyoGpQP+eSQ=ZYevHo9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying build system with unicode support (console mode only yet) and I
stuck on this few days.

Problem:
When I try list test file filename with "ls" or show it content with "cat"
all is ok, but when I try edit it with "vi" from busybox, so only wrong
characters(dots) instead of accents are displayed.
Dialog displays some wrong and some correct characters.
Midnight Commander show only "?" instead accents characters in filename,
"mcedit" have similar output like dialog, changing Display bits to UTF-8
not fixing it.

Brief Info about system:
Buildroot 2016.02, glibc, busybox, bash, kbd...
Variables LANG/LANGUAGE set to en_US.UTF-8
Use console font Uni1-VGA16.psf from Debian or Lat2-Terminus16.psfu.gz with
same results
For testing I use text file with name "test-??????????-test.txt" with this
content "-??????????-" (some czech accents characters).


Some related(I Think) config option:

Buildroot:
BR2_USE_WCHAR=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_GENERATE_LOCALE="en_US en_US.UTF-8"
# BR2_PACKAGE_PERL_ENCODE_LOCALE is not set
BR2_PACKAGE_PCRE_UTF=y
BR2_PACKAGE_PCRE_16=y
BR2_PACKAGE_PCRE_32=y
BR2_PACKAGE_KBD=y

Busybox:
CONFIG_UNICODE_COMBINING_WCHARS=y
CONFIG_UNICODE_WIDE_WCHARS=y
# CONFIG_UNICODE_BIDI_SUPPORT is not set
# CONFIG_UNICODE_NEUTRAL_TABLE is not set
CONFIG_UNICODE_PRESERVE_BROKEN=y

Full buildroot config is here:
https://www.dropbox.com/s/s1yx1z8x9rewmr2/.config?dl=0

Full busybox config is here:
https://www.dropbox.com/s/tt6timqrunmglhk/busybox.config?dl=0

Thanks for your time.
Regards, Lukas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160411/0c05e56c/attachment.html>
