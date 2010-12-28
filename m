From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Dec 2010 20:14:55 +0100
Subject: [Buildroot] [PATCH 1/1] cloop: bump and fix package
In-Reply-To: <0d679df871b997afde6b8bd5aceac6c831cafd45.1292492846.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 16 Dec 2010 10:47:34 +0100")
References: <cover.1292492846.git.thomas.petazzoni@free-electrons.com>
	<cover.1292492846.git.thomas.petazzoni@free-electrons.com>
	<0d679df871b997afde6b8bd5aceac6c831cafd45.1292492846.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hbdxlnf4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On a machine without zlib-dev installed, cloop must really on the

s/really/rely/

 Thomas> host-zlib compiled by Buildroot, but due to the horrible cloop build
 Thomas> system, this didn't happen and the build was failing.

 Thomas> Therefore, we now pass all the $(HOST_CONFIGURE_OPTS) when building
 Thomas> cloop, and we fix the Makefile so that it takes into CFLAGS/LDFLAGS

+account

 Thomas>  define HOST_CLOOP_BUILD_CMDS
 Thomas> - $(HOST_MAKE_ENV) $(MAKE1) \
 Thomas> -   CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(@D) APPSONLY=yes
 Thomas> +	$(HOST_CONFIGURE_OPTS) $(HOST_MAKE_ENV) $(MAKE1) -C $(@D) APPSONLY=yes

HOST_CONFIGURE_OPTS is a superset of HOST_MAKE_ENV, so that one can be
dropped.

Committed with those minor fixes, thanks.

-- 
Bye, Peter Korsgaard
