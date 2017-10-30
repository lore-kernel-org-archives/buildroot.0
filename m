From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Oct 2017 09:43:23 +0100
Subject: [Buildroot] [PATCH] lvm2: make basic package available under
	musl
In-Reply-To: <20171029205707.4f82a902@windsurf> (Thomas Petazzoni's message of
 "Sun, 29 Oct 2017 20:57:07 +0100")
References: <20171027114716.29198-1-peter@korsgaard.com>
 <20171029205707.4f82a902@windsurf>
Message-ID: <8760axjaac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Install application library (liblvm2app).
 >> 
 >> +comment "lvm2 standard install needs a glibc or uClibc toolchain"
 >> +	depends on BR2_TOOLCHAIN_USES_MUSL

 > For consistency, I've moved this comment below the "standard install"
 > option, and added another comment for the "application library" option.

Ok. In the general case this would screw up indentation of further sub
option, but as the dependencies are the same this won't happen here.


 >> comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"

 > You had forgotten to update this comment: lvm2 no longer needs glibc or
 > uClibc, and you also had forgotten to drop the BR2_TOOLCHAIN_USES_MUSL
 > part of this comment dependencies.

Ups, thanks for fixing it!

-- 
Bye, Peter Korsgaard
