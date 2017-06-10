From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 11:05:51 +0200
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <4522e427-efbe-49e2-dd27-6c05e042d192@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-06-17 17:43, Brent Sink wrote:
[snip]
> In file included from
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.cc:5:0:
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.h:37:15:
> error: field ?device_name_? has incomplete type ?std::__cxx11::string {aka
> std::__cxx11::basic_string<char>}?
>    std::string device_name_;
>                ^
> In file included from
> /home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/iosfwd:39:0,
>                  from
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/base/memory/scoped_ptr.h:88,
>                  from
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.h:11,
>                  from
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.cc:5:
> /home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/bits/stringfwd.h:71:11:
> note: declaration of ?std::__cxx11::string {aka class
> std::__cxx11::basic_string<char>}?
>      class basic_string;
>            ^

 This sounds like a missing #include <string> in touch_evdev_debug_buffer.h.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
