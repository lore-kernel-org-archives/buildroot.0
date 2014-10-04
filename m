From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 4 Oct 2014 10:37:13 -0500
Subject: [Buildroot] [PATCH v2] protobuf: bump version to 2.6.0
In-Reply-To: <20141004142755.1f402a23@free-electrons.com>
References: <1412282436-9176-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20141004142755.1f402a23@free-electrons.com>
Message-ID: <CANQCQpb1_RamJ2HHBS_pyzVD-tBW-505=75Lwda3AKuRMs+55A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Oct 4, 2014 at 7:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Thu,  2 Oct 2014 15:40:36 -0500, Matt Weber wrote:
>> * Adds powerpc architecture support
>> * Changes to the new github upstream site
>> * Updates the license filename
>>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>>
>> Changes v1 -> v2
>>  - Updated to not change license file. Had looked
>>    a tip not tag for 2.6.0 so it actually didn't
>>    changed in the latest release.(Suggested by Peter K.)
>
> This bump seems to have broken some packages that depend on protobuf:
>
>  * host-protobuf-c-v1.0.0-rc1
>    http://autobuild.buildroot.org/results/647/64707ecd9acfbf519d5f22dd6bd5b39c3b544073/build-end.log

Known issue https://github.com/protobuf-c/protobuf-c/issues/163.
I'll bump protobuf-c to v1.0.2 and retest.

>
>  * python-protobuf-2.6.0
>    http://autobuild.buildroot.org/results/b3b/b3b36c72b233a624ebae9eaac592b7c6fbd394be/build-end.log

This one is a failure on dependencies that the setup.py is trying to
download.  What's the general feeling with setuptools doing downloads
on it's own?  I assume we need to add those python packages to
buildroot and correct the missing dependencies?
Initially it looks like the package dependency list would be:
    google_apputils
    pytz
    python_gflags
I'm not to familiar with how setuptools checks for dependencies
existing before defaulting to retrieving a pypi archive.  Does it
check the sysroot path we point it at to make the decision?

Thanks,
-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
