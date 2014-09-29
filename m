From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Sep 2014 10:10:15 +0100
Subject: [Buildroot] [PATCH] opencv: Bump version to 2.4.9.1
In-Reply-To: <87h9zuxke6.fsf@dell.be.48ers.dk>
References: <1411736978-35600-1-git-send-email-Vincent.Riera@imgtec.com>
 <87h9zuxke6.fsf@dell.be.48ers.dk>
Message-ID: <542921F7.8010509@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/2014 08:16 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > And also add a hash file.
>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>   > ---
>   >  package/opencv/opencv.hash |    3 +++
>   >  package/opencv/opencv.mk   |    2 +-
>   >  2 files changed, 4 insertions(+), 1 deletions(-)
>   >  create mode 100644 package/opencv/opencv.hash
>
>   > diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
>   > new file mode 100644
>   > index 0000000..04cb3c5
>   > --- /dev/null
>   > +++ b/package/opencv/opencv.hash
>   > @@ -0,0 +1,3 @@
>   > +# From https://github.com/itseez/opencv/archive/2.4.9.1/
>   > +md5	f9d8626711a183a8f39ce9822a40f35f	opencv-2.4.9.1.tar.gz
>   > +sha1	adcaf808e4d5d3b394514061d1da3d4352964c7d	opencv-2.4.9.1.tar.gz
>   > diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
>   > index 8c2de79..f77d14d 100644
>   > --- a/package/opencv/opencv.mk
>   > +++ b/package/opencv/opencv.mk
>   > @@ -4,7 +4,7 @@
>   >  #
>   >  ################################################################################
>
>   > -OPENCV_VERSION = 2.4.8
>   > +OPENCV_VERSION = 2.4.9.1
>   >  OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
>   >  OPENCV_INSTALL_STAGING = YES
>   >  OPENCV_LICENSE = BSD-3c
>
> Seems like the license file (location) changed:
>
> make opencv-legal-info
> cat: /home/peko/source/buildroot/output/build/opencv-2.4.9.1/doc/license.txt: No such file or directory
> package/opencv/opencv.mk:250: recipe for target 'opencv-legal-info' failed
> make: *** [opencv-legal-info] Error 1
>
> Care to fix that and resend?

Fixed:
   http://patchwork.ozlabs.org/patch/394308/

Sorry for the delay :)

-- 
Vincent
