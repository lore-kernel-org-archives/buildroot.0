From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 09:29:50 +0200
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
 <20170429143136.3da63d52@free-electrons.com>
 <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
 <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
Message-ID: <20170430092950.3e39e809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 17:02:26 -0300, Mario Rugiero wrote:

> I just realized there was more before The question I answered. The bug got
> fixed in versi?n 4.5.0 of gcc, thus it is unsupported to build with earlier
> versions. The message seen is an instance of this bug.

Then we also have a problem with the host variant: host-protobuf also
requires gcc >= 4.5.0. I've restarted my autobuilder, and it uses an
old version of gcc on the host, which causes host-protobuf to fail
building:

  http://autobuild.buildroot.net/results/539/53908fe11b5b6497205e17c151f02e94fab10999/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
