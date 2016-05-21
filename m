From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 May 2016 08:48:41 +0200
Subject: [Buildroot] package not found
In-Reply-To: <CAG7w3y=BmwXxz_8KVDEi95f56fu4v+YHU7PQQrn5pb4yZ15Hjg@mail.gmail.com>
References: <CAG7w3y=BmwXxz_8KVDEi95f56fu4v+YHU7PQQrn5pb4yZ15Hjg@mail.gmail.com>
Message-ID: <20160521084841.3a95cd3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 09:29:50 +0530, gdbabu Krishnan wrote:

>       1.libgtk3+

Search packages by running "/" in menuconfig, and then watch their
dependencies. You can also read package/libgtk3/Config.in to learn
about the dependencies of gtk3.

In essence, for Gtk3, you will need either X.org or Wayland, and also
an OpenGL implementation (which for Raspberry Pi is in the rpi-userland
package).

>       2.nano  text editor

Again, use "/" to find it. This one does not have any complicated
dependency like libgtk3, so you should find it easily.

>       3.gcc compiler

We don't support building a compiler for the target:
https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
