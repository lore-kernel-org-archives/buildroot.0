From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 23 Jan 2014 18:02:56 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <CAGzWX_Jgdzctc_=-9XBg4Bw__KtdNwF3MChWvG4mi6XVNFUEhQ@mail.gmail.com>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric>
 <1390290077263-60414.post@n4.nabble.com>
 <20140121173657.GA11605@pc-eric>
 <1390420630566-60535.post@n4.nabble.com>
 <20140123134942.GA10856@pc-eric>
 <CAGzWX_Jgdzctc_=-9XBg4Bw__KtdNwF3MChWvG4mi6XVNFUEhQ@mail.gmail.com>
Message-ID: <20140123170253.GB10856@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 23, 2014 at 03:27:32PM +0100, Samuel Buffet wrote:

I poked my nose in your build/python-pygobject-2.28.6/config.log. The
configure script of pygobject complains about not having found Python headers
because it fails to compile a test program:

> configure:14934: checking for headers required to compile python extensions
> configure:14954: /home/toto/Documents/homeproject/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/toto/Documents/homeproject/buildroot/output/host/usr/include/python2.7 -I/home/toto/Documents/homeproject/buildroot/output/host/usr/include/python2.7 conftest.c
> In file included from /home/toto/Documents/homeproject/buildroot/output/host/usr/include/python2.7/Python.h:58:0,
>                  from conftest.c:26:
> /home/toto/Documents/homeproject/buildroot/output/host/usr/include/python2.7/pyport.h:849:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
> [...]
> configure:14959: result: not found
> configure:14961: error: could not find Python headers

Are you building a 32-bit ARM guest on a 64-bit host machine?
I dug into the mailing list and found this discussion, which seems to be
related to this problem:
http://lists.busybox.net/pipermail/buildroot/2011-August/045038.html.

Best regards,
ELB
