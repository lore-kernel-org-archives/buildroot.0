From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Dec 2011 18:12:30 +0100
Subject: [Buildroot] [PATCH 1 of 3 v2] dependencies: add function
	suitable-host-package
In-Reply-To: <03cbc212567081a0d7bc.1322053784@devws108>
References: <patchbomb.1322053783@devws108>
 <03cbc212567081a0d7bc.1322053784@devws108>
Message-ID: <201112061812.30282.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 23 November 2011 14:59:50 Thomas De Schampheleire wrote:
> +# suitable-host-pkg: calls check-host-$(1).sh shell script, which
> +# should return the path to the suitable host tool, or nothing if no
> +# suitable tool was found.
> +define suitable-host-package
> +$(shell toolchain/dependencies/check-host-$(1).sh)
> +endef

 I should have noticed this in the first review, but:  If the function is
this simple, it becomes pointless.  Especially because other check-host-*
mk files may want to implement the checking in a different way, e.g.
$(eval $(shell ...)).

> +include toolchain/dependencies/check-host-*.mk

 And if this is the only thing remaining, perhaps it's better to merge
this patch with the next one :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111206/4d32f6c6/attachment.html>
