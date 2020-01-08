From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:35:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/bustle: select dbus instead of
 depending on it
In-Reply-To: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
References: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
Message-ID: <20200108093544.3288c09d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 19:45:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I agree that in general we prefer to use "select" for non-obvious
dependencies. But here, the dependency is obvious, and in fact "bustle"
is completely useless if you don't use D-Bus: you will only want to
even consider enabling bustle if you're already using D-Bus, and want
to debug some stuff.

So I think it is a case where a "depends on" dependency makes a lot of
sense, very much like Python modules all "depends on" the Python
interpreter being present, rather than selecting it.

So I've mark the patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
