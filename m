From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  5 Jul 2017 18:32:52 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: broken with sunxi mali
	package
Message-ID: <20170705163254.15156-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building this defconfig

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_SUNXI_MALI=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

ends up with this build error:

[ 98%] Building CXX object build/windowing/egl/CMakeFiles/windowing_egl.dir/EGLWrapper.cpp.o
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In function ?bool {anonymous}::CorrectGuess(CEGLNativeType*, const string&)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:63:13: error: invalid use of incomplete type ?class CEGLNativeType?
     if(guess->CheckCompatibility())
             ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:65:34: error: invalid use of incomplete type ?class CEGLNativeType?
       if (implementation == guess->GetNativeName() ||
                                  ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::Initialize(const string&)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:105:7: error: expected primary-expression before ?)? token
       )
       ^
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:109:18: error: invalid use of incomplete type ?class CEGLNativeType?
     m_nativeTypes->Initialize();
                  ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::Destroy()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:121:16: error: invalid use of incomplete type ?class CEGLNativeType?
   m_nativeTypes->Destroy();
                ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:123:10: warning: possible problem detected in invocation of delete operator: [-Wdelete-incomplete]
   delete m_nativeTypes;
          ^~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:123:10: warning: invalid use of incomplete type ?class CEGLNativeType?
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:123:10: note: neither the destructor nor the class-specific operator delete will be called, even if they are declared when the class is defined
   delete m_nativeTypes;
          ^~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?std::__cxx11::string CEGLWrapper::GetNativeName()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:131:25: error: invalid use of incomplete type ?class CEGLNativeType?
     return m_nativeTypes->GetNativeName();
                         ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::CreateNativeDisplay()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:140:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->CreateNativeDisplay();
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::CreateNativeWindow()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:148:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->CreateNativeWindow();
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?void CEGLWrapper::DestroyNativeDisplay()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:154:18: error: invalid use of incomplete type ?class CEGLNativeType?
     m_nativeTypes->DestroyNativeDisplay();
                  ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?void CEGLWrapper::DestroyNativeWindow()?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:160:18: error: invalid use of incomplete type ?class CEGLNativeType?
     m_nativeTypes->DestroyNativeWindow();
                  ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::SetNativeResolution(RESOLUTION_INFO&)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:167:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->SetNativeResolution(res);
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::ProbeResolutions(std::vector<RESOLUTION_INFO>&)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:174:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->ProbeResolutions(resolutions);
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::GetPreferredResolution(RESOLUTION_INFO*)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:182:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->GetPreferredResolution(res);
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::GetNativeResolution(RESOLUTION_INFO*)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:190:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->GetNativeResolution(res);
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::ShowWindow(bool)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:198:23: error: invalid use of incomplete type ?class CEGLNativeType?
   return m_nativeTypes->ShowWindow(show);
                       ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::GetQuirks(int*)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:205:26: error: invalid use of incomplete type ?class CEGLNativeType?
   *quirks = m_nativeTypes->GetQuirks();
                          ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::InitDisplay(void**)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:217:21: error: invalid use of incomplete type ?class CEGLNativeType?
   if (!m_nativeTypes->GetNativeDisplay((XBNativeDisplayType**)&nativeDisplay))
                     ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:217:41: error: ?XBNativeDisplayType? was not declared in this scope
   if (!m_nativeTypes->GetNativeDisplay((XBNativeDisplayType**)&nativeDisplay))
                                         ^~~~~~~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:217:62: error: expected primary-expression before ?)? token
   if (!m_nativeTypes->GetNativeDisplay((XBNativeDisplayType**)&nativeDisplay))
                                                              ^
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp: In member function ?bool CEGLWrapper::CreateSurface(EGLDisplay, EGLConfig, void**)?:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:288:21: error: invalid use of incomplete type ?class CEGLNativeType?
   if (!m_nativeTypes->GetNativeWindow((XBNativeWindowType**)&nativeWindow))
                     ^~
In file included from /home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:40:0:
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.h:28:7: note: forward declaration of ?class CEGLNativeType?
 class CEGLNativeType;
       ^~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:288:40: error: ?XBNativeWindowType? was not declared in this scope
   if (!m_nativeTypes->GetNativeWindow((XBNativeWindowType**)&nativeWindow))
                                        ^~~~~~~~~~~~~~~~~~
/home/buildroot/output/build/kodi-17.3-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:288:60: error: expected primary-expression before ?)? token
   if (!m_nativeTypes->GetNativeWindow((XBNativeWindowType**)&nativeWindow))
                                                            ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/kodi/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 658670139..00e4fbaef 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -22,16 +22,21 @@ config BR2_PACKAGE_KODI_EGL_GLES
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on !BR2_PACKAGE_KODI_GL_EGL # prefer GL if available
+	depends on !BR2_PACKAGE_SUNXI_MALI
 
 config BR2_PACKAGE_KODI_GL_EGL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_PACKAGE_SUNXI_MALI
 
 comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
 
+comment "kodi does not support the sunxi mali driver"
+	depends on BR2_PACKAGE_SUNXI_MALI
+
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_ENABLE_LOCALE
-- 
2.11.0
