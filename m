From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 06:01:30 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
 dependency
In-Reply-To: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140318060130.282f5a46@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Mar 2014 11:42:34 +0100, Yann E. MORIN wrote:

> So, calling "$SHELL --version" will still return "^GNU bash" no matter
> what shell is actually running.
> 
> Since quite a lot of #!/bin/sh scripts are in fact bash scripts, we
> really want to ensure that /bin/sh is bash.

I'm definitely against that. My system has /bin/sh pointing to dash,
and Buildroot works fine. One of the thing that annoyed me in
OpenEmbedded was its requirements to have /bin/sh be bash.

We clearly don't want that.

I've just checked the Free Electrons autobuilders, and there are also
using dash as /bin/sh. This means that if configure scripts were using
bashims unsupported by dash, we would have noticed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
