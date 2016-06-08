From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:17:50 +0200
Subject: [Buildroot] [PATCH 1/2] ninja: new package
In-Reply-To: <20160604200301.2205a07e@itchy>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-2-git-send-email-eric.le.bihan.dev@free.fr>
 <av9b2dxral.ln2@ID-313208.user.individual.net>
 <20160604200301.2205a07e@itchy>
Message-ID: <20160608221750.796aa97f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Jun 2016 20:03:01 +0200, Eric Le Bihan wrote:

> Ninja is used by Meson, which I also provide for the target. It is true
> that the "Development tools" section now only lists "make" as build
> system, since autotools have been removed. I do not know if Buildroot
> users frequently need build systems on their target, but I provided it
> anyway.

"make" was only kept in the development tools because it was needed to
be able to *run* the uClibc test suite on the target. This has been
changed a few days ago, so I believe we don't really need "make"
anymore as a target package.

> If the policy is to provide build system packages only for the host,
> I'm fine with it.

Yes, please provide them only as host packages. However, do you have a
target package that would use them? Without this, the host packages are
orphan and never tested by anything, which isn't good.

So could you submit ninja/python-meson together with at least one
target package that uses them?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
