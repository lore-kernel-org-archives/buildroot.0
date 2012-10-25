From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Oct 2012 09:09:38 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
In-Reply-To: <20121025085632.30c9878f@skate>
References: <1348297189-29498-1-git-send-email-sho@relinux.de>
 <20121025085632.30c9878f@skate>
Message-ID: <CAHXCMM+vueN0425tdmpVQKH=dczLurJBynquR2LnyF-QMon9Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Stephan, all,

2012/10/25 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Stephan Hoffmann,
>
> On Sat, 22 Sep 2012 08:59:49 +0200, Stephan Hoffmann wrote:
>> Implementation of an interface connecting TUIO messages and QT events
>>
>> https://github.com/x29a/qTUIO
>>
>> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>  build-tested with a minimal internal toolchain for ARM.
>> ---
>>  package/Config.in       |    6 ++++
>>  package/qtuio/Config.in |   18 ++++++++++++
>>  package/qtuio/qtuio.mk  |   70 +++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 94 insertions(+), 0 deletions(-)
>>  create mode 100644 package/qtuio/Config.in
>>  create mode 100644 package/qtuio/qtuio.mk
>
> Looks like it breaks the build in certain configurations:
> http://autobuild.buildroot.net/results/c4a12fe6b8e7eb8c31ee2fd48893480bd098a008/build-end.log
>
> It seems like a debug version of the library, named libqTUIO_d.so, has
> been generated, which prevents the install rules from working.
I've a fix for this one:
https://github.com/tSed/buildroot/commit/b6297fd555f3288e0c3a1b3831706876aed3518c

I'll post it later on the ml.


Regards,

-- 
Sam
