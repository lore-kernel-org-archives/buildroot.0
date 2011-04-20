From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2011 10:15:56 +0200
Subject: [Buildroot] [PATCH] package: add socketcan package
In-Reply-To: <4DAE88BF.6070301@armadeus.com>
References: <1303145560-11520-1-git-send-email-kevin.joly@armadeus.com>
	<20110419223612.77112a72@surf> <4DAE88BF.6070301@armadeus.com>
Message-ID: <20110420101556.63320c1b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the list in Cc.

On Wed, 20 Apr 2011 09:18:23 +0200
JOLY <kevin.joly@armadeus.com> wrote:

> Thanks for your reply. I will correct that but I can't change the 
> install location (/usr/local/bin) because there is no options in the 
> makefile of socketcan-utils, we can choose the target root but not
> the directory to install the binaries.

You can make a one-line patch to can-utils/Makefile to change

PREFIX = /usr/local

to

PREFIX ?= /usr/local

and then pass "PREFIX=/usr" at make install.

This patch could be submitted to the upstream SocketCAN project, but in
the mean time, you can add it to the package directory in Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
