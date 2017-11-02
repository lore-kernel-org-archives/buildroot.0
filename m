From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 21:58:11 +0100
Subject: [Buildroot] [PATCH 1/1] qt5: remove Qt Quick dependency on
 opengl
In-Reply-To: <bfb99fd2-5855-fd21-0ee1-00b28a7113d7@microchip.com>
References: <1509639751-16841-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20171102171831.GC3238@scaer>
 <bfb99fd2-5855-fd21-0ee1-00b28a7113d7@microchip.com>
Message-ID: <20171102205811.GC30054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2017-11-02 11:32 -0700, Joshua Henderson spake thusly:
> On 11/02/2017 10:18 AM, Yann E. MORIN wrote:
> > On 2017-11-02 17:22 +0100, S?bastien Szymanski spake thusly:
> >> From: Joshua Henderson <joshua.henderson@microchip.com>
> >>
> >> Qt Quick should no longer depend on opengl, and instead fallback to the limited
> >> functionality software renderer as a replacement [1] when not available. This
> >> also pulls a qt5declarative patch into 5.9.2 to fix examples compiling without
> >> opengl.
[--SNIP--]
> >> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >> +---
> >> + examples/quick/quick.pro | 5 ++++-
> >> + 1 file changed, 4 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
> >> +index 445dfb0fa..26ca0138e 100644
> >> +--- a/examples/quick/quick.pro
> >> ++++ b/examples/quick/quick.pro
> >> +@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
> >> + # Widget dependent examples
> >> + qtHaveModule(widgets) {
> >> +     SUBDIRS += embeddedinwidgets
> >> +-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> >> ++    # OpenGL Support Required
> >> ++    qtConfig(opengl(es1|es2)?) {
> >> ++        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
> > 
> > Upstream has a different patch, as commit fa52bb665d6b. Can you use that
> > instead of your own?
> > 
> 
> Looks like it.  I'll re-spin using that patch from the 5.10 branch.  I originally
> copied this from the existing 5.6.3 patch, so I'll see if the same patch fits
> there as well.

Ah, right, we already had it for 5.6.3 (I did not even thought of
looking).

But we do not want to backport the upstream patch to 5.6.3, because they
are not the same license, so we want to keep our own.

Regards,
Yann E. MORIN.

> S?bastien, thanks for adding that qt5virtualkeyboard can also support no opengl.
> Looks good.
> 
> Josh
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
