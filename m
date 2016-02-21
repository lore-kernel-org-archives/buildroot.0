From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 12:03:42 +0100
Subject: [Buildroot] [PATCH 13/14] package/jack2: add optional support
	for opus
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
 <1456048218-4061-13-git-send-email-bernd.kuhls@t-online.de>
 <56C996A2.2080108@mind.be>
Message-ID: <e5iopcx3h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Sun, 21 Feb 2016 11:51:14 +0100 schrieb Arnout Vandecappelle:

>  Note that it also seems to have an optional dependency on celt051,
>  dbus,
> libsndfile, libsamplerate (based on looking at the wscripts).

Quoting https://git.busybox.net/buildroot/tree/package/jack2/jack2.mk#n10
"JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python"

I tried to compile celt051 with jack2 but somehow celt051 was not 
detected by jack2.

>  Which makes me wonder: how did you find these optional dependencies? I
>  assumed
> that you had built an allyesconfig, then deleted output/build, then
> built again,
> and then did a readelf. But in that case, you should have caught these
> other dependencies.

I built an allyesconfig, but the dependency check was done by the fli4l
[1] build system. Fli4l uses buildroot to compile its binaries but it 
extends buildroot by a sandbox mechanism. Before installing binaries to 
staging and target dirs all packages are installed into a package-
specific sandbox directory first, in this directory all linked libraries 
of the package binaries are detected and checked whether they are part of 
<pkg>_DEPENDENCIES, if not, the build fails.

The list of packages I talked about[2] was gathered that way, so there is 
no guarantee I caught all dependencies, the same is true for the method 
you described. Thats the reason I did not bother much about the missing 
celt051 detection by jack2.

Btw, fli4l uses the top-level parallel make option ;)

Regards, Bernd

[1] http://www.fli4l.de/en/home/whats-that-fli4l/
[2] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/139935
