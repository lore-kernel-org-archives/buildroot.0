From: Vadym Kochan <vadim4j@gmail.com>
Date: Thu, 28 Feb 2019 21:19:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-27
In-Reply-To: <20190228070048.49BF086B2B@whitealder.osuosl.org>
References: <20190228070048.49BF086B2B@whitealder.osuosl.org>
Message-ID: <20190228191921.GA28686@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All

On Thu, Feb 28, 2019 at 07:00:43AM -0000, Thomas Petazzoni wrote:

> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 

...

>                     efl-1.21.1 | 1 

...

> 
> 
> Detail of failures
> ------------------
> 

...

>         i586 |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007 |     

I tried build this defconfig and it fails for me too. The failure is
caused because mesa3d installs some GL related typedef's which efl
declares them too because GL_ES_VERSION_2_0 is not defined by mesa3d. I
can fix the build only if manually select ES and EGL support for mes3d,
and manually select BR2_PACKAGE_EFL_OPENGLES=y. I really dont know which
part behaves wrongly (mesa3d or efl), so just put here my observation.


P.S.
Perhaps, maybe, it is needed to add checking (during configure) for these
re-defined GL types in efl instead of checking for GLES version definition.

Regards,
Vadim Kochan
