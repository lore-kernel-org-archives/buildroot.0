From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 24 Apr 2018 18:51:52 -0700
Subject: [Buildroot] Chromium
In-Reply-To: <8319B51E-D49A-4E02-A69E-16602EF168EF@gamecodehq.com>
References: <5B0BF4C3-9DC5-4199-BB4E-2B303C3EF2C8@gamecodehq.com>
 <20180423212505.68654293@windsurf>
 <8319B51E-D49A-4E02-A69E-16602EF168EF@gamecodehq.com>
Message-ID: <CAMWSM7ibdR6QbSD2xePPVfcKBe538G=tXcABE9jJSifDS4LdgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha?,

On Tue, Apr 24, 2018 at 5:01 AM, Micha? Kalbarczyk
<michal@gamecodehq.com> wrote:
> Thanks for the reply,
>
> How should I start?

The manual is as good a place as any. Chapter 17 details adding new
packages to Buildroot:
https://buildroot.org/downloads/manual/manual.html#adding-packages

You'll need to figure out what toolchain requirements Chromium has, as
well as build dependencies.

Chromium has quite a few compile-time options, and quite a few
dependencies for "desktop Linux" (GN arg 'is_desktop_linux'),
including dbus, glib2, gio, gtk2/3, X11, cups, and more.

It might not be a bad idea to start with a ChromeOS build (GN arg
target_os="chromeos") to disable a lot of these optional dependencies.

A feature complete package may also allow the user to select the
features they want from Kconfig, which would select the dependencies
for a given feature when enabled. See the the Buildroot packages
'mesa3d' and 'x11r7' for examples.

To see the available build options for Chromium, run:
    gn args --list out/Default

This will give you an idea of what can be toggled, and what's
necessary for the build.

Best,
Joseph
