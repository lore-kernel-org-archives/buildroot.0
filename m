From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 14:14:03 +0100
Subject: [Buildroot] [PATCH 1/3] lm-sensors: remove redundant
 BUILD_STATIC_LIB build parameter
In-Reply-To: <ae471095-2be7-3ccd-569d-b94e0f9a7e9b@gmail.com>
References: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
 <ae471095-2be7-3ccd-569d-b94e0f9a7e9b@gmail.com>
Message-ID: <20181227141403.077691b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 12:34:31 +0100, Romain Naour wrote:

> Le 27/12/2018 ? 11:13, Baruch Siach a ?crit?:
> > Commit 3e05efd76636 ("package/lm-sensors: disable static library for
> > shared-only build") added BUILD_STATIC_LIB to LM_SENSORS_MAKE_OPTS with
> > value that depends on BR2_SHARED_LIBS, but forgot to remove it from the
> > common LM_SENSORS_MAKE_OPTS. Fix that.  
> 
> IIRC, this patch was part of a series fixing packages that build a static
> library when BR2_SHARED_LIBS is set. I had a special hook checking if a package
> install a *.a file to STAGING_DIR.
> But this effort was stopped since there is some corner case where a .a file is
> needed:
> 
> http://lists.busybox.net/pipermail/buildroot/2015-January/116736.html

Are you pointing to the right e-mail? This e-mail is not at all saying
that there are some corner cases where a .a file is needed. All what I
was saying in this e-mail is: is it really worth patching / adding more
complexity to lots of packages just to make sure they don't
build/install a static library when BR2_SHARED_LIBS=y.

> But, we still have a case where a package A install a shared and a static
> library and a package B that depend on package A can choose to link against the
> shared or the static library.

I don't follow you here :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
