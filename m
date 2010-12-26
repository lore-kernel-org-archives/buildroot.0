From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Dec 2010 10:21:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.package.in: Added BZR
 download support
In-Reply-To: <878vzdpjt8.fsf@macbook.be.48ers.dk>
References: <cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<cover.1293210451.git.thomas.petazzoni@free-electrons.com>
	<ac294cf557f0d6053373d9af3471300a12f28d1c.1293210451.git.thomas.petazzoni@free-electrons.com>
	<878vzdpjt8.fsf@macbook.be.48ers.dk>
Message-ID: <20101226102155.04f7171f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Dec 2010 23:30:11 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> +define DOWNLOAD_BZR
>  Thomas> +	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>  Thomas> +	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
> 
> Shouldn't this make a tarball like the git/svn versions do?

I was also a little bit surprised, but bzr export creates a tarball
automatically.

I have tested those two patches by creating a simple package that gets
its source from BZR, and it worked properly (tarball created in
$(DL_DIR), and re-used at the next build).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
