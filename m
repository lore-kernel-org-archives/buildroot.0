From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 22:55:57 +0200
Subject: [Buildroot] [PATCH 1/2] python: enable bzip2 in host variant
In-Reply-To: <20160616224340.08157027@itchy>
References: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1461508789-17644-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160616000131.7f09d903@free-electrons.com>
 <20160616224340.08157027@itchy>
Message-ID: <20160616225557.07174b4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 22:43:40 +0200, Eric Le Bihan wrote:

> > Could you give some more details about this? The tarfile module seems
> > to only import the bz2 module when a bzip2-compressed file is handled.
> > Is this actually the case with rust?  
> 
> This was required because my initial take on Rust let the build process
> download the rust-stage0 bzip2 tarball and uncompress it on its own. As
> the bootstrap binary will now be provided by the rust-bootstrap
> package, this is not needed anymore.

OK, great!

> > Indeed, host-python is used by numerous packages, and we're trying to
> > not add too many dependencies to host-python. On the other hand,
> > building bzip2 is pretty fast, so maybe it's reasonable to add it as a
> > mandatory dependency of host-python.  
> 
> bz2 tarballs are widespread. So having support for this format in
> host-python, regardless of Rust, will benefit the user.

host-python is only meant to be used as a dependency to build other
things in Buildroot. As long as these "other things" don't need bz2
support in Python, there's no reason to enable it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
