From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 May 2018 23:26:02 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180502090508.12893-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Wed, 2 May 2018 12:05:08 +0300")
References: <20180502090508.12893-1-chemobejk@gmail.com>
Message-ID: <878t90ctxx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > crypt() is an optional glibc feature. Some distros, like Fedora 28, are
 > phasing it out to be replaced with libxcrypt [1]. Unfortunately this
 > change is only ABI compatible, not source code compatible, i.e. the code
 > will compile with warnings about undefined crypt(), but the resulting
 > binary will crash.

 > Follow the guidance in the Fedora bug and include crypt.h when
 > _XOPEN_CRYPT is not defined.

 > [1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464

 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
