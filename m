From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Oct 2009 13:15:34 +0200
Subject: [Buildroot] [PATCH] directfb: add host-directfb target for
	directfb-csource
In-Reply-To: <1254481869-3415-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Fri\, 2 Oct 2009 13\:11\:09 +0200")
References: <1254481869-3415-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87iqey6o89.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> directfb-csource is a code generation tool that may be needed to build
 Sven> other packages. Add host-directfb target that installs directfb-csource
 Sven> in the host_dir.

What exactly needs this? I prefer to not add unused stuff. Could we wait
until there's an actual use for this?

 Sven> +$(STAMP_DIR)/host_directfb_installed: $(STAMP_DIR)/host_directfb_compiled
 Sven> +	$(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin

Is directfb-csource the only thing we could ever imagine other packages
needing? What about the headers/libs for some other host tool?

-- 
Bye, Peter Korsgaard
