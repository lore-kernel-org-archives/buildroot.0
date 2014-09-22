From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 10:00:24 +0200
Subject: [Buildroot] [PATCH] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1125534742.25538251.1411371509741.JavaMail.root@openwide.fr>
References: <20140921200737.740f2bc0@free-electrons.com>
 <1125534742.25538251.1411371509741.JavaMail.root@openwide.fr>
Message-ID: <20140922100024.5fed686e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Sep 2014 09:38:29 +0200 (CEST), Jeremy Rosen wrote:

> The line in FindSwig.mk (part of the cmake package, not swig package)
> 
> find_program(SWIG_EXECUTABLE NAMES swig2.0 swig)
> 
> 
> This will look in PATH for
> 
> * an executable called "swig2.0"
> * if it is not found, an executable called "swig"
> 
> so if there is a "swig2.0" in /usr/bin it will be used instead of the
> one called "swig" in $(HOST_DIR)/usr/bin even if the PATH order says
> otherwise.
> 
> currently, host-swig only installs $(HOST_DIR)/usr/bin/swig and the
> debian package on my host only installs /usr/bin/swig2.0 thus the 
> problem.

Are you sure we cannot tell CMake explicitly where our swig binary is?
Like -DSWIG_EXECUTABLE=/path/to/swig.

Cc'ing Samuel, who should be able to give some hints about this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
