From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 09:57:14 +0100
Subject: [Buildroot] [PATCH v3 1/1] openpgm: disable on AVR32
In-Reply-To: <1383805921-31909-1-git-send-email-alexander.lukichev@gmail.com>
 (Alexander Lukichev's message of "Thu, 7 Nov 2013 08:32:01 +0200")
References: <1383805921-31909-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <87ppqcio7p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > openpgm doesn't build correctly on AVR32 using
 > gcc-4.2.2-avr32-2.1.5 toolchain: it is configured to call
 > intrinsic atomic functions not provided by the toolchain,
 > so they are propagated as unresolved external symbols in the
 > built openpgm libraries. This breaks programs that try to link
 > openpgm, because they do not know where to get those either. For
 > instance, it breaks building zeromq tests when PGM support is
 > selected.

 > This commit disables openpgm on AVR32 due to apparent absence of
 > interest in this package on that architecture and it breaking too
 > many test builds.

 > Fixes http://autobuild.buildroot.net/results/5a3261109ea63ba17375003eabd8b5d88757865f/
 > (at least)

Committed, thanks.

-- 
Bye, Peter Korsgaard
