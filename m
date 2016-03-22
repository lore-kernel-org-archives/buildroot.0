From: Julien CORJON <corjon.j@ecagroup.com>
Date: Tue, 22 Mar 2016 09:52:26 +0000
Subject: [Buildroot] [PATCH 2/5] package/qt5webkit: remove obsolete
 package
In-Reply-To: <CAAMH-ysg3UrRUxNTCk40Ki=1eg1OGmGfOzKWyip7rys9PZskrg@mail.gmail.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
 <1458207749-19507-3-git-send-email-corjon.j@ecagroup.com>
 <CAAMH-ysg3UrRUxNTCk40Ki=1eg1OGmGfOzKWyip7rys9PZskrg@mail.gmail.com>
Message-ID: <4f32a048-4171-43f8-baac-9c20e310921e@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

Le 21/03/2016 16:56, Gary Bisson a ?crit :
> Julien, All,
>
> On Thu, Mar 17, 2016 at 10:42 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
>>
>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>> ---
>>   package/qt5/Config.in                |  1 -
>>   package/qt5/qt5webkit/Config.in      | 23 --------------
>>   package/qt5/qt5webkit/qt5webkit.hash |  2 --
>>   package/qt5/qt5webkit/qt5webkit.mk   | 58 ------------------------------------
>>   4 files changed, 84 deletions(-)
>>   delete mode 100644 package/qt5/qt5webkit/Config.in
>>   delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
>>   delete mode 100644 package/qt5/qt5webkit/qt5webkit.mk
>
> Are we sure we want to remove this package actually? The release says:
> "With Qt 5.6 the following modules are no longer part of the release
> packages, but users can still build them from source:
> - Qt WebKit
> - Qt Declarative (Qt Quick 1)"
>
> But the project has a qt5.6.0 branch just like the other modules:
> https://github.com/qtproject/qtwebkit/commits/5.6.0

You're almost right, the project have a 5.6 branch but 5.6.0 version has 
not been tagged on deprecated modules. If we want to keep those in 
buildroot we have now to "randomly" choose a commit.

>
> Especially since we don't have any replacement I wouldn't merge this
> patch just yet. Plus webkit can run on a platform without GPU whereas
> WebEngine depends on OpenGL, I wouldn't mind keeping it, for i.MX7
> platforms for instance.

I agree that platform without OpenGL support lose web browser ability 
from Qt and for that we should probably keep webkit in buildroot 
packages. But I'm not sure we should keep it in official Qt section 
since there not officially supported by Digia and Qt community.

>
> The package would need to be modified to use the github project
> instead of the release archives though.

If we use Qt repository we should use the official one 
(http://code.qt.io/cgit/qt/qtwebkit.git/) instead of github.

>
> Let me know your thoughts.
>
> Regards,
> Gary
>

Regards,

Julien
