From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:09:26 +0100
Subject: [Buildroot] [PATCH] gdb: specify where to find lzma libraries
In-Reply-To: <87egbim7qb.fsf@dell.be.48ers.dk>
References: <1457629826-21020-1-git-send-email-Vincent.Riera@imgtec.com>
 <87egbim7qb.fsf@dell.be.48ers.dk>
Message-ID: <20160310210926.23171bf6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 20:51:56 +0100, Peter Korsgaard wrote:

>  >  ifeq ($(BR2_PACKAGE_XZ),y)
>  >  GDB_CONF_OPTS += --with-lzma
>  > +GDB_CONF_OPTS += --with-liblzma-prefix=$(HOST_DIR)/usr
> 
> But GDB_CONF_OPTS is for gdb for the target, so HOST_DIR/usr doesn't
> seem right?

Gaah, yes, indeed. My suggestion in the bug report was done quickly
while at work. --with-liblzma-prefix=$(HOST_DIR)/usr should indeed be
passed in HOST_GDB_CONF_OPTS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
