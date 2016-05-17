From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 00:28:07 +0200
Subject: [Buildroot] [PATCH 7/9] toolchain: remove eglibc support
In-Reply-To: <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <85f0bbfe-6fa1-ad89-21b4-88d1b9c7c9c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 00:13, Thomas Petazzoni wrote:
> The eglibc support has been marked deprecated since 2015.08, so it's
> time to remove it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  It's probably a good idea to do a "sed 's/(e)glibc/glibc/' as well. Even 
though we still have Linaro and possibly custom external toolchains with eglibc, 
I don't think it makes much sense anymore to make that distinction explicit.

  The glibc.hash file wasn't updated.

  There are also still some references to eglibc in the manual, these should 
probably be removed.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
