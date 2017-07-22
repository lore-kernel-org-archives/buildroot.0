From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 00:38:31 +0200
Subject: [Buildroot] [PATCH 11/20] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <6929bbc3-48c2-4041-a1bb-2e3602c92e4a@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <ca1a0fdf264669754c3c4aa669e162beea5441fa.1500398733.git.yann.morin.1998@free.fr>
 <6929bbc3-48c2-4041-a1bb-2e3602c92e4a@mind.be>
Message-ID: <bcfcf21a-b459-1dea-ea89-fcad5ac82283@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 On second thought...

On 23-07-17 00:31, Arnout Vandecappelle wrote:
>> +define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
>> +	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
>> +	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))

 In skeleton-common, we also have:

	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include

Shouldn't we do that here as well?

 Regards,
 Arnout

>> +endef

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
