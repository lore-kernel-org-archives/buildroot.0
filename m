From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Feb 2018 05:57:44 +0100
Subject: [Buildroot] Trouble with offline build
References: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
Message-ID: <8fphmex2hp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Tue, 27 Feb 2018 18:34:53 -0500 schrieb A:

> I do a "make source" on a cygwin system that has internet and, and copy 
the
> whole thing over to the build system.

does your cygwin system include a "lzip" binary?

> Then, on the build system, I do a "make", and I get undesired internet
> access attempts and an ultimate failure, which I show below.

[...]
> user at host:~/src/buildroot-2017.11.2$ make source
>>>> host-lzip 1.19 Downloading

Buildroot checks the host system for needed dependencies and, if they are 
missing, downloads and builds the missing package(s), for details check 
the scripts in support/dependencies/. Apparently cygwin includes lzip 
whereas your build system lacks it.

The solution is to call "make host-lzip-source" on your cygwin system and 
then copy lzip-1.19.tar.gz to your build system.

Regards, Bernd
