From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 02 Oct 2009 13:28:42 +0200
Subject: [Buildroot] [PATCH] directfb: add host-directfb target for
 directfb-csource
In-Reply-To: <87iqey6o89.fsf@macbook.be.48ers.dk>
References: <1254481869-3415-1-git-send-email-s.neumann@raumfeld.com>
	<87iqey6o89.fsf@macbook.be.48ers.dk>
Message-ID: <1254482922.3924.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-10-02 at 13:15 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> directfb-csource is a code generation tool that may be needed to build
>  Sven> other packages. Add host-directfb target that installs directfb-csource
>  Sven> in the host_dir.
> 
> What exactly needs this? I prefer to not add unused stuff. Could we wait
> until there's an actual use for this?

directfb-csource is very similar to gdk-pixbuf-csource. It creates
header files from images so that they can easily be embedded into the
binary. I do make use of this in one of our packages. At some point I
even plan to release this code under the LGPL, but for now its closed. 

Of course I would prefer if the change could be upstream in buildroot,
but if you don't want to add it, then we can maintain it in our branch.
 
>  Sven> +$(STAMP_DIR)/host_directfb_installed: $(STAMP_DIR)/host_directfb_compiled
>  Sven> +	$(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin
> 
> Is directfb-csource the only thing we could ever imagine other packages
> needing? What about the headers/libs for some other host tool?

The other tools are actually useful on the target, but not likely useful
on the host. directfb-csource is the only code-generation tool in there.


Sven
