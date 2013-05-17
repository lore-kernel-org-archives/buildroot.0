From: =?ISO-8859-2?Q?Wojciech_Sle=F1ska?= <wojciech.slenska@gmail.com>
Date: Fri, 17 May 2013 23:04:44 +0200
Subject: [Buildroot] [PATCH] qt5 libQt5OpenGL.so library installation
In-Reply-To: <519475C3.7040407@mind.be>
References: <1368650084-24427-1-git-send-email-wojciech.slenska@gmail.com>
 <519475C3.7040407@mind.be>
Message-ID: <CAMYPSMpf6XjCvQnt5j_qVGaojkYnhWODEOFGtG2iDR4NbdDFXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/5/16 Arnout Vandecappelle <arnout@mind.be>:
> On 15/05/13 22:34, Wojciech Slenska wrote:
>>
>> When qt5 is build with EGLFS support, libQt5OpenGL library should be
>> copied to target.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>> ---
>>   package/qt5/qt5base/qt5base.mk | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk
>> b/package/qt5/qt5base/qt5base.mk
>> index bfc6c91..7c6a093 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -118,6 +118,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT)
>> += Qt5Concurrent
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
>> +QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5OpenGL
>
>
>  eglfs works fine for me without this library...
>
>  Regards,
>  Arnout
>
>
>>
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
>>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Hello Arnout,

EGLFS is working without library, but not all QT applications will be
work. There will be problems with opengl apps (for example
examples/opengl/hellogl_es2/) and for some QML apps.

Current behavior is little bit inconsistent because when eglfs is
selected, qt5 is build with flag -opengl, but library are never
installed on target. Please check line 87 in qtbase.mk file
ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs

BR
Wojtek
