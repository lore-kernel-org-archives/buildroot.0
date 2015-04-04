From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 04 Apr 2015 10:33:36 -0300
Subject: [Buildroot] [PATCH 0/3] The big webkitgtk bump
In-Reply-To: <1428153932-15069-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428153932-15069-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <551FE830.8050505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/2015 10:25 AM, Gustavo Zacarias wrote:

Well, some typos and omissions... ;)

> Wayland support wasn't enabled because it still needs gtk2 (plugins) -
> this could possibly be patched away.

...which would pull in xorg7 and negate any size savings wayland gives.

> Multimedia support is automatic via detection of gst1-plugins-good,
> ideally this should be an option but right now opencv+gst generate a
> dependency loop if gstreamer1 is selected. Also codecs will need to be
> catered by the user via the appropiate gst selects.

s/gst1-plugins-good/gst1-plugins-base/

> Possible TODOs:
> Wayland in a proper way, granite support, gcr support, more arch
> testing/support.

Most of the tests were for the ARM vexpress target, to excercise the JIT
a bit, though v5 behaved as well (in qemu it doesn't make much
difference between JIT vs. non-JIT, they're both turtle slow).
Also most of the tests i went for the gtk3 GUI, for it to look good just
add some basic font (liberation) and icons (adwaita) otherwise things
will look somewhat broken/bad.
Regards.
