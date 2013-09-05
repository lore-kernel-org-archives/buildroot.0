From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 08:05:19 -0500
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.23
In-Reply-To: <20130905093315.64d800a2@skate>
References: <1378337198-29945-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130905093315.64d800a2@skate>
Message-ID: <OFE5AEB96A.295E7BD5-ON86257BDD.00471B54-86257BDD.0047E652@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I will keep that in mind in the future. However, it looks like Peter 
already committed the linux-pam patch I submitted so I'll just resubmit 
the util-linux patch.

FYI - regarding the linux-pam package patch -there is a dependancy on 
host-pkgconf in linux-pam that wasn't previously caught. I was just trying 
to build linux-pam package by itself and the build was failing during the 
configure step because a "PKG_CHECK_MODULES" was not being expanded during 
the autoreconf step.

Thanks,
-Ryan



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 




From:   Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To:     Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc:     buildroot at busybox.net
Date:   09/05/2013 02:34 AM
Subject:        Re: [Buildroot] [PATCH 1/1] util-linux: bump version to 
2.23



Dear Ryan Barnett,

On Wed, 4 Sep 2013 18:26:38 -0500, Ryan Barnett wrote:
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  .../util-linux-001-sscanf-no-ms-as.patch           |  186 
+++++++++++---------
>  .../util-linux-002-add-missing-rpmatch.patch       |   51 ------
>  ...l-linux-003-program-invocation-short-name.patch |   29 ++--
>  .../util-linux/util-linux-004-xtensa-support.patch |   16 --
>  package/util-linux/util-linux.mk                   |    2 +-
>  5 files changed, 117 insertions(+), 167 deletions(-)
>  delete mode 100644 
package/util-linux/util-linux-002-add-missing-rpmatch.patch
>  delete mode 100644 
package/util-linux/util-linux-004-xtensa-support.patch

Thanks for this update (and the one of linux-pam). Generally, when a
bump is not completely mechanical (i.e just bumping the version field),
I like to see a bit more explanations about what was done on the
patches (which ones were removed, for what reason, which ones were
updated, which ones were added), etc.

Same for changes in the package itself, for example in the linux-pam
package you've added a host-pkgconf dependency, it's worth mentioning
that in the commit log to help reviewers understand why that was done.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130905/788c7970/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130905/788c7970/attachment.gif>
