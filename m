From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:52:50 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <1482241596-31688-12-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
Message-ID: <20170320225250.0a5bd659@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:28 +0100, J?r?me Pouiller wrote:

> libtool include support for cross-compilation since v1.5.

Are you sure this is true?

In the release notes of libtool v2.4
(https://savannah.gnu.org/forum/forum.php?forum_id=6525), I see:

"""


New in 2.4 2010-09-22:

    New features:

- Sysroot support. This allows you to build cross-compiled packages
with the same prefix that will be used on the destination machine,
and still find dependent libraries under the compiler's "sysroot".
Without sysroot support, paths internal to the build system may leak
into the product of the build.

Sysroot support is disabled unless the --with-sysroot configure
option is passed to configure, because .la files generated with
sysroot support will not be usable in general with older Libtools. 

"""

So are you sure that this feature didn't appear in libtool 2.4 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
