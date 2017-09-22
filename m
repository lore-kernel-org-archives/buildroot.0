From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 09:48:25 +0200
Subject: [Buildroot] [PATCH] gdk-pixbuf: security bump to version 2.36.10
In-Reply-To: <20170921070416.17829-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Sep 2017 09:04:16 +0200")
References: <20170921070416.17829-1-peter@korsgaard.com>
Message-ID: <87efqzrx6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-2862 - An exploitable heap overflow vulnerability exists in the
 > gdk_pixbuf__jpeg_image_load_increment functionality of Gdk-Pixbuf 2.36.6.  A
 > specially crafted jpeg file can cause a heap overflow resulting in remote
 > code execution.  An attacker can send a file or url to trigger this
 > vulnerability.

 > CVE-2017-2870 - An exploitable integer overflow vulnerability exists in the
 > tiff_image_parse functionality of Gdk-Pixbuf 2.36.6 when compiled with
 > Clang.  A specially crafted tiff file can cause a heap-overflow resulting in
 > remote code execution.  An attacker can send a file or a URL to trigger this
 > vulnerability.

 > CVE-2017-6311 - gdk-pixbuf-thumbnailer.c in gdk-pixbuf allows
 > context-dependent attackers to cause a denial of service (NULL pointer
 > dereference and application crash) via vectors related to printing an error
 > message.

 > The host version now needs the same workaround as we do for the target to
 > not pull in shared-mime-info.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
