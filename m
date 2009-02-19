From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 12:16:51 +0100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build
	in	$(PROJECT_BUILD_DIR)
In-Reply-To: <20090217050218.GA20875@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 17 Feb 2009 16\:02\:18 +1100")
References: <20090217050218.GA20875@cloud.net.au>
Message-ID: <87wsbmad7g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> I've got a package which will use Makefile.autotools.in that
 Hamish> needs to build in $(PROJECT_BUILD_DIR), because it builds
 Hamish> kernel modules.

 Hamish> Here is my proposed patch to Makefile.autotools.in to support
 Hamish> this (via a FOO_BUILD_PROJECT_DIR = YES/NO option). Feedback
 Hamish> welcome; unless there's issues I will commit in a day or two.

It adds a lot of clutter, but I also don't see any other way of doing
it. We could change the user interface to be something like
FOO_BUILD_DIR (defaulting to BUILD_DIR), and use it in the

$(2)_DIR                        =  $$(BUILD_DIR)/$(1)-$$($(2)_VERSION)

line - But that probably buys us very little.

-- 
Bye, Peter Korsgaard
