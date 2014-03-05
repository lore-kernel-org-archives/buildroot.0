From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 00:27:49 +0100
Subject: [Buildroot] [PATCH 03/11] opencv: add jasper support
In-Reply-To: <CAHXCMMKngVUrq+fY38wZVpVtPttSgu1mxtLQKF5K=FNZK7EpFg@mail.gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-4-git-send-email-s.martin49@gmail.com>
 <20140305225913.GD9644@free.fr>
 <CAHXCMMKngVUrq+fY38wZVpVtPttSgu1mxtLQKF5K=FNZK7EpFg@mail.gmail.com>
Message-ID: <20140305232749.GF9644@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-06 00:08 +0100, Samuel Martin spake thusly:
> On Wed, Mar 5, 2014 at 11:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Samuel, All,
> >
> > On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> >> ---
> >>  package/opencv/Config.in | 6 ++++++
> >>  package/opencv/opencv.mk | 8 +++++++-
> >>  2 files changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> >> index 2acbe19..73f03e1 100644
> >> --- a/package/opencv/Config.in
> >> +++ b/package/opencv/Config.in
> >> @@ -158,6 +158,12 @@ config BR2_PACKAGE_OPENCV_WITH_GTK
> >>       depends on BR2_INSTALL_LIBSTDCPP
> >>       select BR2_PACKAGE_LIBGTK2
> >>
> >> +config BR2_PACKAGE_OPENCV_WITH_JASPER
> >> +     bool "jasper (jpeg 2000) support"
> >> +     select BR2_PACKAGE_JASPER
> >> +     help
> >> +       Use shared libjasper from the target system.
> >
> > What do you mean by "from the target system?"
> 
> OpenCV comes with many libs in its 3rdparty directory (ffmpeg, jinja2,
> libjasper, libjpeg, libpng, libtiff, libwebp, openexr, tbb, zlib), and
> can build these, or use those provided by the system or disabling
> their support.
> 
> When I integrated opencv in BR for the first, it was requested to me
> to only use the libs provided by the system. I stick to this ;-)

Ah, OK I understand. But then, the help text is not clear enough.

I would expect to read something like:

    config BR2_PACKAGE_OPENCV_WITH_JASPER
        bool "jpeg2000 support"
        select BR2_PACKAGE_JASPER
        help
          Use the package 'libjasper' to provide support for jpeg2000.

          The copy of libjasper bundled in openCV is not used.

But do we even want to state this in the help text?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
