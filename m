From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 17:01:19 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <50CF3F4D.1030100@mind.be> (Arnout Vandecappelle's message of
 "Mon, 17 Dec 2012 16:50:37 +0100")
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be>
Message-ID: <871ueo8y7k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
 >> +IMX_LIB_INCLUDE = \
 >> +	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
 >> +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
 >> +	-I$(LINUX_DIR)/include

 Arnout>  Actually, I wonder if this is the right thing to do... This is a
 Arnout> userspace library that requires a platform-specific linux/xxx.h. For
 Arnout> an external toolchain, these headers don't exist in
 Arnout> $(STAGING_DIR)/usr/include/linux

 Arnout>  Directly using $(LINUX_DIR)/include means that the headers are not
 Arnout> patched for userspace. For those platform-specific headers that's
 Arnout> probably not a problem, but it's not good for e.g. linux/types.h.

 Arnout>  An easy workaround is to use -idirafter instead of -I.  However,
 Arnout> perhaps it's an even better idea to do 'make headers_install' as part
 Arnout> of the normal linux build process, so that packages depending on those
 Arnout> headers can use the patched version. But then again, is it a good idea
 Arnout> to replace the toolchain's kernel headers with a new set of kernel
 Arnout> headers?

Another possibility is to bundle the needed kernel headers with the
package, similar to how E.G. mtd-utils does it.

-- 
Bye, Peter Korsgaard
