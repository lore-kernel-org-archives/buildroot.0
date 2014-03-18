From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Mar 2014 15:28:51 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <53285568.7080900@gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com> <53284881.1090803@gmail.com>
 <CAAXf6LUmEB2=XB=CuUnDREER139E3MiouKLMa4GAFrNvnDzJsw@mail.gmail.com>
 <53285568.7080900@gmail.com>
Message-ID: <CAAXf6LX-dJFpaOkMaCg0A4PD1FphzO8xbPbLWTyLTX3xmO+ELA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 18, 2014 at 3:17 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Thomas,
>
> Il 18/03/2014 14:50, Thomas De Schampheleire ha scritto:
>
>> The package is built in output/build/gstreamer-0.10.36 and the .mk
>> file is in package/gstreamer/gstreamer/gstreamer.mk
>>
>> This package is pulled in by qt5multimedia as follows:
>>
>> qt5multimedia:
>> ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
>> QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
>> endif
>>
>> gst-plugins-base:
>> GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
>>
>> As your config sets BR2_PACKAGE_GST_PLUGINS_BASE, the gstreamer
>> package should be built.
>
>
> It seems all correct here. The gstreamer package is built, actually. I don't
> know if I might check something in details to be sure there were no problems
> here.

You can go to output/build/qt5multimedia and try to re-execute the
command mentioned in config.log related to the gstreamer test. Maybe
you can debug based on that, maybe using 'strace -fo /tmp/out
<command>' to check what kind of files it is looking for.

I have no better ideas, sorry...

Best regards,
Thomas
