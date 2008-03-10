From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 17:24:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  package
In-Reply-To: <20080310152243.544A212C5F4@busybox.net> (ninevoltz@uclibc.org's
	message of "Mon\, 10 Mar 2008 08\:22\:43 -0700 \(PDT\)")
References: <20080310152243.544A212C5F4@busybox.net>
Message-ID: <877iga5yy6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-10 08:22:43 -0700 (Mon, 10 Mar 2008)
 ninevoltz> New Revision: 21282

 ninevoltz> Log:
 ninevoltz> added dev files in target option

Great! A few minor points though:
 
 ninevoltz> +config BR2_TARGET_DEV_FILES
 ninevoltz> +	bool "Development files in target filesystem"

What about calling int BR2_HAVE_DEVFILES to match the info/make
configs just above? Also remember to not use upper case in the bool
description (E.G. bool "development files in .. ")

 ninevoltz> +else
 ninevoltz> +	rm -rf $(TARGET_DIR)/usr/include
 ninevoltz> +	find $(TARGET_DIR)/usr/lib -name '*.a' -delete

Not that I really care, but is -delete supported by non-GNU find?

-- 
Bye, Peter Korsgaard
