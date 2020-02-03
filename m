From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:41:52 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/gqrx: backport/adapt patch
 to suppport Gnuradio 3.8
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200203234152.0e6f97bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jan 2020 12:02:27 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Gnuradio 3.8 has break some functions or header. Current gqrx release does
> not support these new features.
> 
> So we add compatibility backport patches from pull-request:
> https://github.com/csete/gqrx/pull/705
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gqrx/0001-add_includes_for_GR38.patch | 194 ++++++++++++++++++
>  ...2-build_with_cmake_for_both_versions.patch |  59 ++++++
>  ...0003-pass_GNU_Radio_version_as_macro.patch | 161 +++++++++++++++
>  .../0004-link_against_gr-audio_library.patch  |  21 ++
>  ...-support_37_and_38_builds_with_qmake.patch |  53 +++++
>  ..._shells_without_here-string_operator.patch |  26 +++
>  6 files changed, 514 insertions(+)
>  create mode 100644 package/gqrx/0001-add_includes_for_GR38.patch
>  create mode 100644 package/gqrx/0002-build_with_cmake_for_both_versions.patch
>  create mode 100644 package/gqrx/0003-pass_GNU_Radio_version_as_macro.patch
>  create mode 100644 package/gqrx/0004-link_against_gr-audio_library.patch
>  create mode 100644 package/gqrx/0005-support_37_and_38_builds_with_qmake.patch
>  create mode 100644 package/gqrx/0006-support_shells_without_here-string_operator.patch

I've applied the entire series. I will make a few comments on some of
the patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
