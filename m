From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 19:20:37 +0200
Subject: [Buildroot] [PATCH 04/11] elftosb: fix build forcing g++
 compiler
In-Reply-To: <1342963719-1810-5-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20120722192037.5a72654c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jul 2012 15:28:32 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> + .c.o :
> +-	gcc ${CFLAGS} -c $<
> ++	$(CXX) ${CXXFLAGS} -c $<

It should be $(CC) here, no?

> + %.d: %.c
> + 	@set -e; \
> +-	$(CC) -MM $(CFLAGS) $< | \
> ++	$(CXX) -MM $(CXXFLAGS) $< | \

And it should remain $(CC) here, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
