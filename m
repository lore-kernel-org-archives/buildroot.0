From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 18:30:58 +0200
Subject: [Buildroot] [PATCH] qt5base: Fix compile errors in qurl.h /
 qeglplatformscreen.cpp
In-Reply-To: <55E99F28.3030409@imgtec.com>
References: <1441286530-63345-1-git-send-email-marc.andre@netline.ch>
 <55E99F28.3030409@imgtec.com>
Message-ID: <55E9C742.5080804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-09-15 15:39, Vicente Olivert Riera wrote:
> Dear Marc Andre,
> 
> On 09/03/2015 02:22 PM, Marc Andre wrote:
[snip]
>> +Based on patch from Yocto project and buildroot patch from
>> +Jerome Pouiller <jezz@sysmic.org>
>> +Updated to fix issue in qeglplatformscreen (reorder includes, see also
>> +http://lists.qt-project.org/pipermail/development/2013-March/010511.html)
>>  
>> -[based on patch from Yocto project]
> 
> I'm not sure if this is correct. Yes, you are modifying the patch and
> adding new stuff, but the rest is still based on Yocto Project's patch.
> I think it should stay, or at least say something like:

 It is still there, a few lines up:

Based on patch from Yocto project and buildroot patch from
Jerome Pouiller <jezz@sysmic.org>

 That said, I don't really like the way it's formulated either, I'd prefer to
keep the original and add something:

 [based on patch from Yocto project]
 Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+Updated to fix issue in qeglplatformscreen (reorder includes, see also
+http://lists.qt-project.org/pipermail/development/2013-March/010511.html)
+Signed-off-by: Marc Andre <marc.andre@netline.ch>

 But really, it's not that important, so:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> [part of it based on patch from Yocto project]
> 
>>  Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> +Signed-off-by: Marc Andre <marc.andre@netline.ch>
>>  
>>  
>>  diff -Nuar a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
>> @@ -61,4 +67,19 @@ diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/pl
>>   #include "qeglplatformscreen_p.h"
>>   
>>   QT_BEGIN_NAMESPACE
>> +--- qtbase-opensource-src-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:46:57.116883353 +0200
>> ++++ qtbase-opensource-src-5.5.0/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:47:36.560882333 +0200
>> +@@ -31,11 +31,11 @@
>> + **
>> + ****************************************************************************/
>> +
>> +-#include "qeglplatformscreen_p.h"
>> +-#include "qeglplatformwindow_p.h"
>> + #include <QtGui/qwindow.h>
>> + #include <qpa/qwindowsysteminterface.h>
>> + #include <QtPlatformSupport/private/qopenglcompositor_p.h>
>> ++#include "qeglplatformscreen_p.h"
>> ++#include "qeglplatformwindow_p.h"
>> +
>> + QT_BEGIN_NAMESPACE
>>   
>>
> 
> Regards,
> 
> Vincent.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
