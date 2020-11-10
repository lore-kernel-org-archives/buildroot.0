From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 23:19:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add optional systemd
 dependency
In-Reply-To: <20201110225028.259a7d76@gmx.net> (Peter Seiderer's message of
 "Tue, 10 Nov 2020 22:50:28 +0100")
References: <20201110090204.1581432-1-aperez@igalia.com>
 <20201110225028.259a7d76@gmx.net>
Message-ID: <87blg4onw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Adrian,
 > On Tue, 10 Nov 2020 11:02:04 +0200, Adrian Perez de Castro <aperez@igalia.com> wrote:

 >> WPE WebKit 2.30.0 added an USE_SYSTEMD buil option, which needs to
 >> be set to avoid CMake from trying to use systemd unconditionally.
 >> 
 >> Based on a similar patch for package/webkitgtk by Peter Seiderer.
 >> 
 >> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 >> ---
 >> package/wpewebkit/wpewebkit.mk | 7 +++++++
 >> 1 file changed, 7 insertions(+)
 >> 
 >> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
 >> index 6233505ca7..6f83775e96 100644
 >> --- a/package/wpewebkit/wpewebkit.mk
 >> +++ b/package/wpewebkit/wpewebkit.mk
 >> @@ -63,6 +63,13 @@ else
 >> WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 >> endif
 >> 
 >> +ifeq ($(BR2_INIT_SYSTEMD),y)
 >> +WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=ON
 >> +WPEWEBKIT_DEPENDENCIES += systemd
 >> +else
 >> +WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=OFF
 >> +endif
 >> +
 >> # JIT is not supported for MIPS r6, but the WebKit build system does not
 >> # have a check for these processors. The same goes for ARMv5 and ARMv6.
 >> # Disable JIT forcibly here and use the CLoop interpreter instead.

 > Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

 > Note: the status for this patch in patchwork is 'Superseded' [1] (by mistake?)...

I got confused with webkitgtk/wpewebkit and thought it was identical to
your patch, sorry.

-- 
Bye, Peter Korsgaard
