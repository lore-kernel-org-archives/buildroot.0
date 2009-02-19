From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Feb 2009 12:33:20 +0100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build
	in	$(PROJECT_BUILD_DIR)
In-Reply-To: <87wsbmad7g.fsf@macbook.be.48ers.dk>
References: <20090217050218.GA20875@cloud.net.au>
	<87wsbmad7g.fsf@macbook.be.48ers.dk>
Message-ID: <20090219113320.GB1829@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 19, 2009 at 12:16:51PM +0100, Peter Korsgaard wrote:
>>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
>
>Hi,
>
> Hamish> I've got a package which will use Makefile.autotools.in that
> Hamish> needs to build in $(PROJECT_BUILD_DIR), because it builds
> Hamish> kernel modules.
>
> Hamish> Here is my proposed patch to Makefile.autotools.in to support
> Hamish> this (via a FOO_BUILD_PROJECT_DIR = YES/NO option). Feedback
> Hamish> welcome; unless there's issues I will commit in a day or two.
>
>It adds a lot of clutter, but I also don't see any other way of doing
>it. We could change the user interface to be something like
>FOO_BUILD_DIR (defaulting to BUILD_DIR), and use it in the
>
>$(2)_DIR                        =  $$(BUILD_DIR)/$(1)-$$($(2)_VERSION)
>
>line - But that probably buys us very little.

I admit that i didn't look but it sounds a bit like you would want to
do the same like i did for THIS_SRCDIR (THIS_BUILDDIR comes to mind).
HTH,
