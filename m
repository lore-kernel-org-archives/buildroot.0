From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Oct 2017 18:18:32 +0200
Subject: [Buildroot] [PATCH] Create 'make <pkt>-show-rrdepends' command
In-Reply-To: <1507033962-5566-1-git-send-email-casantos@datacom.ind.br>
References: <1493305458-15309-1-git-send-email-george.redivo@datacom.ind.br>
 <1507033962-5566-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <63a3e218-f37c-649b-fc48-0e9c0a892a10@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-10-17 14:32, Carlos Santos wrote:
> From: George Redivo <george.redivo@datacom.ind.br>
> 
> Hello,
> 
> Looks like this https://patchwork.ozlabs.org/patch/756075/ was accepted by
> Arnout but was left behind. Could we have it applied, please?

 I didn't exactly "accept" this patch. I thought the implementation was
acceptable, but I wasn't entirely sure the use case was important enough to
warrant the additional complexity.

 If I understand the use case correctly, what you want is that you have changed
something in package A, so you want to rebuild package A and all its recursive
dependencies. For that, a recursive dirclean is probably more appropriate:

$(1)-dirclean-recursive: $(1)-dirclean $$(patsubst
%,%-dirclean-recursive,$$($(2)_FINAL_ALL_DEPENDENCIES))


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
