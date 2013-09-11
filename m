From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 10 Sep 2013 21:03:57 -0500
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
08:15:28 AM:

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in             |  6 ++++--
>  Makefile              | 29 +++++++++++++++++++++++++----
>  docs/manual/manual.mk |  2 +-

One idea that I have, is for the make file that is genreated for the an
external output directory, if we could preserve the the value of 
BR2_EXTERNAL
as follows. I don't think my logic is fully there but there is more of a 
sudo implementation:

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -27,6 +27,7 @@ makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))

 MAKEARGS := -C $1
 MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst 
%/,%,\$(makedir))
+MAKEARGS += BR2_EXTERNAL=\$(realpath \$(BR2_EXTERNAL))

 MAKEFLAGS += --no-print-directory

Again this is only a suggestion but otherwise I'll ack the patchset.

Thanks,
-Ryan




Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/0f73d9eb/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/0f73d9eb/attachment.gif>
