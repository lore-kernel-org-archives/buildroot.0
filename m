From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 17:35:30 +0100
Subject: [Buildroot] [PATCH] libglib2: improve dev file removal
In-Reply-To: <1457540712-19580-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457540712-19580-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160309173530.36363520@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed,  9 Mar 2016 13:25:12 -0300, Gustavo Zacarias wrote:
> * Remove /usr/share/glib-2.0 rmdir from DEV_FILES hook, if we are not
> using gdb the GDB_FILES hook will hit and remove it anway, and if we are
> indeed using gdb we need it.

Where is this done in your patch?

> * Remove glib-compile-resources and glib-compile-schemas binaries, these
> aren't used for runtime purposes.
> 
> * Remove /usr/share/glib-2.0/codegen and /usr/share/glib-2.0/schemas, as
> with the binaries these aren't used for runtime purposes either.

Those two are OK, of course.

> Size savings delta +800 KB.

Nice savings! I would have written -800KB though :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
