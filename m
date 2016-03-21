From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 21 Mar 2016 16:56:16 +0100
Subject: [Buildroot] [PATCH 2/5] package/qt5webkit: remove obsolete
	package
In-Reply-To: <1458207749-19507-3-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
 <1458207749-19507-3-git-send-email-corjon.j@ecagroup.com>
Message-ID: <CAAMH-ysg3UrRUxNTCk40Ki=1eg1OGmGfOzKWyip7rys9PZskrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On Thu, Mar 17, 2016 at 10:42 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/Config.in                |  1 -
>  package/qt5/qt5webkit/Config.in      | 23 --------------
>  package/qt5/qt5webkit/qt5webkit.hash |  2 --
>  package/qt5/qt5webkit/qt5webkit.mk   | 58 ------------------------------------
>  4 files changed, 84 deletions(-)
>  delete mode 100644 package/qt5/qt5webkit/Config.in
>  delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
>  delete mode 100644 package/qt5/qt5webkit/qt5webkit.mk

Are we sure we want to remove this package actually? The release says:
"With Qt 5.6 the following modules are no longer part of the release
packages, but users can still build them from source:
- Qt WebKit
- Qt Declarative (Qt Quick 1)"

But the project has a qt5.6.0 branch just like the other modules:
https://github.com/qtproject/qtwebkit/commits/5.6.0

Especially since we don't have any replacement I wouldn't merge this
patch just yet. Plus webkit can run on a platform without GPU whereas
WebEngine depends on OpenGL, I wouldn't mind keeping it, for i.MX7
platforms for instance.

The package would need to be modified to use the github project
instead of the release archives though.

Let me know your thoughts.

Regards,
Gary
