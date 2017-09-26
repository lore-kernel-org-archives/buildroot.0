From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 21:29:16 +0200
Subject: [Buildroot] [PATCH] flex: fix segfaults on glibc-2.26
In-Reply-To: <20170926123924.GA9085@latitude.localdomain>
References: <20170926123924.GA9085@latitude.localdomain>
Message-ID: <37665b00-e7c5-330a-0d29-c0c27499737b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-09-17 14:39, Alex Suykov wrote:
> Version 2.26 of glibc no longer exports prototype for reallocarray
> unless _GNU_SOURCE is defined. With no prototype, gcc assumes int
> return type and truncates the pointer to 32bit on 64bit systems.
> 
> This shows up as segfault in stage1flex while building host-flex
> on glibc-2.26 based 64-bit host systems.
> 
> The patch is taken as is from LEDE-project:
> https://github.com/lede-project/source/commit/0fb14a2b1ab2f82ce63f4437b062229d73d90516
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

 This is essentially http://patchwork.ozlabs.org/patch/813474/ but with the
reference to LEDE and without the fix of the documentation patch. Could you
merge the two versions?

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
