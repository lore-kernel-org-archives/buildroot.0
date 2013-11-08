From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 8 Nov 2013 20:45:53 +0100 (CET)
Subject: [Buildroot] [PATCH] log4cplus: new package
Message-ID: <trinity-a54d5ae6-011d-4b81-964e-4e8328e929cd-1383939953450@3capp-gmx-bs33>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, Nov 08, 2013 at 01:38:36AM +0100, Arnout Vandecappelle wrote:
> On 07/11/13 22:27, Peter Seiderer wrote:
> >Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

thank you very much...

> 
> >---
> >  package/Config.in              |  1 +
> >  package/log4cplus/Config.in    | 15 +++++++++++++++
> >  package/log4cplus/log4cplus.mk | 14 ++++++++++++++
> >  3 files changed, 30 insertions(+)
> >  create mode 100644 package/log4cplus/Config.in
> >  create mode 100644 package/log4cplus/log4cplus.mk
> >
> >diff --git a/package/Config.in b/package/Config.in
> >index c0a3f20..7c0eb94 100644
> >--- a/package/Config.in
> >+++ b/package/Config.in
> >@@ -706,6 +706,7 @@ source "package/libtpl/Config.in"
> >  source "package/libunwind/Config.in"
> >  source "package/liburcu/Config.in"
> >  source "package/linux-pam/Config.in"
> >+source "package/log4cplus/Config.in"
> >  source "package/log4cxx/Config.in"
> 
>  Does log4cplus replace log4cxx? The API looks a bit similar at first sight.

Yes, both try to implement log4j style.

log4cxx development seems to be stalled (latest release 0.10.0 from 2008-04-03, release 0.11.0
(many bug fixes) announced for 2010..., see http://logging.apache.org/log4cxx/changes-report.html

log4cplus is more selfcontained (no dependencies like log4cxx on apr/apr-util), see
http://sourceforge.net/p/log4cplus/wiki/Home

'The aim of this project is to develop log4j-like logging framework for use in (primarily) C++.
 One of the major design goals is to avoid huge dependencies (like Boost) in the core functionality
 and to use as standard C++ facilities instead.'

And log4cplus is much smaller:

276K    target/usr/lib/liblog4cplus-1.1.so.9.0.0

vs.

1.3M    target/usr/lib/liblog4cxx.so.10.0.0
112K    target/usr/lib/libaprutil-1.so.0.5.2
120K    target/usr/lib/libapr-1.so.0.4.8
104K    target/usr/lib/libexpat.so.0.5.0
68K     target/usr/lib/libneon.so.27.3.0
1.9M    total

And log4cplus is in active development, latest relese 1.1.2 from 2013-10-22...

Regards,
Peter

> 
> 
>  Regards,
>  Arnout
> 
