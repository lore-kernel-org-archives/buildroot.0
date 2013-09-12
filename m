From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 11 Sep 2013 21:58:13 -0500
Subject: [Buildroot] [PATCH v2 4/7] mesa3d: modularize and bump to
	version 9.1.6
In-Reply-To: <20130908203051.63b7055d@skate>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-5-git-send-email-spenser@gillilanding.com>
 <20130908203051.63b7055d@skate>
Message-ID: <CAEBucnAdg9=7i82V4Y79vnXe-eodyFzc+X407sWnYGfcQnN9ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Sep 8, 2013 at 1:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Spenser Gilliland,
>
> On Thu,  5 Sep 2013 23:25:18 -0500, Spenser Gilliland wrote:
>>
>> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>> ---
>>  package/mesa3d/Config.in                           | 177 ++++++++++++++++++++-
>>  package/mesa3d/mesa3d-cross-glsl-compiler.patch    |  41 +++++
>>  package/mesa3d/mesa3d-gbm-without-dri.patch        |  30 ++++
>>  package/mesa3d/mesa3d-uclibc-locale.patch          |  56 -------
>>  package/mesa3d/mesa3d.mk                           | 115 +++++++++++--
>>  package/opengl/Config.in                           |   3 +
>>  package/opengl/libegl/libegl.mk                    |   4 +
>>  package/opengl/libgl/libgl.mk                      |  20 +++
>>  package/opengl/libgles/libgles.mk                  |   4 +
>>  package/opengl/libopenvg/libopenvg.mk              |   4 +
>>  .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
>>  11 files changed, 378 insertions(+), 80 deletions(-)
>>  create mode 100644 package/mesa3d/mesa3d-cross-glsl-compiler.patch
>>  create mode 100644 package/mesa3d/mesa3d-gbm-without-dri.patch
>>  delete mode 100644 package/mesa3d/mesa3d-uclibc-locale.patch
>>  create mode 100644 package/opengl/libgl/libgl.mk
>
> I'm far from being able to understand all the internal details of
> Mesa3D, what GBM is and so on, but from a Buildroot packaging
> perspective, it looks good to me, so:
>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> However, see my comments on PATCH 3/7 saying that maybe moving mesa3d
> outside of package/x11r7/ isn't really a good idea for the moment.
>
> Another comment below.
>
>>       depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on BR2_LARGEFILE
>
> This would require a comment saying that mesa3d is not available due to
> toolchain missing C++ and largefile support. This comment is missing
> today for C++ support, but it'd be good to add it. Can be done as a
> followup patch, though.

Will fix.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
