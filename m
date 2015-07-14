From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:53:28 +0200
Subject: [Buildroot] [PATCH 1/5] packages: use backtick instead of
 $(shell ...) make function
In-Reply-To: <1436711730-20599-1-git-send-email-arnout@mind.be>
References: <1436711730-20599-1-git-send-email-arnout@mind.be>
Message-ID: <20150715005328.7c9c6117@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 12 Jul 2015 16:35:26 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> It is often difficult to know exactly when make will expand the
> variable, and usually it can only be expanded after the dependencies
> have been built (e.g. pkg-config or the .pc file). Using a backtick
> instead makes it very clear that it will be expanded only while
> executing the command.
> 
> This change is useful for two cases:
> 
> 1. The per-package staging (and host) directory will be created as part
>    of the configure step, so any $(shell ...) variable that is used in
>    the configure step will fail because the directory doesn't exist
>    yet.
> 
> 2. 'make printvars' evaluates the variables it prints. It will therefore
>    trigger a lot of errors from missing .pc files and others. The
>    backticks, on the other hand, are not expanded, so with this change
>    the output of 'make printvars' becomes clean again.

I've applied the entire series. For the last patch, I had to adapt it
due to the change from system/system.mk to
package/skeleton/skeleton.mk. It seems to work fine from the quick
tests I've done, but doing an additional review of what I committed
would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
