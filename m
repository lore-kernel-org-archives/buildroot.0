From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 21 Jun 2011 23:20:17 +0200
Subject: [Buildroot] [PATCH v3] ext-toolchain-wrapper.c: Handle an
 arbitrary amount of arguments
In-Reply-To: <BANLkTinFoKuXU8ba7a5_9mdaP1RgUHi5tw@mail.gmail.com>
References: <1308686067-6091-1-git-send-email-daniel.nystrom@timeterminal.se>
 <BANLkTinFoKuXU8ba7a5_9mdaP1RgUHi5tw@mail.gmail.com>
Message-ID: <BANLkTikF8TuxejYUiGzfPC7HDFwRRYOdSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your comments, Mike!

2011/6/21 Mike Frysinger <vapier@gentoo.org>:
> 2011/6/21 Daniel Nystr?m:
>> Even though MAXARGS 1000 seems large, it wasn't enought for at least
>
> enought -> enough

Thanks. I'm sure Peter will fix the spelling when committing.

>> + ? ? ? cur += sizeof(predef_args) / sizeof(predef_args[0]);
>
> looks like you should add an ARRAY_SIZE define to the top of the file
>
>> + ? ? ? memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
>
> in practice there's probably no difference, but this should be sizeof(argv[0])

I actually had both of these in mind, but ended up with this since I
think it looks most "clean". But I guess it's a matter of taste.
