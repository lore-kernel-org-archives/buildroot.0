From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:18:43 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/tiff: Rework tiff utilities
 handling
In-Reply-To: <XnsA485ECD1F6D76berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1429816903-2484-1-git-send-email-bernd.kuhls@t-online.de>
 <55396033.1000003@mind.be>
 <XnsA485ECD1F6D76berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <553961B3.8020802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 23:16, Bernd Kuhls wrote:
> [posted and mailed]
> 
> Arnout Vandecappelle <arnout@mind.be> wrote in 
> news:55396033.1000003 at mind.be:
> 
>>  Okay, so here's the wild idea:
>>
>> TIFF_SUBDIRS = port libtiff
>> ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
>> TIFF_SUBDIRS += tools
>> endif
>>
>> TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
>>
>>  Build test seems to work, I'll resubmit so tell me what you think.
> 
> Hi Arnout,
> 
> lgtm.

 Note that I didn't do a runtime test (for missing libraries), so YMMV.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
