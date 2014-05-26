From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 13:49:44 +0200
Subject: [Buildroot] Install python setuptools package in staging
 directory
In-Reply-To: <CAPnaeVCKRCqFkGoJifzGHw7FZHofZ6sTGj6_bjp54+iq5_RJMQ@mail.gmail.com>
References: <CAPnaeVCKRCqFkGoJifzGHw7FZHofZ6sTGj6_bjp54+iq5_RJMQ@mail.gmail.com>
Message-ID: <20140526134944.10b48937@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Javier Almansa,

On Mon, 26 May 2014 13:13:37 +0200, Javier Almansa wrote:

> I am new in this mailing list and I have been using BuildRoot since
> some months ago for making rootfs for Raspberry PI, FriendlyARM and
> Beagleboard targets.
> 
> Now, I am trying to add support for ROS (http://www.ros.org) into
> buildroot but I have some troubles with dependencies.
> 
> Specifically, trying to install some ROS depemdencies, such as PyYaml
> ( http://pyyaml.org), I can add this package to the target directory,
> but I am not able to install into Staging directory too (PyYaml is
> needed in croos-compilation too).

Why would you need a Python module in the staging directory?

There are two possibilities:

 * PyYaml is used during the build process of another component. In
   this case, PyYaml is used in the *build* machine and should be
   installed in the host/ directory of Buildroot, through a
   host-python-package.

 * PyYaml is used at runtime on the target. In this case, PyYaml is
   used on the *target* machine and should be installed in the target/
   directory of Buildroot, through a python-package.

> Also, I tried with key PYTHON_YAML_INSTALL_STAGING = YES and it did
> not install PyYaml in staging directory, only in target.

Correct.

I'd like to help you, but I first need to understand why you think you
need PyYaml installed in the staging directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
