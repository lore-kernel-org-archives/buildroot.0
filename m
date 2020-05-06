From: Andreas Ziegler <br015@umbiko.net>
Date: Wed, 06 May 2020 04:58:06 +0000
Subject: [Buildroot] Help: to understand build root
In-Reply-To: <mailman.1722.1588710254.59095.buildroot@busybox.net>
References: <mailman.1722.1588710254.59095.buildroot@busybox.net>
Message-ID: <121ecb5d43fff1ec9fd9e65f6f99e9ac@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kunal,

> Message: 12
> Date: Tue, 5 May 2020 22:29:10 +0530
> From: Kunal Chauhan <atkunalchauhan@gmail.com>
> To: buildroot at busybox.net
> Subject: [Buildroot] Help: to understand build root

> Q1.As busybox is a small flavour of linux os.if i am not wrong?
> 
> Q2. What is concept of build-root. As i have seen code base compiled 
> and
> create build-root folder .

Buildroot is a build system for embedded systems. It is comparable to 
e.g. Yocto and helps you to create a GNU/Linux based image, containing 
Linux kernel, init system and root filesystem, which can then be 
transferred to a target system. Think of firmware for IoT, a router, a 
media player, or a robot in manufacturing.

Buildroot images are static, you cannot install software after 
deployment.

Buildroot images can be small, production images are counted in MiB, not 
GiB.

Buildroot handles cross-compiling. Build and target system can have 
completely different architectures.

Buildroot recipes (see configs/*_defconfig) are meant as starting point 
for your own project(s). They bring a system up and make it responsive 
(console, network), the rest is up to you.

In case you have not seen it before, the Buildroot manual is here:

   https://buildroot.org/downloads/manual/manual.html#_about_buildroot

Kind regards,
Andreas
