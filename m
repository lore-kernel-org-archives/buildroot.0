From: Friday Nick <fridaynick@gmail.com>
Date: Sat, 5 Jun 2010 16:16:12 +0300
Subject: [Buildroot] Generation toolchain that supports EABI 0
Message-ID: <AANLkTikhORrvIEt23SdvEAnjVhjmurDQK5sQ6mVnEZ-2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!
I'm in need to generate a toolchain (based on uClibc), that can
generate binary files in EABI version 0 format. Is it possible to do
with buildroot? How can i do that? I've been told that there are
difficulties to rebuild infrastructure (that is the most "useful"
answer i've got so far).
If not, is it possible to create my own EABI0 toolchain, using uClibc?
How this process differs from the ordinary EABI4 toolchain generation?
Thanks a lot for any answer!


And below is a long story, why do i need that :)
I have an embedded device, and my task is to write an application for
it, that uses OpenSSL libraries, installed on it. Unfortunately, when
i try to link my application with those libraries, i get an error
("your current EABI version is 4, but the library has EABI version
0"). I searched through google, and found that almost everywhere the
solution is to replace those "version 0" libraries with a newer ones
(to ask a vendor, for example). I can't do that, because i need to
change firmware, and i'm not allowed to do that on a target device.

As i understand, uClibc should be compiled as EABI v0 either. Will
applications, that are compiled with that EABI4 toolchain work on
device, that has EABI0 uClibc version?
Strange thing is that on my device my current applications (compiled
as EABI4) work with installed uclibc (which is EABI4 or EABI0? I don't
know..), but when i try to link with installed there OpenSSL libraries
(they are EABI0), i get an error.
