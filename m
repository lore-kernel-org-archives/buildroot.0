From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 09:28:52 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
In-Reply-To: <20171218220344.GC2903@scaer>
References: <20171218084303.12472-1-thomas.petazzoni@free-electrons.com>
 <20171218220344.GC2903@scaer>
Message-ID: <20171219092852.4930a601@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 23:03:44 +0100, Yann E. MORIN wrote:

> Can't we simply fix those two files to not have that unusual indentation
> in the first place?
> 
> AFAICS, that special indentation is about the 'source' lines... Surely
> that does not bring much to have them indented, and they could simply be
> left-aligned...

package/Config.in is also indented in the same way, and there's a
reason: when you do a diff, diff will tell you in which section the
change is. For example, if I do a change in the middle of "Audio and
video applications", I get:

diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..dbcf53d1ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -31,7 +31,7 @@ menu "Audio and video applications"
        source "package/mimic/Config.in"
        source "package/miraclecast/Config.in"
        source "package/mjpegtools/Config.in"
-       source "package/modplugtools/Config.in"
+       source "package/foomodplugtools/Config.in"
        source "package/motion/Config.in"
        source "package/mpd/Config.in"
        source "package/mpd-mpc/Config.in"

See the @@ menu "Audio and video applications" ? You wouldn't get this
without the indentation.

So the indentation does serve a purpose, and has been intentionally
added, at least to package/Config.in. I think the same
reason/motivation applies to package/kodi/Config.in and
package/x11r7/Config.in.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
