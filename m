From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 19:47:02 +0200
Subject: [Buildroot] Build error "cannot find -lc"
In-Reply-To: <KAW101-W44BEAE1114E33C6DD47BD39B770@phx.gbl>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>
	<20100911105201.176d1396@surf>
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>
	<KAW101-W44BEAE1114E33C6DD47BD39B770@phx.gbl>
Message-ID: <20100913194702.51831574@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Sep 2010 02:37:22 +0900
S W <sw18@hotmail.co.jp> wrote:

> I checked the /lib and /usr/lib, but I couldn't find 
> glibc.a file. 
> So I did "yum install glibc-static" to install the libc.a file.
> Now it is OK with this problem.

Ok, thanks.

Peter, what can we do about this ? Should we enforce the fact that
glibc-static is installed globally ? Or just if host-module-init-tools
is going to be compiled ?

> But I encountered another problem when I tried to build
> Uboot loader, which is "No rule to make target `ubootboard_config'".
> ubootboard_config is the name for Uboot loader.
> I think I have to send another email for this issue.

You have incorrectly set the BR2_TARGET_UBOOT_BOARDNAME. It must be set
to a board name that is valid in U-Boot. Which board are you targeting ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
