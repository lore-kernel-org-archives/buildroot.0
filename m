From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Sep 2016 20:50:42 +0200
Subject: [Buildroot] [PATCH 2/2] boot/uboot: allow to build multiple
 Uboot images
In-Reply-To: <55176e40-50e5-92d9-143d-59f9831a0dbe@jikos.cz>
References: <1472741494-7043-1-git-send-email-brain@jikos.cz>
 <1472741494-7043-3-git-send-email-brain@jikos.cz>
 <119af87d-057f-12fd-8622-f030d3bda886@mind.be>
 <55176e40-50e5-92d9-143d-59f9831a0dbe@jikos.cz>
Message-ID: <50b21046-39f2-4f6a-6927-c8322bed1456@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-09-16 12:53, Petr Kulhavy wrote:
> Here I'm actually wondering why the UBOOT_MAKE_TARGET was not set.
> I just transformed the kind of "switch" into independent ifs.
> Shouldn't the UBOOT_MAKE_TARGET be set for all types?

 I believe that originally, there was no UBOOT_MAKE_TARGET, so we'd just run the
default target. But when u-boot.kwb was added in 3cd517, it became necessary to
pass that target. In all other cases, however, UBOOT_MAKE_TARGET (or
U_BOOT_MAKE_OPT as it was called back then) would be empty so we would still
call the default target.

 We should probably check if that still works when 'all' is added unconditionally.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
