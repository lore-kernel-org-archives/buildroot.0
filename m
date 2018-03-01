From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 23:32:39 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301230427.28e24d47@windsurf.lan> (Thomas Petazzoni's
 message of "Thu, 1 Mar 2018 23:04:27 +0100")
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
 <87lgfbiyk8.fsf@dell.be.48ers.dk>
 <20180301170807.2cd21163@windsurf.lan>
 <87a7vriudq.fsf@dell.be.48ers.dk>
 <20180301230427.28e24d47@windsurf.lan>
Message-ID: <87371jfmuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Thu, 01 Mar 2018 18:21:53 +0100, Peter Korsgaard wrote:

 >> >> dumb-init doesn't depend on any libraries, so the only issue is static
 >> >> linking with glibc, right?  
 >> 
 >> > No, you can also have musl or uclibc configured shared-only, which is
 >> > the case by default since BR2_SHARED_LIBS=y.  
 >> 
 >> Yes, but static linking against libc still works in that case, right?

 > I'm not sure you have libc.a with uClibc or musl if you build
 > shared-only.

Today we unconditionally build the static version of musl and uClibc, so
yes.

We may have other situations where we link statically against libc with
BR2_SHARED_LIBS. go is normally statically linked, doesn't that use
libc?

-- 
Bye, Peter Korsgaard
