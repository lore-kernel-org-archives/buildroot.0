From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Nov 2020 10:37:01 +0000
Subject: [Buildroot] [Bug 13306] New: wpewebkit build problem in 2020-11-rc1
Message-ID: <bug-13306-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13306

            Bug ID: 13306
           Summary: wpewebkit build problem in 2020-11-rc1
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

wpewebkit included in 2020-11-rc1 doesn't compile

In file included from
/home/matuschd/buildroot-4/build/wpewebkit-2.30.2/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-6.cpp:2:
/home/matuschd/buildroot-4/build/wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:
In member function ?void
WebKit::InjectedBundle::overrideBoolPreferenceForTestRunner(WebKit::WebPageGroupProxy*,
const WTF::String&, bool)?:
/home/matuschd/buildroot-4/build/wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30:
error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?;
did you mean ?setBeaconAPIEnabled??
             page->settings().setGenericCueAPIEnabled(enabled);
                              ^~~~~~~~~~~~~~~~~~~~~~~
                              setBeaconAPIEnabled
Source/WebKit/CMakeFiles/WebKit.dir/build.make:5218: recipe for target
'Source/WebKit/CMakeFiles/WebKit.dir/__/__/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-6.cpp.o'
failed
make[4]: ***
[Source/WebKit/CMakeFiles/WebKit.dir/__/__/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-6.cpp.o]
Error 1
make[4]: *** Waiting for unfinished jobs....
CMakeFiles/Makefile2:1388: recipe for target
'Source/WebKit/CMakeFiles/WebKit.dir/all' failed
make[3]: *** [Source/WebKit/CMakeFiles/WebKit.dir/all] Error 2
Makefile:151: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:247: recipe for target
'/home/matuschd/buildroot-4/build/wpewebkit-2.30.2/.stamp_built' failed
make[1]: *** [/home/matuschd/buildroot-4/build/wpewebkit-2.30.2/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
