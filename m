From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Sep 2013 06:28:49 +0200
Subject: [Buildroot] [PATCH v2 0/1] Allow svn tags and branches notation
 in $(PKG)_VERSION variable.
In-Reply-To: <2873382.jskDvbugG2@portaka>
References: <87fvt0fwix.fsf@dell.be.48ers.dk>
	<2873382.jskDvbugG2@portaka>
Message-ID: <20130920062849.0a7ba5ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ra?l S?nchez Siles,

On Thu, 19 Sep 2013 23:58:55 +0200, Ra?l S?nchez Siles wrote:

>   I still consider the key point is being able to encode the revision into the 
> $(PKG)_SOURCE variable.

I guess you meant "the key point is being able to encode the revision
into the $(PKG)_VERSION" variable. But I don't see why this is
important or useful, so could you explain why you believe it is
necessary?

For example, for Buildroot, doing:

LIBFOO2_VERSION = branches/featureA
LIBFOO2_SITE = http://svn.happyserver.net/theproject

is not recommended at all, because you don't know which version of
"featureA" you will be getting. One user may be fetching one revision,
and if another user builds the same Buildroot configuration a few days
later, it might be another revision with additional changes.

That's why you should instead use:

LIBFOO2_VERSION = <some revision number>
LIBFOO2_SITE = http://svn.happyserver.net/theproject/branches/featureA

What is the problem with doing this?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
