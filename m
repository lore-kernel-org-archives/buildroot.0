From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 14:19:15 +0200
Subject: [Buildroot] Install python setuptools package in staging
 directory
In-Reply-To: <CAPnaeVBJPkwpsaS3-+NuVt2y-zyEFFidF8rKNBY8eetiky9RuA@mail.gmail.com>
References: <CAPnaeVCKRCqFkGoJifzGHw7FZHofZ6sTGj6_bjp54+iq5_RJMQ@mail.gmail.com>
 <20140526134944.10b48937@free-electrons.com>
 <CAPnaeVBJPkwpsaS3-+NuVt2y-zyEFFidF8rKNBY8eetiky9RuA@mail.gmail.com>
Message-ID: <20140526141915.6839ba45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Javier Almansa,

On Mon, 26 May 2014 14:14:20 +0200, Javier Almansa wrote:

> pyYaml is used in the build process of ROS Components and later, at
> runtime, as pyYaml is needed for lots of ROS runtime components.

Ok, so you need both a host-python-package and a python-package, as you
did.

> In fact, when build process finishes, I need to manually copy pyyaml
> from target directory (target/usr/lib/python2.7/site-packages/yaml*)
> to staging dir (host/usr/lib/python2.7/site-packages) in order to
> cross-compile ROS components due that the package is not installed in
> this staging directory.

Can you send the patches that exhibit this problem?

> I read the doc several times but I do not know why. Maybe I need to
> define PYTHON_YAML_INSTALL_STAGING_CMDS (I think this is automatic,
> but I am not sure).

As it is now, I still don't see why a Python module would have to be
installed in the staging directory, so I'd like to be able to reproduce
the problem, and investigate a bit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
