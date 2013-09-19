From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 16:54:45 +0200
Subject: [Buildroot] [PATCH 4 of 4 RFC] Config.in files: unify comments
 of toolchain option dependencies
In-Reply-To: <CAHXCMMK3NPuyfVeOfxAiJsC9ZCrBR56H9jFAQkrZZPmtp7A9xw@mail.gmail.com>
References: <patchbomb.1379494893@argentina>
 <a7cea7dd647ea16661bf.1379494897@argentina>
 <CAAXf6LWbCWMA2ofRSx4bdLyLsLYnaVfoBJupejSKLUsWqKYoZA@mail.gmail.com>
 <CAHXCMMK3NPuyfVeOfxAiJsC9ZCrBR56H9jFAQkrZZPmtp7A9xw@mail.gmail.com>
Message-ID: <20130919165445.72f8d5bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 19 Sep 2013 13:47:55 +0200, Samuel Martin wrote:

> > comment "connman needs a toolchain with IPv6, WCHAR, threading and
> > resolver support"
> >         depends on BR2_UCLIBC_VERSION_0_9_32 || \
> >                 !BR2_USE_WCHAR || !BR2_INET_IPV6 ||
> > !BR2_TOOLCHAIN_HAS_THREADS
> >
> >
> > I guess there must be some linke with uclibc 0.9.32, but does anyone
> > know more? Is this still correct?
> > In this patch I just took over the 'resolver' string, but it seems odd
> > anyway.
> >
> IIRC, this is about resolv.h, for which uclibc only provided stub (not full
> implementation) some years ago.
> I know there were patches implementing this on the web, but I don't know if
> they have been merged.

Well, if you look at the above condition, it seems to indicate that
0.9.33 is working fine to build connman.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
