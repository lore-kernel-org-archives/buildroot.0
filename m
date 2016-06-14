From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 14 Jun 2016 12:23:44 +1000
Subject: [Buildroot] Cross-compiling gobject-introspection
Message-ID: <20160614022344.GA2656@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot people,

Just for fun(*) I've been attempting to cross-compile a package called
gobject-introspection under buildroot, as it would be nice if buildroot
included some packages that depend on it. (It seems to be used to automatically
build cross-language bindings but it does it in a way that's hard to cross
compile as it requires dynamically loading or executing target binaries at
build time.) It's used by a few packages already in buildroot but it's
optional and always disabled (by always configuring them with
--disable-introspection).

I ended up having to patch gobject-introspection slightly and shim qemu-host
(conveniently already provided by buildroot) into the build process (!) but it
did eventually seem to work and I can now build target packages that use it
(without modification to their build steps). I can successfully remove
"--disable-introspection" from (at least some) existing buildroot packages
(e.g. python-gobject).

There are some loose ends but the patches aren't *that* terrible, although
there is no escaping the fact that it would require qemu-host, which seems
rather heavyweight (or maybe just a bad idea for some reason I haven't thought
of).

I was wondering, if this were cleaned up, would it belong in buildroot or is it
just too much of a hack? (Just specifying the dependencies correctly does seem
to work, but as a user I would be surprised by qemu being dragged in due to a
target package!)

Cheers,
Sam.

(*) Not really.
