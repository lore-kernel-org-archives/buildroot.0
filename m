From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 15:47:39 +0100
Subject: [Buildroot] [PATCH 2/4] package/volume_key: add new package
In-Reply-To: <7785b80a-8198-23ed-5bed-9485c0a31075@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-3-giulio.benetti@benettiengineering.com>
 <20200217195114.7336e67e@windsurf>
 <20bd5175-2e2c-a2b8-0ff0-350d58e01a9b@benettiengineering.com>
 <7785b80a-8198-23ed-5bed-9485c0a31075@benettiengineering.com>
Message-ID: <20200218154739.7617bb04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 15:06:47 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> >> AC_PATH_PROG([GPG], [gpg2])
> >> AC_ARG_VAR([GPG])
> >> AC_DEFINE_UNQUOTED([GPG_PATH], "$GPG", [Path to the gpg2 executable])
> >>
> >> So don't we need gnupg on the host for this to work ?  
> > 
> > Yes, host-gnupg2, I've missed it since my distro provides it.  
> 
> I've retried building, gnupg2 only is supported but it's not mandatory 
> to build. So as I can understand we can avoid adding host-gnupg2.

Weird, I thought AC_PATH_PROG() was aborting if the tool was not found.
If that's not the case, then we should ensure the build never uses
gpg2, even if available, so that the build result doesn't depend on
whether gpg2 is available system-wide or not.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
