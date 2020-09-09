From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 10 Sep 2020 00:33:25 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-08
In-Reply-To: <notmuch-sha1-e4c258f95060550a2667c952e19ca6e5d08e16c1>
References: <notmuch-sha1-e4c258f95060550a2667c952e19ca6e5d08e16c1>
Message-ID: <20200910003325.GC205787@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 09 Sep 2020 07:07:08 +0000 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arm      |         wlroots-0.11.0         | http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e

This is caused due to not having libxcb-util-errors, which turns out comes
from a separate library and not as part of the libxcb-util package. There
is no x11r7/xcb-util-errors in Buildroot.

Given that the libxcb-util-errors is optional and only used by wlroots to
improve reporting/logging of XCB errors but otherwise functionality is not
affected, I think the quickest solution is to always disable its usage with
the corresponding Meson option?I will submit a patch momentarily.

The other option is to add a Buildroot package for libxcb-util-errors, let
me know if you think that would be a better option.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200910/1c93e763/attachment.asc>
