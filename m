From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 20:17:26 +0200
Subject: [Buildroot] [PATCH] qt5base: Fix compile errors in qurl.h /
 qeglplatformscreen.cpp
In-Reply-To: <1441286530-63345-1-git-send-email-marc.andre@netline.ch>
References: <1441286530-63345-1-git-send-email-marc.andre@netline.ch>
Message-ID: <20151017201726.41a4fa77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marc Andre,

On Thu,  3 Sep 2015 15:22:10 +0200, Marc Andre wrote:
> Update the already existing fix for EGL/X11 header issue to fix
> an additional problem encountered on my system where I had
> compile errors in qeglplatformscreen.cpp. The problem was related
> to the wrong order of includes. The X11 headers must always be
> included last, as indicated in
> http://lists.qt-project.org/pipermail/development/2013-March/010511.html
> 
> I decided instead of adding a new patch to update the existing patch,
> because it is an additional fix for the same problem. If you don't agree
> I am happy to submit a seperate patch.
> 
> This version is updated as suggested by Arnout.
> 
> Signed-off-by: Marc Andre <marc.andre@netline.ch>
> ---
>  package/qt5/qt5base/0003-xcb-egl-fixes.patch | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)

Applied, after slightly tweaking the commit log (to avoid sentence at
the first person) and rework the SoB as suggested by Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
