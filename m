From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 1 Nov 2013 22:21:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <20131101192027.1ea4c1bc@skate>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
Message-ID: <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Simon,

The compiler (that particular toolchain) has those intrinsic functions but
is able to generate them only if the exact CPU sub architecture is
specified, not just AVR32 (their implementations differ for each of the two
sub architectures). This is impossible to specify unless we introduce it in
the buildroot configuration system (like several flavors of ARM). And this,
in turn, seems too much to make just one package happy.

I tried to disable using them in the package code by playing with
configure.ac but unsuccessfully: the code used instead some thread
functions that were not provided by the toolchain (at least, not with the
constants defined in configure). In the end, it seemed too much trouble
since nobody showed interest in the package, especially on this
architecture, and it breaks builds for AVR32.

I did not know how to explain all this concisely in openpgm's Config.in,
sorry :-)

Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131101/51569260/attachment.html>
