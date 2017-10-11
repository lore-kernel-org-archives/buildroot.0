From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 23:56:01 +0200
Subject: [Buildroot] [RFC 2/3] Makefile: add handling of software stacks
In-Reply-To: <1507668210-5427-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <1507668210-5427-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <2347ed43-0b6a-2368-5b2c-77a4b28ceac9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 22:43, Angelo Compagnucci wrote:
> +define percent_stack
> +%_stack: $(1)/stacks/%_stack
> +	$(TOPDIR)/support/kconfig/merge_config.sh -b -O $(BASE_DIR) $(BR2_CONFIG) $(1)/stacks/$$@
> +endef
> +$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_stack,$(d))$(sep)))

 I forgot to mention: there's a future problem here. When we finally enable
top-level parallel build, the different stacks are going to overwrite each other
when you call it as "make stack1 stack2 stack3".

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
