From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:17:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix static compile
In-Reply-To: <1437763107-19489-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437763107-19489-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150726151749.2de2296c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 24 Jul 2015 20:38:27 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/aeb/aeb5481526497a01ada8ee9403f282a2374b0383/
> http://autobuild.buildroot.net/results/255/25536df514477f3210caf4af27f2f107683f7fb2/
> http://autobuild.buildroot.net/results/fa1/fa11cb360190b02d08e74997b0abc73079760dfa/
> and many others
> 
> This is a follow-up for these patches:
> http://patchwork.ozlabs.org/patch/493360/
> http://patchwork.ozlabs.org/patch/416007/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/minidlna/minidlna.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied after some changes:

    [Thomas:
      - don't pass --static to pkg-config, since our pkg-config wrapper
        already passes it automatically when BR2_STATIC_LIBS=y.
      - make only one call to pkg-config for all three libraries
      - put the libintl logic separately from the definition of
        MINIDLNA_CONF_ENV.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
