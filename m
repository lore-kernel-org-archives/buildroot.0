From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:34:58 +0100
Subject: [Buildroot] [PATCH 0/8 RFC] core: install foo-config scripts
 early in the PATH (branch yem/foo-config-in-PATH)
In-Reply-To: <20151221223030.GG3454@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <20151221232048.1218dd26@free-electrons.com>
 <20151221223030.GG3454@free.fr>
Message-ID: <20151221233458.32befcc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 21 Dec 2015 23:30:30 +0100, Yann E. MORIN wrote:

> And how do we handle them today? If we don't do anything about it, then
> this series would indeed not solve those, but it would not break it
> either, since it would already be broken today.
> 
> Unless we do have code to manually install them in $(HOST_DIR)/usr/bin ?

What? No, we are just installing them in $(STAGING_DIR), like all
libraries. You can look at package/rtai/rtai.mk for an example.

> > Also, this solution doesn't solve the (admittedly unlikely) case of a
> > package calling /usr/bin/<foo>-config directly.
> 
> Indeed. But it is already broken today, and the series does not break it
> any more.

It is not broken today. Such special *-config scripts get naturally
installed in $(STAGING_DIR), they might be fixed up by a patch or some
custom hook. And then on the consumer side, we pass some environment
variable or other trick to get the consumer build system to use this
specific -config script rather than the one in the PATH. Nothing
special.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
