From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 18:50:46 +0100
Subject: [Buildroot] [PATCH v3 24/24] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <1477925833-27204-25-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
 <1477925833-27204-25-git-send-email-romain.naour@gmail.com>
Message-ID: <be5404f4-1bca-c263-17b9-25039475d157@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-10-16 15:57, Romain Naour wrote:
> -# Some toolchain vendors have a regular file naming pattern.
> -# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
> -ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
> -TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
> -	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
> -endif

 I didn't notice earlier, but this bit seems to have gotten lost. Forgot to test
legal-info?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
