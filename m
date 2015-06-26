From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:39:38 +0200
Subject: [Buildroot] [PATCH v6 02/16] package/opencv: bump to version 3.0
In-Reply-To: <1435262397-888-3-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626203938.7e920e06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 25 Jun 2015 21:59:43 +0200, Samuel Martin wrote:
> This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
> 3.0.
> 
> OpenCV-2.4.11 improves a lot the Buildroot integration, including a
> couple of patches that are no longer needed:
> - x86 PIC code compilation fix in core module [1];
> - return type fix in superes module [2];
> - opencv.pc generation [3].
> 
> It also improves the gstreamer-0.10/1.x detection [4], that will be
> needed in a follow-up patch.
> 
> OpenCV-3.0 still requires 2 patches (backported from upstream fixing
> pthread support [5,6].
> 
> The OpenCV-3.0 does some major changes, for which a transition guide
> has been published [7].
> 
> Among these changes coming with OpenCV-3.0, some new modules have been
> introduced and others got removed; leading to a bunch of configure
> option updates (to keep as much as possible an iso-functional-perimeter)
> and the legacy menu has been updated too.
> The worth noticing removals being:
> - the opencv_legacy and opencv_nonfree modules no longer exist;
> - the opencv_contrib module has moved out of the opencv base tree and
>   now has its own repository [8].
>   There is currently no plan to support it.
> 
> Some 3rd-party supports have been improved or added; their integrations
> in Buildroot will be addressed in follow-up patches.
> 
> [1] https://github.com/Itseez/opencv/commit/ea50be0529c248961e1b66293f8a9e4b807294a6
> [2] https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4
> [3] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
> [4] https://github.com/Itseez/opencv/commit/38bb0db9dbec08666c8a64b3e4ead8fadf15c980
> [5] https://github.com/Itseez/opencv/commit/1f983ec39c97298b0c8ce409a1cc229ecf14e55c
> [6] https://github.com/Itseez/opencv/commit/a482dcce464acbd5368fb93c6c3d52ba8401776a
> [7] http://docs.opencv.org/master/db/dfa/tutorial_transition_guide.html
> [8] https://github.com/itseez/opencv_contrib
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5->v6:
> - rebase
> - fix commit message (Yann)
> - improve legacy options (Yann)
> - use positive logic (Yann)
> - remove duplicated configure options (Yann)
> - update module selection comment
> - add missing WITH_GSTREAMER_0_10 (Yann)
> - add patches backported from upstream fixing failures on local
>   autobuilder instances
> - disable if BR2_STATIC_LIBS (fixe local autobuilder failures)

I've taken into account most of the comments from Yann and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
