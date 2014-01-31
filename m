From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 10:08:12 +0100
Subject: [Buildroot] [PATCH v3 1/6] Makefile: introduce BR2_PATH
In-Reply-To: <1114084693.4927201.1391157688997.JavaMail.root@openwide.fr>
References: <20140131092519.787a1f4d@skate>
 <1114084693.4927201.1391157688997.JavaMail.root@openwide.fr>
Message-ID: <20140131100812.439cd650@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Fri, 31 Jan 2014 09:41:29 +0100 (CET), Jeremy Rosen wrote:

> > I am wondering about the name BR2_PATH. Normally, BR2_<something> is
> > used for variables coming from Kconfig options. Introducing the
> > BR2_PATH variable, which doesn't come from a Kconfig option seems to
> > violate this unwritten rule.
> 
> as a side note, BR2_EXTERNAL also violates that rule...
> 
> BR2_EXTERNAL is still an unreleased feature so if this rule becomes
> official there is still time to rename...

BR2_EXTERNAL *is* a Kconfig option. See the main Config.in:

config BR2_EXTERNAL
        string
        option env="BR2_EXTERNAL"

The fact that we're passing it on the command line rather than defining
it within menuconfig/xconfig is solely due to the fact that its value
needs to be known before starting menuconfig/xconfig, because
BR2_EXTERNAL is used to know which Config.in file to include.

So no, BR2_EXTERNAL doesn't violate this rule :-)

Also, BR2_EXTERNAL is really an externally visible variable, while
BR2_PATH is a purely internal variable of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
