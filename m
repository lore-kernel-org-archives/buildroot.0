From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 09:13:12 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <524CFDF9.3090807@mind.be>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
 <20131001144009.4117ea4c@skate> <524C4D27.9030601@mind.be>
 <20131002231704.5ba5d1e8@skate> <524CFDF9.3090807@mind.be>
Message-ID: <20131003091312.6fba7e5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 03 Oct 2013 07:17:45 +0200, Arnout Vandecappelle wrote:

> > Yeah, it would add a lot of complexity. Another option is to make such
> > packages non-selectable if an external uClibc toolchain is used.
> 
>   But that means that the typical scenario for a uClibc-based toolchain 
> won't work (use buildroot or ct-ng to generate a toolchain once, and 
> import it as an external toolchain).

Yes, indeed.

There's not much we can do here: the uClibc community is so slow at
producing releases that many projects backport a lot of features and
fixes, and therefore from one toolchain to another, the "uClibc 0.9.33"
that you get might be quite different.

While we can certainly require the external toolchains to have a
uClibc configuration that has at least the same features as the
Buildroot uClibc configuration, it seems hard to require those
external toolchains to have in their uClibc a feature that has never
been part of a uClibc release (which is the case of the execvpe being
discussed in this thread).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
