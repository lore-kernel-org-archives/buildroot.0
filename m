From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 29 Oct 2013 19:51:53 -0500
Subject: [Buildroot] [PATCHv2 0/5] Add apache thrift
In-Reply-To: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <OFFDA9CD4F.D79FA1A1-ON86257C14.0003E215-86257C14.0004BF76@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/29/2013 07:28:31 
PM:

> Add the apache thrift runtime and host tool.
> 
> Changes for v2:
> * Fix indentation in python-thrift cross building
> * Explicitly select/depend on zlib in thrift
> * Patch Makefile.am instead of Makefile in thrift

So how do you envision a new person to add a package that utilizes thrift 
as their complier? I guess what I'm trying to get at here is I just want 
to try to understand how the thrift package will be used. I'm pretty sure 
how you are going to do it but without an example in this patchset I can't 
be sure.

Here is how I'm envisioning it with the packages you have submitted.

Config.in
----------
has "select BR2_PACKAGE_THRIFT"


foo.mk
--------
FOO_DEPENDENCIES = host-thrift

define FOO_BUILD_CMDS
        # This assumes that the package's Makefile uses THRIFT for the 
compiler
        $(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C 
$(@D)
endif

Granted there is more each of the packages but this covers the thrift 
specific parts. Please correct me if I have made incorrect assumptions 
with how you envisioned utilizing THRIFT.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131029/867114c9/attachment.html>
