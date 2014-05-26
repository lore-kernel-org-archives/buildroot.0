From: Javier Almansa <javier.almansa@efsystems.net>
Date: Mon, 26 May 2014 14:14:20 +0200
Subject: [Buildroot] Install python setuptools package in staging
	directory
In-Reply-To: <20140526134944.10b48937@free-electrons.com>
References: <CAPnaeVCKRCqFkGoJifzGHw7FZHofZ6sTGj6_bjp54+iq5_RJMQ@mail.gmail.com>
 <20140526134944.10b48937@free-electrons.com>
Message-ID: <CAPnaeVBJPkwpsaS3-+NuVt2y-zyEFFidF8rKNBY8eetiky9RuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, thanks for your fast reply.

pyYaml is used in the build process of ROS Components and later, at
runtime, as pyYaml is needed for lots of ROS runtime components.

In fact, when build process finishes, I need to manually copy pyyaml from
target directory (target/usr/lib/python2.7/site-packages/yaml*) to staging
dir (host/usr/lib/python2.7/site-packages) in order to cross-compile ROS
components due that the package is not installed in this staging directory.

I read the doc several times but I do not know why. Maybe I need to define
PYTHON_YAML_INSTALL_STAGING_CMDS (I think this is automatic, but I am not
sure).

Cheers.

Javier.


2014-05-26 13:49 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Javier Almansa,
>
> On Mon, 26 May 2014 13:13:37 +0200, Javier Almansa wrote:
>
> > I am new in this mailing list and I have been using BuildRoot since
> > some months ago for making rootfs for Raspberry PI, FriendlyARM and
> > Beagleboard targets.
> >
> > Now, I am trying to add support for ROS (http://www.ros.org) into
> > buildroot but I have some troubles with dependencies.
> >
> > Specifically, trying to install some ROS depemdencies, such as PyYaml
> > ( http://pyyaml.org), I can add this package to the target directory,
> > but I am not able to install into Staging directory too (PyYaml is
> > needed in croos-compilation too).
>
> Why would you need a Python module in the staging directory?
>
> There are two possibilities:
>
>  * PyYaml is used during the build process of another component. In
>    this case, PyYaml is used in the *build* machine and should be
>    installed in the host/ directory of Buildroot, through a
>    host-python-package.
>
>  * PyYaml is used at runtime on the target. In this case, PyYaml is
>    used on the *target* machine and should be installed in the target/
>    directory of Buildroot, through a python-package.
>
> > Also, I tried with key PYTHON_YAML_INSTALL_STAGING = YES and it did
> > not install PyYaml in staging directory, only in target.
>
> Correct.
>
> I'd like to help you, but I first need to understand why you think you
> need PyYaml installed in the staging directory.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/30a8f15c/attachment.html>
