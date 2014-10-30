From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 11:31:34 +0100
Subject: [Buildroot] [PATCH v2 1/2] libffi: make thread support optional
In-Reply-To: <5451F23F.3060703@mind.be>
References: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
 <20141029222418.17f91967@free-electrons.com>
 <5451F23F.3060703@mind.be>
Message-ID: <20141030113134.3c59575c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 30 Oct 2014 09:09:35 +0100, Arnout Vandecappelle wrote:

>  I agree. Removing toolchain requirements from a package is really a feature
> patch, so we shouldn't do it unless it's upstreamable or when it's more of a
> build issue than a code issue. There may be an exception when a package that has
> a lot of dependants suddenly grows a toolchain dependency, but that's not the
> case here.

Agreed.

>  On the other hand, why shouldn't this patch be upstreamable?

Because it shouldn't hardcode:

+#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)

But instead detect in configure.ac if threads are available, and then
use that.

So, what I would propose is that if J?r?me is really interested in
having libffi available in non-threaded configurations, he works on a
patch that is upstreamable, submit it upstream, and once it's upstream,
we backport it in Buildroot, until upstream does a new release.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
