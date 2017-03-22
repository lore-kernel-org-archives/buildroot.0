From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 09:14:37 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-12-git-send-email-jezz@sysmic.org>
 <20170320225250.0a5bd659@free-electrons.com>
 <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
Message-ID: <20170322091437.7ebd63bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 00:57:39 +0100, Arnout Vandecappelle wrote:

> > So are you sure that this feature didn't appear in libtool 2.4 ?  
> 
>  Yeah, looks like it. E.g. speex has libtool 1.5, and it doesn't have any
> sysroot support (not in configure, not in ltmain.sh).
> 
>  Obviously, *this* patch is not affected by it - it certainly doesn't hurt to
> pass the --with-sysroot configure option. It's only patches 12+13 that we
> wouldn't be able to remove.
> 
>  However, considering:
> 
> - most packages install things in /usr/lib, which is already searched by default;
> 
> - most packages use libtool 2.4 or later,
> 
> I think we can take the risk. The autobuilders will discover any issues, which
> we can fix per package (e.g. with AUTORECONF = YES).

Since I would prefer to avoid autoreconfiguring many packages, it would
be useful to know how many packages are still using libtool versions
earlier than 2.4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
