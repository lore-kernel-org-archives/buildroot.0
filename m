From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 14:28:40 -0800
Subject: [Buildroot] [git commit branch/next] package: add gd package
In-Reply-To: <50B68BB3.9090503@mind.be> (Arnout Vandecappelle's message of
 "Wed, 28 Nov 2012 23:09:55 +0100")
References: <20121128011244.B677B8F461@busybox.osuosl.org>
 <50B68BB3.9090503@mind.be>
Message-ID: <87k3t5xsyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 27/11/12 20:21, Peter Korsgaard wrote:
 Arnout> [snip]
 >> +# configure.ac has newer timestamp than aclocal.m4 / configure, so we need
 >> +# to autoreconf to regenerate them (or set configure.ac timestamp to older
 >> +# than them) to make the Makefile happy.
 >> +# configure.ac refers to AM_ICONV which we only have if gettext is enabled,
 >> +# so add a dummy definition elsewise
 >> +define GD_FIXUP_ICONV
 >> +	echo 'm4_ifndef([AM_ICONV],[m4_define([AM_ICONV],[:])])' \
 >> +		>>  $(@D)/acinclude.m4
 >> +endef
 >> +
 >> +GD_PRE_CONFIGURE_HOOKS += GD_FIXUP_ICONV

 Arnout>  Is there any reason why this is a pre-configure hook instead of a
 Arnout> post-patch hook?

 Arnout>  The reason I ask is because I am thinking about putting the
 Arnout> _patched_ source in the tarballs created by legal-info.  That
 Arnout> would imply doing a <pkg>-dirclean followed by a <pkg>-patch,
 Arnout> but if there is any patching that is done in one of the later
 Arnout> steps, it will be missed.

No, it is completely arbitrary. I just selected pre-configure as it was
related to the configure step, but post-patch would have been just as
good.

-- 
Bye, Peter Korsgaard
