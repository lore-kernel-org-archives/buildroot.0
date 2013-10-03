From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 11:10:31 +0200
Subject: [Buildroot] [PATCH] python-pygame: fix _python_srcdir
In-Reply-To: <1380766200-2443-1-git-send-email-danomimanchego123@gmail.com>
References: <1380766200-2443-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20131003111031.181a669b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed,  2 Oct 2013 22:09:59 -0400, Danomi Manchego wrote:

>  		_python_sysroot=$(STAGING_DIR) \
> -		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
> +		_python_srcdir=$(PYTHON_DIR) \

I'm just wondering, why do these packages need access to the Python
*source* tree? What's missing from $(STAGING_DIR) to build those Python
modules?

Normally, the source/build tree of each package are just temporary
locations, we should *theoretically* be able of removing the
source/build tree of a package once its build has completed (well, in
practice, there are of course some exceptions, but it seems weird that
all Python modules would need these exceptions).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
