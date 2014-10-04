From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:46:40 +0200
Subject: [Buildroot] [PATCH v2] protobuf: bump version to 2.6.0
In-Reply-To: <CANQCQpb1_RamJ2HHBS_pyzVD-tBW-505=75Lwda3AKuRMs+55A@mail.gmail.com>
References: <1412282436-9176-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20141004142755.1f402a23@free-electrons.com>
 <CANQCQpb1_RamJ2HHBS_pyzVD-tBW-505=75Lwda3AKuRMs+55A@mail.gmail.com>
Message-ID: <20141004184640.2907d9c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Sat, 4 Oct 2014 10:37:13 -0500, Matthew Weber wrote:

> >  * host-protobuf-c-v1.0.0-rc1
> >    http://autobuild.buildroot.org/results/647/64707ecd9acfbf519d5f22dd6bd5b39c3b544073/build-end.log
> 
> Known issue https://github.com/protobuf-c/protobuf-c/issues/163.
> I'll bump protobuf-c to v1.0.2 and retest.

Sounds good.

> >  * python-protobuf-2.6.0
> >    http://autobuild.buildroot.org/results/b3b/b3b36c72b233a624ebae9eaac592b7c6fbd394be/build-end.log
> 
> This one is a failure on dependencies that the setup.py is trying to
> download.  What's the general feeling with setuptools doing downloads
> on it's own?  I assume we need to add those python packages to
> buildroot and correct the missing dependencies?

Absolutely.

> Initially it looks like the package dependency list would be:
>     google_apputils
>     pytz
>     python_gflags
> I'm not to familiar with how setuptools checks for dependencies
> existing before defaulting to retrieving a pypi archive.  Does it
> check the sysroot path we point it at to make the decision?

I don't really know. I guess it checks in PYTHONPATH.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
