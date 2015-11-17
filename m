From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 10:09:10 +0100
Subject: [Buildroot] [PATCH 2/6] package/mysql: unconditionally define
	host variables
In-Reply-To: <70800f7df3d1c437d4368d764e26e0e87fa583f3.1447449754.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 13 Nov 2015 22:48:48 +0100")
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <70800f7df3d1c437d4368d764e26e0e87fa583f3.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <87poz9dmbt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > To build the host-mysql, we only build parts of the source, just the
 > strictly minimum required to then cross-compile it.

 > However, the host variables (conf opts, build and install cmds) are only
 > defined when the mysql server is enabled in the configuration.

 > So, this breaks:
 >     make defconfig; make host-mysql

 > Even though it is not much use to have that partial host-mysql on its
 > own, it is still very interesting to be able to build it, if at least
 > for testing changes in the core package infrastructures (like new step
 > hooks or the likes...)

 > Move the definitions of the host variant out of the server conditional
 > block.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>

Committed with the comment suggested by Arnout added, thanks.

-- 
Bye, Peter Korsgaard
