From: Will Newton <will.newton@gmail.com>
Date: Tue, 23 Jun 2009 11:53:43 +0100
Subject: [Buildroot] uClibc locale support
Message-ID: <87a5b0800906230353o26db9cbegcd7ccbbe5cbd5b02@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The selection of locale support in the buildroot toolchain menu seems
a little confused. The top-level option is:

Enable locale/gettext/i18n support? BR2_ENABLE_LOCALE

Which will actually enable locale support in uClibc. There's also an
independent option to enable wide character support:

Enable WCHAR support BR2_USE_WCHAR

But the uClibc config selects UCLIBC_HAS_WCHAR if UCLIBC_HAS_LOCALE.is
selected, so surely this option should not be independent?

Also the "Purge unwanted locales" option is dependent on
BR2_ENABLE_LOCALE but would, I believe, be useful with a non-uClibc
locale setup using e.g. iconv.

I'm also not sure why gettext is mention in the menu entry?

The attached patch attempts to fix these issues. Any comments would be
appreciated.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-toolchain-Clean-up-toolchain-locale-support-menu.patch
Type: application/octet-stream
Size: 1657 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090623/3751ced6/attachment.obj>
