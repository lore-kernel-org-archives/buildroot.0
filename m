From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 23:52:58 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <20130514170721.622fc086@skate>
References: <50FACA8F.1040503@mind.be>
 <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <20130514170721.622fc086@skate>
Message-ID: <5192B23A.1050508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/05/13 17:07, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
>
> On Tue, 14 May 2013 16:30:50 +0200, J?r?me Pouiller wrote:
>
>> -$(BUILD_DIR)/.root:
>> +$(STAMP_DIR)/skeleton-target-installed:
>>   	mkdir -p $(TARGET_DIR)
>>   	rsync -a \
>>   		--exclude .empty --exclude .svn --exclude .git \
>>   		--exclude .hg --exclude=CVS --exclude '*~' \
>>   		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>>   	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>> +	mkdir -p $(STAMP_DIR)
>>   	touch $@
>
> I'm generally ok with the idea, but I don't like this mkdir. There is
> already a mkdir that creates the stamp file directory, in the main
> Makefile.

  I don't have an issue with a few redundant mkdir -p calls.

  I would like to see a $(Q) in front of it though - but then it should 
be in front of the rest as well, and with a $(MESSAGE) call.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
