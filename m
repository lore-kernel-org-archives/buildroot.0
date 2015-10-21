From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:39:05 +0200
Subject: [Buildroot] [PATCH 1/2] jq: disable maintainer mode
In-Reply-To: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20151021223905.49094797@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 19 Oct 2015 12:42:08 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Since version 1.5, maintainer mode is enabled by default. We don't need
> this, and is in particular problematic because it requires bison 3.0.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

It took me a little bit of time to understand this one, since jq 1.5
was building fine in my minimal chroot that does not have bison
installed.

However, what happens is that if you don't have bison installed at all,
everything works fine. But if you have a bison version installed that
happens to be older than bison 3.0, then you get an error at configure
time.

So: patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
