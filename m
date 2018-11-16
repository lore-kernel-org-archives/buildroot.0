From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 16:32:52 +0100
Subject: [Buildroot] [PATCH] support/dependencies: add a check for a
 suitable gzip
In-Reply-To: <20181116152719.24591-1-yann.morin.1998@free.fr>
References: <20181116152719.24591-1-yann.morin.1998@free.fr>
Message-ID: <20181116163252.25ff7342@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 16:27:19 +0100, Yann E. MORIN wrote:
> Recently, some hash mismatch have been reported, both by users as well
> as autobuilder failures, about tarballs generated from git repositories.
> 
> This turned out to be caused by users having the 'gzip' command somehow
> aliased to 'pigz' (which stand for: parallel implementation of gzip,
> which takes advantage of multi-processor system to parallelise the
> compression).
> 
> Unfortunately, the output of pigz-compressed archives differ from that
> of gzip (even though they *are* valid gzip-compressed streams).
> 
> Add a dependency check that ensures that gzip is not pigz. If that is
> the case, bail out and refuse to build.
> 
> This is a stop-gap measure in preparation of the release. A complete
> solution would accept pigz as a decompressor (because that is totally
> OK), and ensure that we do build a host-gzip package should that be
> needed. This is a much bigger endeavour, so this simple solution is
> deemed enough for the release (after all, use of pigz is just atypical
> enough that it should not pose such a problem for users to reverti to
> using plain gzip).

Is it really that more complicated to add and use host-gzip ?

(This is a real question, not one asked with some irony.)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
