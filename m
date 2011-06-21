From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 21 Jun 2011 17:05:52 -0400
Subject: [Buildroot] [PATCH v3] ext-toolchain-wrapper.c: Handle an
 arbitrary amount of arguments
In-Reply-To: <1308686067-6091-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1308686067-6091-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <BANLkTinFoKuXU8ba7a5_9mdaP1RgUHi5tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/21 Daniel Nystr?m:
> Even though MAXARGS 1000 seems large, it wasn't enought for at least

enought -> enough

> + ? ? ? cur += sizeof(predef_args) / sizeof(predef_args[0]);

looks like you should add an ARRAY_SIZE define to the top of the file

> + ? ? ? memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));

in practice there's probably no difference, but this should be sizeof(argv[0])
-mike
