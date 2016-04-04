From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 01:01:32 +0200
Subject: [Buildroot] [PATCH v4 5/7] barebox: extract package name
	argument
In-Reply-To: <1458513351-6556-6-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-6-git-send-email-pieter@boesman.nl>
Message-ID: <5702F24C.7020209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 23:35, Pieter Smith wrote:
> No functional changes: Extracts an argument to the inner-barebox-package
> function to automatically determine the uppercase package name. This is needed
> to support a 2nd config build. This results in the following renaming:
>    'BAREBOX' -> '$(1)'
>
> All barebox packages are meant to be built from the same sources, so related
> KConfig variables (origin, version and patch directory) are not extracted.

  The first paragraph of the commit message makes it sound as if all BAREBOX 
instances are replaced with $(1), which is not true (as clarified by the second 
paragraph). But I don't see how to formulate it better, so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
