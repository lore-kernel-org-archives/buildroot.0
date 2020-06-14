From: Julien Olivain <juju@cotds.org>
Date: Sun, 14 Jun 2020 12:54:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/eigen: fix package detection
 with CMake
In-Reply-To: <20200614072836.GB2346@scaer>
References: <20200613161643.609929-1-juju@cotds.org>
 <20200614072836.GB2346@scaer>
Message-ID: <f72aa8654240c37329f54d89df688f04@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Matt,

On 2020-06-14 09:28, Yann E. MORIN wrote:
> Julien, Matt, all,
> 
> On 2020-06-13 18:16 +0200, Julien Olivain spake thusly:
>> Eigen3 library normally installs a signature file named
>> "signature_of_eigen3_matrix_library" to help library detection:
>> https://gitlab.com/libeigen/eigen/-/blob/3.3.7/CMakeLists.txt#L423
>> 
>> This Buildroot package does not use CMake for installing files, as 
>> only
>> the headers are needed in the STAGING_DIR. A generic-package is used
>> instead with simple copies.
> 
> Why can't we use the cmake-package infra, rahter than duplicate what
> upstream does?

I agree, I can't see any reason why this package cannot use its upstream 
cmake infra.
I'll try to rewrite this patch to switch it as a cmake-package.

Best regards,

Julien.
