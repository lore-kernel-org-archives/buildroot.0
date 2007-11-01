From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 1 Nov 2007 12:17:28 +0100
Subject: [Buildroot] per-project uclibc configuration does not
	really	work
In-Reply-To: <20071101070728.GA21168@cloud.net.au>
References: <20071101070728.GA21168@cloud.net.au>
Message-ID: <20071101111726.GI1869@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 01, 2007 at 06:07:28PM +1100, Hamish Moffatt wrote:
>buildroot's project support (eg saveconfig target) appears to offer
>per-project uClibc .config support and per-project uClibc version
>selection.
>
>However, uclibc is built into the per-arch toolchain_build_$(ARCH) 
>directory and installed into build_$(ARCH), rather than the per-project
>build directory project_build_$(ARCH)/$(PROJECT). And so is the gcc
>cross-compiler built against that uclibc.
>
>Only a few packages build into the per-project build directly, name
>busybox and uclibc. The problem is that if you change your uclibc
>configuration you may well need to rebuild all your programs too,
>because autoconf tests might return different results etc.
>
>Effectively you have to build everything per-project (including the
>whole toolchain).

See "using PROJECTs with buildroot" in the archives.
>
>Is there much benefit in trying to share package builds between
>projects, as buildroot does right now?

I don't think so.
