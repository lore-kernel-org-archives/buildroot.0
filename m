From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2011 08:43:34 +0200
Subject: [Buildroot] [PATCH 1/9] external toolchain: slightly optimize
 the copy of the toolchain sysroot
In-Reply-To: <87ehylesfb.fsf@macbook.be.48ers.dk>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <98f060c40fdcc7c9d5464838a21d2ee7bc44971a.1318182187.git.thomas.petazzoni@free-electrons.com>
 <87ehylesfb.fsf@macbook.be.48ers.dk>
Message-ID: <20111010084334.2d3d0544@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 10 Oct 2011 00:00:56 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> FYI, this breaks on readonly source directories unless you have the new
> rsync 3.0.9, which most people don't. I haven't figured out a good fix
> for older rsync versions yet.

Do you have some details ?

Because:

$ rsync --version | grep version
rsync  version 3.0.7  protocol version 30
$ ls -lR toto/
toto/:
total 4
-r--r--r-- 1 thomas thomas    0 2011-10-10 08:41 b
dr-xr-xr-x 2 thomas thomas 4096 2011-10-10 08:41 titi

toto/titi:
total 0
-r--r--r-- 1 thomas thomas 0 2011-10-10 08:41 a
$ mkdir plop
$ rsync -au toto/ plop/

And it works just fine.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
