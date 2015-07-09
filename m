From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Jul 2015 23:30:14 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <559EE7E6.401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 12:00, Alexey Brodkin wrote:
> Even though ARC gcc understands "-pie" option and attempts to generate
> PIE binaries as of today PIE is not really supported for user-space
> applications.

 Wouldn't it be better then if we would patch gcc to remove the -pie option?
That removes all these special cases in one fell swoop, and is much easier to
un-disable once PIE _is_ supported for ARC gcc.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
