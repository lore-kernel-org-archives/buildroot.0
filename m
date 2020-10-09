From: Michael Fischer <mf@go-sys.de>
Date: Fri, 9 Oct 2020 13:55:38 +0000
Subject: [Buildroot] make creates a memory overflow
Message-ID: <003941d3da6d442c9a6740bfda3dd956@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I use VirtualBox with SuSE linux to compile Buildroot.

For my other projects I use the default make settings -j

/etc/environment
export MAKEOPTS='-j'
export MAKEFLAGS='-j'

When I use this, than buildroot crashes the Virtualbox with a memory overflow. > 8GB

I found this in the /package/Makefile

MAKE1 := $(HOSTMAKE) -j1
override MAKE = $(HOSTMAKE) \
        $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))


I'm not sure but I think this should be 

        $(if $(findstring j,$(filter-out -j%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))


Best regards
  Michael.
