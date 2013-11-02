From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Sat, 2 Nov 2013 09:16:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
Message-ID: <CAAHaz6H+eqGoMKgp5bweXcq6KJdmvaM7O6ycpzY9=yun2CyOMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2013/11/1 Alexander Lukichev <alexander.lukichev@gmail.com>

> The compiler (that particular toolchain) has those intrinsic functions

> but is able to generate them only if the exact CPU sub architecture

> is specified, not just AVR32 (their implementations differ for each of

> the two sub architectures)
....
> I tried to disable using them in the package code by playing with
> configure.ac but unsuccessfully: the code used instead some thread
> functions that were not provided by the toolchain (at least, not with
> the constants defined in configure). In the end, it seemed too much
...
> I did not know how to explain all this concisely in openpgm's Config.in,
> sorry :-)

So, since in both cases the project was configured incorrectly for building
by
that toolchain, the comment I have put in Config.in did not seem misleading
to me.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/0f799aa4/attachment.html>
