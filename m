From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 31 Jan 2011 23:06:14 -0500
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
 Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <AANLkTik2iJ5iDsEEgp7bFqscbTLHuy95QL4tndhQe7MM@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 31, 2011 at 22:52, Sonic Zhang wrote:
> configure parameter --target has different meaning from buildroot environment
> parameter GNU_TARGET_NAME. GNU_TARGET_NAME is actually equal to --host.
>
> ?--build=BUILD ? ? configure for building on BUILD [guessed]
> ?--host=HOST ? ? ? cross-compile to build programs to run on HOST [BUILD]
> ?--target=TARGET ? configure for building compilers for TARGET [HOST]
>
> --target is rarely used by most packages and is redundant in configure line.
> If some packages do need --target, they can append it to buildroot environment
> parameter INETUTILS_CONF_OPT in packages' makefile.

not really ... the usage is harmless.  it might be a little redundant
since target tends to default to host, but that's about it.  what are
you actually trying to address here ?

[resending with buildroot subscription]
-mike
