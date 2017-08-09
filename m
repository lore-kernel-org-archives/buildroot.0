From: Jim Langston <jim.langston@gmail.com>
Date: Tue, 8 Aug 2017 22:44:43 -0400
Subject: [Buildroot] Buildroot and Xenomai 3.0.5 driver build issues...
Message-ID: <CAF06wtgdv8TbUay_9FKX4uA8JA6w9+wVPEYemQYoEXTr1yTNCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been trying to build a Xenomai driver with Xenomai 3.0.5 and the old
'Alchemy/Native' skin under Buildroot 2017.02.02.  I realize that this is
an older version, but I see nothing in the changelogs that seems to be
relevant to the issues I'm facing.

Basically it boils down to the fact that Xenomai's headers that override or
extend system header files all use "#include_next<>", and the '-nostdinc'
option along with the '-isysroot' option being being passed to GCC do not
include the actual system header file, in this case pthread.h, so the
compile fails.

I remember stumbling across a discussion about "include_next<>" from a
thread late last year, but cannot find it.  About all I remember is there
was a comment to the effect, "packages that use #include_next<> will have
issues".

Has anyone out there had any success building RTDM drivers with Xenomai 3
under Buildroot 2017.02.02 (or newer)?

Thanks,
Jim
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170808/478163d8/attachment.html>
