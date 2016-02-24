From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 24 Feb 2016 22:30:03 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160223091146.33e3f5b1@free-electrons.com>
References: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
 <20160222232144.61b99b32@free-electrons.com>
 <CALdGskLWXoRtKZdqYErn6w4QmcAxLroxtzxkMFYiRsPuH_O7Hg@mail.gmail.com>
 <20160223091146.33e3f5b1@free-electrons.com>
Message-ID: <20160224213003.GK14809@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 23 Feb 2016 09:34:31 +0200, Olivier Schonken wrote:
> 
> > The suggestion from Romain to disable -fPIE as below works for both
> > architectures.  Can I submit a patch for this? Or do you want to wait for a
> > response from Alexey and Waldemar?
> > 
> > # Remove -fPIE -pie from CFLAGS
> > ifeq ($(BR2_STATIC_LIBS),y)
> > CUPS_CONF_OPTS += LSB_BUILD=y
> > endif
> 
> Unfortunately, I don't like this, for several reasons:
> 
>  1/ LSB_BUILD=y will also disable stack protection support.
> 
>  2/ Only uClibc in static library build is affected by the problem, not
>     musl for example.

Oh, that is interesting. I always thought static PIE binaries on
Linux are not supported via the toolchain. So this is a C library
issue? 
We disabled for example package/openssh exactly because of the same reason.

best regards
 Waldemar 
