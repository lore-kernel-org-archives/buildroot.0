From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 22:55:11 +0200
Subject: [Buildroot] Mplayer
In-Reply-To: <4BD9E3BF.8080106@gmail.com> (Paulius Zaleckas's message of "Thu, 
	29 Apr 2010 22:53:35 +0300")
References: <w2w76d09b281004291240oe35449fdz226a42e12a5097a0@mail.gmail.com>
	<4BD9E3BF.8080106@gmail.com>
Message-ID: <8739y4agy8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> On 04/29/2010 10:40 PM, Bart Otten wrote:
 >> I get a error building mplayer with buildroot, how can i fix it?
 >> 
 >> -mtune=geode -march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 >> -D_FILE_OFFSET_BITS=64 -fomit-frame-pointer -D_REENTRANT
 >> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
 >> -DHAVE_CONFIG_H
 >> -I/home/Bart/Downloads/buildroot-2010.02/output/staging/usr/include
 >> -I/usr/X11/include -c -o m_property.o m_property.c
 >> In file included from /usr/X11/include/features.h:354,
 >> from /usr/X11/include/stdio.h:28,
 >> from mplayer.c:5:
 >> /usr/X11/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file
 >> or directory
 >> In file included from /usr/X11/include/features.h:354,
 >> from /usr/X11/include/stdlib.h:25,
 >> from m_property.c:7:
 >> /usr/X11/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file

 Paulius> I think I had similar problem. Selecting i386 target
 Paulius> architecture instead of i586 solved my problem.

Hmm, I did a i686 testbuild yesterday without problems (except for the
largefile stuff I fixed).

The problem above seems to be that it somehow end up using host headers
(/usr/X11/) - Could you post your mplayer configure.log?

The /usr/X11 btw looks a bit odd - What distribution is this?

-- 
Bye, Peter Korsgaard
