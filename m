From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 02 Jul 2018 00:50:36 -0300
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
References: <6113136f-de40-361e-659e-b49dc35db530@konsulko.com>
Message-ID: <5b39a10cb58a5_77672afb147106f8137e1@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jul 01, 2018 at 06:28 AM, Leon Anavi wrote:

> On 1.07.2018 12:22, Yann E. MORIN wrote:
>> On 2018-06-30 21:11 +0200, Yann E. MORIN spake thusly:
>>> On 2018-06-30 21:03 +0300, Leon Anavi spake thusly:
>> [--SNIP--]
>>>> Thank you for the feedback. I have experienced this issue while building
>>>> branch master on Ubuntu 16.04. As discussed in the IRC channel on Friday
>>>> the same issue has been reproduced in the CI, Job #78257653 triggered by
>>>> Thomas Petazzoni: https://gitlab.com/buildroot.org/buildroot/-/jobs/78257653
>> Could you please provide a bit more details on your buildsystem: what is
>> the filesystem you use to build?
> 
> The filesystem of my build machine is ext4. More details about the
> Ubuntu version:
> 
> Distributor ID:??? Ubuntu
> Description:??? Ubuntu 16.04.4 LTS
> Release:??? 16.04
> Codename:??? xenial

I reproduced the error here:
system: Ubuntu 18.04 LTS
filesystem: ext4
commit: 78af2a6362 (the same from the CI build mentioned above)
wrapped error message:
Copying files into the device: __populate_fs: Could not allocate block in ext2
filesystem while writing file "busybox"


From the CI url mentioned above it seems the same occurs also in the GitLab
runners, so I started a few builds. Note: please trust the log and ignore the
job status, all jobs failed when uploading artifacts, probably my mistake in the
hacked .gitlab-ci.yml.

2018.05                 [1] ok
2018.05                 [2] ok
2018.05-140-g8b0fd3cb49 [3] fail
2018.05-240-g43ebb35e9b [4] fail
2018.05-340-g9f26e91cc5 [5] fail
2018.05-440-gc0d19a2083 [6] fail
2018.05-505-g78af2a6362 [7] fail
2018.05-559-g855295b658 [8] fail

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/71910855
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670469
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670740
[4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671047
[5] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671078
[6] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78671235
[7] https://gitlab.com/buildroot.org/buildroot/-/jobs/78257653
[8] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/78670542


Regards,
Ricardo
