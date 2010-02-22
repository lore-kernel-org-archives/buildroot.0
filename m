From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:47:59 +0100
Subject: [Buildroot] [PATCH 03/16] libxml2: do not apply libtool patch
	when compiling for host
In-Reply-To: <e81149c54301f88ae64bd85caa6d0f29e879d064.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:42:54 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<e81149c54301f88ae64bd85caa6d0f29e879d064.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4u5jmq8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The libtool patch is not applied when building for the target because
 Thomas> it does not apply, so do not attempt to apply it when building for the
 Thomas> host. This fixes libxml2 build for the host.
 
 Thomas> +HOST_LIBXML2_LIBTOOL_PATCH = NO

Is there ever any situation where {HOST,}_<PACKAGE>_LIBTOOL_PATCH will
differ, or should we just use the host build use the normal variable,
just like we are doing for _SOURCE/_SITE/_VERSION?

-- 
Bye, Peter Korsgaard
