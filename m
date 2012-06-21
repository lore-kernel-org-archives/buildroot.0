From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 21 Jun 2012 21:24:31 +0000 (UTC)
Subject: [Buildroot] preparing rootfs with gcc in buildroot
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
 <20120621142848.4caafde0@skate>
 <CAGXs5wXPo4wtWY9H0Ec761e0zEUCa_3u3-YH04jzZcW_m=ju+Q@mail.gmail.com>
 <jrvjm2$sls$1@dough.gmane.org> <4FE38489.8060803@mind.be>
Message-ID: <js03ef$2qm$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-21, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/21/12 18:55, Grant Edwards wrote:
>> If you want to build things that use libraries that were built as part
>> of buildroot, then you have to add a couple more command line options
>> to tell the compiler/linker where to find the include and library
>> files created by buildroot (e.g.<wherever>/output/target.
>
> And even that is not necessary if you use output/host/usr/bin/xxx-gcc
> as the cross-compiler - that one has the sysroot hard-coded.

Right -- if you have buildroot build your compiler.  If you're using
an external compiler (e.g. one built separately with crosstool-ng),
you need to tell it where buildroot's libraries and include files are.

> By the way, you should point to <wherever>/output/staging, not
><wherever>/output/target.  target doesn't normally contain header
> files or static libraries.

Yup, my mistake.

-- 
Grant
