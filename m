From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:35:07 +0100
Subject: [Buildroot] [RFC] bzip2: introduce make variable LIBDIR
In-Reply-To: <20171124220554.24261-1-code@mmayer.net>
References: <20171124220554.24261-1-code@mmayer.net>
Message-ID: <20171124233507.4f398629@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Nov 2017 14:05:54 -0800, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> In order to allow us to install libz2 into a location other than
> /usr/lib, we introduce a variable called LIBDIR that can be set by
> the build system to an alternate location.
> 
> LIBDIR defaults to /usr/lib, so the behaviour doesn't change if
> LIBDIR is never set.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> Most package in buildroot seem to offer the flexibility to install
> libraries into directories specified by the user (build system) rather
> than hard-coding the destination in the way bzip2 does.

We don't support customizing on a per-package basis, or even globally,
where libraries are installed. Where have you seen that we offer the
flexibility to choose where libraries are installed ?

> My question is whether patches 2-4 should be combined into a single
> patch or if it is preferable to keep them separate.

The whole point of patch 2 is to allow cross-compilation, not to allow
customizing the directory where libraries are installed.

What are you trying to do?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
