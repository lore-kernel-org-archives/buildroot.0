From: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 17 Feb 2013 18:49:27 +0000
Subject: [Buildroot] bump libnl to 3.2.21 before release
Message-ID: <51212637.6020406@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The libnl library versions 3.2.18 and 3.2.19 have an unnecessary
incompatibility problem that has been removed in the later versions.
This problem affected me and went away when I went to 3.2.21.

I suggest we bump the libnl package to 3.2.21, before the release, to
avoid that incompatibility mess.

From libnl website:

Important: 3.2.10 reverted an an uneeded SONAME bump that was done due
to an ABI/API breakage in an unused API. After severe discussion, it was
decided to undo the SONAME bump to make life easier for distribution
maintainers by removing the unused APIs from the public header files and
by providing compat header files that mistakenly included them.

If you linked against 3.2.18 or 3.2.19 your binary will not be
compatible with >= 3.2.20. You will have to relink your binary. We are
sorry for any inconvenience this may cause.

Note: The API/ABI that is exported as of 3.2.21 is considered 100%
stable. No more exceptions that cause confusion and breakage. I will no
longer merge patches that break API/ABI even though the API seems unused
at this point. Things have been broken too many times.

Regards,
Dimitris
