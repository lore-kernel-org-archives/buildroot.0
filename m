From: Philippe Ney <philippe.ney@pardes.ws>
Date: Fri, 19 Jan 2007 11:47:01 +0100
Subject: [Buildroot] about the float lib
In-Reply-To: <030901c73b98$0f444a70$0c96a8c0@Thomas>
References: <030901c73b98$0f444a70$0c96a8c0@Thomas>
Message-ID: <20070119114701.0344519f.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> hi all,
> i meet some problem when use the ARM gcc 4.1.1 with arg -msoft-float,  the gcc can't find the -lfloat.
> how to produce float lib?
> Br
> Thomas

Hi,

Make the target you built depends from the libfloat.

uclibc: libfloat $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc \
	$(STAGING_DIR)/lib/libc.a $(UCLIBC_TARGETS)


Philippe
