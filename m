From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:29:36 +0100
Subject: [Buildroot] [PATCH v5] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <1509667284-13771-1-git-send-email-joshua.henderson@microchip.com>
References: <1509667284-13771-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171201232936.06e6055b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 17:01:24 -0700, Joshua Henderson wrote:
> Qt Quick should no longer depend on opengl, and instead fallback to the limited
> functionality software renderer as a replacement [1] when not available. This
> also pulls in an upstream qt5declarative 5.10 patch [2], replacing an existing
> one, to qt5 5.9.2 to fix no-opengl builds.
> 
> [1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/
> [2] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6b
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> ---

I've applied to master, after dropping
package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
because Peter has bumped Qt to 5.9.3 since then, and qt5declarative
5.9.3 already includes this fix for non-OpenGL builds.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
