From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Nov 2016 10:03:41 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for
 rhel5 due to missing magic
In-Reply-To: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
References: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161109080341.5vmnkhdchbibzofz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Tue, Nov 08, 2016 at 11:39:02PM -0800, Max Filippov wrote:
> RHEL 5.x does have magic.h, but it does not define all expected symbols. In
> particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
> is using 4.17.

Instead of relying on host libmagic that may or may not be installed, why not 
add host-file to HOST_E2FSPROGS_DEPENDENCIES?

> Add substitute defines to allow continued usage of magic but without the
> requested exclude checks.
> 
> Backported from: b003b2e6f9e54e7b2bde15828b97f5dc285b915e

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
