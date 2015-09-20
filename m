From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 18:58:21 +0200
Subject: [Buildroot] [PATCH] make: requires dynamic libraries
In-Reply-To: <CALq67GCCHMGowurww4w=W7wpAzCDUJHnFLhMDnDo1_33SGNnbQ@mail.gmail.com>
References: <1442450292-13794-1-git-send-email-ryanbarnett3@gmail.com>
 <20150917232742.6b253d01@free-electrons.com>
 <CALq67GCCHMGowurww4w=W7wpAzCDUJHnFLhMDnDo1_33SGNnbQ@mail.gmail.com>
Message-ID: <20150920185821.53cb363b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Sep 2015 09:40:25 -0500, Ryan Barnett wrote:

> I am going to go disabling guile support in a static only
> configuration. I ran into an issue with setting GC_NO_DLOPEN define in
> that there then becomes multiple definitions of locale_charset between
> libintl and libguile and I wasn't sure how to properly fix it. Looking
> at what guile is used for in make, it doesn't appear extremely useful
> especially in a static only configuration.

I think we should disable guile support completely, not only for static
only builds. I don't really see the usefulness of guile support in
make in the context of Buildroot.

Generally speaking, I think we should --disable-<foo> or
--without-<foo> explicitly for as many options as possible, unless they
are explicitly handled in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
