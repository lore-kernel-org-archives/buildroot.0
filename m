From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 17:05:08 +0200
Subject: [Buildroot] [PATCH v4] moarvm: new package
In-Reply-To: <CAB0FRsu3Fh42P6d1sv6zk8YDRV7DCa-OSKn4P1dS7vgEP10j2w@mail.gmail.com>
References: <1433516541-16421-1-git-send-email-francois.perrad@gadz.org>
 <1433543601-17425-1-git-send-email-arnout@mind.be>
 <CAB0FRsu3Fh42P6d1sv6zk8YDRV7DCa-OSKn4P1dS7vgEP10j2w@mail.gmail.com>
Message-ID: <20150606170508.76f27879@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sat, 6 Jun 2015 11:03:38 +0200, Fran?ois Perrad wrote:

> > +MOARVM_DEPENDENCIES = host-luajit libuv libatomic_ops
> 
> host-luajit seems overkill.

Why? Lua is not part of the core dependencies of Buildroot, which are
mandatory to run Buildroot. So if it's not part of these core
dependencies, and used for the build process of moarvm, then it should
be added as a dependency of that package.

Otherwise the build will fail for users that don't have Luajit
installed on their machine, like is the case for several of the
autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
