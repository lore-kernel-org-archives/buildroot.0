From: Erik Andersen <andersen@codepoet.org>
Date: Mon Jul 24 11:12:56 2006
Subject: [Buildroot] problems and solutions for tinyx
In-Reply-To: <44C4AD92.7000205@tiscali.de>
References: <44C4AD92.7000205@tiscali.de>
Message-ID: <20060724181217.GB22730@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Jul 24, 2006 at 01:22:58PM +0200, Biucchi Gabriele wrote:
> I want only to point out some problems I had with tinyx and the 
> solutions that work with me: I hope, this can help somebody.
> 
> 1) change in tinyx-config.patch
> 
> tinyx-config.patch starts with:
> 
> --- xc/config/cf/host.def~ 2005-04-02 14:51:31.000000000 -0700
> +++ xc/config/cf/host.def 2005-04-26 01:22:00.000000000 -0600
> 
> but I think it should be:
> 
> --- xc-011010/config/cf/host.def~ 2005-04-02 14:51:31.000000000 -0700
> +++ xc-011010/config/cf/host.def 2005-04-26 01:22:00.000000000 -0600

Patches are applied using 'patch -p1' so regardless of what the
leading path is, it should be getting stripped.  Are you actually
seeing a problem with this patch being applied?

> 2) change in tinyx.mk
> 
> Some programs (like rxvt) need x-includes and x-libraries in 
> $(STAGING_DIR)/usr/X11R6/ , but tinyx.mk does not install anything there.
> 
> A naif solution consists to copy everything from $(TINYX_DIR)/exports/ 
> into $(STAGING_DIR)/usr/X11R6/

This certainly seems to be Right Thing to do here.

> 3) another change in tinyx.mk
> 
> The $PATH variable includes "/usr/bin/X11", but there is nothing there. 
> A solution is to create a symbolic link between "/usr/bin/X11" and 
> "/usr/X11R6/bin", putting in the tinyx.mk the line
> 
> ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11

That seems best.  Any chance you could make these changes and
submit a patch implementing them.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
