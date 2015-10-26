From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 07:29:28 +0100
Subject: [Buildroot] [PATCH 1/1] boost.mk: allow building both static
 and shared
In-Reply-To: <1445766773-19279-1-git-send-email-yba@tkos.co.il>
References: <1445766773-19279-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151026072928.258ec47b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Sun, 25 Oct 2015 11:52:53 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Use BR2_SHARED_STATIC_LIBS for building both static and shared boost libs.
> The static libs are copied to the staging directory. Only the shared libs are
> copied to the rootfs image.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/boost/boost.mk |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied, with some slight changes:

    [Thomas:
     - remove empty else clause, and instead add a comment that explains
       why we're doing something only for the BR2_STATIC_LIBS=y and
       BR2_SHARED_LIBS=y.
     - remove trailing backslash at the end of the BOOST_CONF_OPTS
       definition.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
