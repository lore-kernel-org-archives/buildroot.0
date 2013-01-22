From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jan 2013 10:48:31 +0100
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <CAKcgs2wHrHVgTQYxjwRE4dY7OmjCR6iM_c2mZYFky-J1GUZLdA@mail.gmail.com>
 (Gilles Talis's message of "Mon, 21 Jan 2013 15:45:39 -0800")
References: <1358374472-11291-1-git-send-email-gilles.talis@gmail.com>
 <871udfd158.fsf@dell.be.48ers.dk>
 <CAKcgs2wHrHVgTQYxjwRE4dY7OmjCR6iM_c2mZYFky-J1GUZLdA@mail.gmail.com>
Message-ID: <87d2wx5z0w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

Hi,

 >> ?gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 >> ?gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 >> 
 >> Same here. You don't depend on host-pkgconf, so it presumably doesn't
 >> use that to figure out availability of jpeg/tiff.

 Gilles> Same here. I can force the paths to JPEG and TIFF include and
 Gilles> lib to always point to staging dir. Was my first intention, but
 Gilles> it seemed to work out fine without doing that. Do you think it
 Gilles> would be preferrable to force these paths?

I'm concerned it will fail if you build for the same architecture as
your host (E.G. for a PC), haven't enabled png/tiff/jpeg in buildroot
but DO have the development libraries installed on the host.

I'll give it a test later today.

-- 
Bye, Peter Korsgaard
