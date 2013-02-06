From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Wed, 6 Feb 2013 12:15:43 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <20130206103244.68ca56b4@skate>
References: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 <1360143004-29603-2-git-send-email-victor.hiairrassary.ml@gmail.com>
 <20130206103244.68ca56b4@skate>
Message-ID: <CAP+5e18W7+M-bmRNJLaXhj2XdMAhnVgQgyvVUHMNk-3FOp-DGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 On 02/06/2013 10:32 AM, Thomas Petazzoni wrote:

Dear victor.hiairrassary.ml at gmail.com,

On Wed,  6 Feb 2013 10:30:04 +0100, victor.hiairrassary.ml at gmail.com
wrote:


  BOOST_FLAGS =
-BOOST_WITHOUT_FLAGS = python context
+BOOST_WITHOUT_FLAGS = python atomic

 Maybe there was a reason why "context" was unconditionally excluded
from the build, before your patch. Did you check why?

 context was excluded because compilation is impossible with boost
1.52.0 and uClibc, there is a problem with uintptr_t and intptr_t.
But this is fixed in latest version, 1.53.0.

Also, it would be good to have a comment here that explains why python
and atomic are unconditionally excluded for the build.

 atomic is a new boost library since boost 1.53.0. It is excluded because
it can not compile with uClibc (uintptr_t missing too), but this is now
fixed in
trunk version, see ticket https://svn.boost.org/trac/boost/ticket/7979

In this patch, atomic is simply excluded. So either we wait for boost 1.54.0
releasing orI can add the patch to fix atomic compilation in buildroot and
add boost-atomic in menuconfig?

I do not nothing about pyhton exclusion, sorry.

 Thanks,

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130206/f744c1a1/attachment.html>
