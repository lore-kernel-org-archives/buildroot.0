From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Sep 2010 07:51:18 +0100
Subject: [Buildroot] /etc/ld.so.conf and /etc/ld.so.conf.d in buildroot
 target skeleton
In-Reply-To: <AANLkTi=V6mNKXRM=c5KJHugtVyqai3At-sp5fQ8mFiTu@mail.gmail.com>
References: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
	<AANLkTi=LRi8OJTNY-3_q0_c=qcO4yv-sQoaJr=w=F=sf@mail.gmail.com>
	<AANLkTim=o6+2+jBXk0NAOv7md5TkK_V1tW9bcmsWfBER@mail.gmail.com>
	<1284659221.12897.414.camel@coalu.atr>
	<AANLkTi=0_3BUjZ-gww3Kz99Y1dfvBcoNebrWX_fwE+u2@mail.gmail.com>
	<1284895170.12897.546.camel@coalu.atr>
	<AANLkTi=V6mNKXRM=c5KJHugtVyqai3At-sp5fQ8mFiTu@mail.gmail.com>
Message-ID: <20100921075118.5a58154a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Sep 2010 16:39:24 +0200
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> That looks like a good solution.
> In case of uClibc though, the parsing of ld.so.conf is a configurable
> option (LDSO_CACHE_SUPPORT), so before generating an ld.so.conf we
> should check whether that option is set.

We don't really support any other uClibc configuration than the one we
ship in toolchain/uClibc/uClibc-x.y.z.config. If an user changes the
configuration we provide, (s)he has to be ready for some build
breakage, because we are testing the build of all packages only with
this specific uClibc configuration. I don't think we can sanely enter
the game that would consist in handling all possible uClibc
configurations to know which packages need what.

Concerning LDSO cache, the LDSO_CACHE_SUPPORT is disabled in our
default configuration.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
