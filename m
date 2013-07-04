From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jul 2013 15:34:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-07-03
In-Reply-To: <51D55EC4.70209@googlemail.com>
References: <20130704063005.AD97652C109@lolut.humanoidz.org>
 <51D55EC4.70209@googlemail.com>
Message-ID: <20130704153438.5417c004@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Thu, 04 Jul 2013 13:38:44 +0200, Carsten Schoenert wrote:

> I looked at a build failure on libglib2.
> 
> Am 04.07.2013 08:30, schrieb Thomas Petazzoni:
> >        arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e9fc40239d13a2fcdc842eced2c39994ac2ca498/
> 
> I changed the Config.in file like that because libglib2 needs a thread
> implementation.

I don't think that's what we want to do. We have a patch on libglib2
that normally allows libglib2 to build and work without thread support,
see
package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch.
However, when libglib2 was bumped by Spenser Gilliland to 2.36.x, this
patch was not completely properly updated it seems. Maybe this is
something that Samuel Martin could have a look at, since he was the one
who did the original patch?

Unless of course we decide that we don't care about supporting libglib2
without threads, but in this case, the addition "depends
on !BR2_TOOLCHAIN_HAS_THREADS" has to be propagated to *all* reverse
dependencies of libglib2 (quite a significant number of packages).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
