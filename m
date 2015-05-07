From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 07 May 2015 13:13:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openpowerlink2: new package
In-Reply-To: <5544E4E6.3000100@mind.be>
References: <1430494560-5196-1-git-send-email-romain.naour@openwide.fr>
 <5544E4E6.3000100@mind.be>
Message-ID: <554B48F5.5080600@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I'm working on the v2 but I have an issue when all sub-package are in package/.

When I use $(OPENPOWERLINK2_VERSION) to share the same version, it is empty:
OPENPOWERLINK2_KERNEL_DRIVERS_VERSION = $(OPENPOWERLINK2_VERSION)

I think it's due to "include $(sort $(wildcard package/*/*.mk))" in the
Buildroot's main Makefile.

So I moved again to openpowerlink2/ package directory and add this line at the
end of openpowerlink2.mk:

include $(wildcard package/openpowerlink2/*/*.mk)

So, when we want to share the same variable to several packages, all *.mk of
these packages needs to be included in a specific order.

Actually, I'm using the efl packaging as a reference.

I uploaded my working branch on github:
https://github.com/RomainNaour/buildroot/tree/eplv2

What do you think ?

Best regards,
Romain
