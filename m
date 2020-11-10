From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 10:35:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/xen: add slirp dependency for
 tools
In-Reply-To: <20201107185256.1175545-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Nov 2020 19:52:56 +0100")
References: <20201107185256.1175545-1-fontaine.fabrice@gmail.com>
 <20201107185256.1175545-2-fontaine.fabrice@gmail.com>
Message-ID: <875z6dpn9c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of xen tools fails if slirp is built before xen because xen is not
 > compatible with spice slirp which does not provide libslirp.h:

 > /home/buildroot/autobuild/instance-2/output-1/build/xen-4.13.0/tools/qemu-xen/net/slirp.c:40:10: fatal error: libslirp.h: No such file or directory
 >  #include <libslirp.h>
 >           ^~~~~~~~~~~~

 > Indeed, xen prefers a system-provided slirp over its internal one

 > So add slirp as a mandatory dependency (now that we switched to the up
 > to date https://gitlab.freedesktop.org/slirp/libslirp)

 > This build failure is raised since, at least, version 4.13.0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b80b33ed558518f7bbb0a3c8586bf2d0b8acc36f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
