From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:48:49 +0200
Subject: [Buildroot] [PATCH] infra: simplify .la/.pc fixup commands
In-Reply-To: <26ee94e3-9322-47ba-881d-d48edc8d6568@email.android.com>
References: <6d38fb9f8bb567d8a4a2.1404044185@localhost>
 <20140629161538.35a3c17c@free-electrons.com>
 <26ee94e3-9322-47ba-881d-d48edc8d6568@email.android.com>
Message-ID: <20140629164849.737e8c26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 29 Jun 2014 16:47:27 +0200, Thomas De Schampheleire wrote:

> >Is this assumption really correct? If the user decides to move
> >$(HOST_DIR) in some custom location using BR2_HOST_DIR, it also means
> >that $(STAGING_DIR) is moved to this custom location. So you can have a
> >case where:
> >
> >	BASE_DIR = /home/joe/buildroot/output
> >	HOST_DIR = /opt/arm-build
> >	STAGING_DIR = /opt/arm-build/usr/arm-unknown-linux-uclibcgnueabi/sysroot/
> >
> >No ?
> 
> Hmm, ok, but I'm this case the already applied patch is not complete either and we should go back to v2 I think... I'll resubmit...
> 
> ...and I blame Arnout ;-)

Well, I don't know, I haven't tested nor mentally executed your sed
expressions with the use case above in mind, so I don't know if the
patch is actually broken or not. But if you assume that STAGING_DIR is
a subdir of BASE_DIR, I believe it's not a valid assumption, as
explained above.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
