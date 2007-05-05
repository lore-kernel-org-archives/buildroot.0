From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 5 May 2007 12:07:54 +0200
Subject: [Buildroot] Question on UCLIBC_CONFIG_FILE usage.
In-Reply-To: <463BF58C.6010602@realitydiluted.com>
References: <463BF58C.6010602@realitydiluted.com>
Message-ID: <20070505100754.GD8387@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 04, 2007 at 10:10:04PM -0500, Steven J. Hill wrote:
>I am obviously missing something here. If I do not specify UCLIBC_CONFIG_FILE
>on the command line to make, then a config file in 'toolchain/uClibc' will be
>used. None of the values assigned to it in the target directories will ever
>be picked up because the top-level Makefile does 'include target/Makefile.in'
>last which is too late for 'toolchain/uClibc/uclibc.mk' to pick up the value
>in a target-specific directory. Anyone care to comment? Thanks.

Since uclibc.mk has the config-file as a prerequisite (which is fine by
itself) it is evaluated right at that spot (to nil, if not specified on
the command-line).

Can't look right now, but perhaps including target/Makefile.in before
toolchain/Makefile.in in the toplevel Makefile would make it behave like
expected?

Perhaps we should store BR2_UCLIBC_CONFIG_FILE in .config, too.
