From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Mar 2014 14:50:41 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <53284881.1090803@gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com> <53284881.1090803@gmail.com>
Message-ID: <CAAXf6LUmEB2=XB=CuUnDREER139E3MiouKLMa4GAFrNvnDzJsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Tue, Mar 18, 2014 at 2:22 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Il 18/03/2014 14:17, Marco Trapanese ha scritto:
>
>>
>> it seems it doesn't find gstreamer:
>
>
>
> I confirm that:
>
> executing config test gstreamer
> + cd
> /home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer
> && /home/marco/dev/buildroot/output/h$
> Project ERROR: gstreamer-0.10 development package not found
> test gstreamer FAILED
>

Here is my output for this test:
http://code.bulix.org/tb1xf1-85860

(note: please use the above pastebin; I cannot access pastebin.com from work...)

>
> What's the name of the gstreamer-0.10 development package in buildroot?
> I can't find anything in nconfig or in the package dir.

The package is built in output/build/gstreamer-0.10.36 and the .mk
file is in package/gstreamer/gstreamer/gstreamer.mk

This package is pulled in by qt5multimedia as follows:

qt5multimedia:
ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
endif

gst-plugins-base:
GST_PLUGINS_BASE_DEPENDENCIES = gstreamer

As your config sets BR2_PACKAGE_GST_PLUGINS_BASE, the gstreamer
package should be built.

If it's not the case: how are you building exactly, simply 'make' ?

Best regards,
Thomas
