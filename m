From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 12:52:36 +0200
Subject: [Buildroot] [PATCH 1/1] trace-cmd: use pkg-config instead of
	python-config
In-Reply-To: <20131014085803.4c139478@skate> (Thomas Petazzoni's message of
 "Mon, 14 Oct 2013 08:58:03 +0200")
References: <525B1E2E.2040209@openwide.fr> <20131014085803.4c139478@skate>
Message-ID: <8738o4t98r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +++ b/package/trace-cmd/Config.in
 >> @@ -2,6 +2,8 @@ config BR2_PACKAGE_TRACE_CMD
 >> bool "trace-cmd"
 >> depends on BR2_LARGEFILE
 >> depends on BR2_TOOLCHAIN_HAS_THREADS
 >> +	select BR2_PACKAGE_PYTHON

 Thomas> No, Python support is optional in trace-cmd. We should keep optional,
 Thomas> by doing:

 Thomas> ifeq ($(BR2_PACKAGE_PYTHON),)
 Thomas> TRACE_CMD_MAKE_FLAGS += -NO_PYTHON=1
 Thomas> else
 Thomas> TRACE_CMD_DEPENDENCIES += python
 Thomas> endif

Actually I prefer positive logic, E.G.:

ifeq ($(BR2_PACKAGE_PYTHON),y)
TRACE_CMD_DEPENDENCIES += python
else
TRACE_CMD_MAKE_FLAGS += -NO_PYTHON=1
endif

-- 
Bye, Peter Korsgaard
