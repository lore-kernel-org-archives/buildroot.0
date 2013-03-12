From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 23:04:04 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
	'manual-update-lists'
In-Reply-To: <20130312085945.7d595fb2@skate>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
 <20130312085945.7d595fb2@skate>
Message-ID: <513FA654.5020401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 08:59, Thomas Petazzoni wrote:
> Dear Samuel Martin,
>
> On Tue, 12 Mar 2013 05:47:15 +0100, Samuel Martin wrote:
>
>> +manual-update-lists:
>> +	@$(call MESSAGE,"Updating the manual lists...")
>> +	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) \
>> +		$(TOPDIR)/support/scripts/gen-manual-lists.py
>
> Sorry if this has been discussed before. Why don't we make this part of
> the normal manual build process (make manual-pdf, make manual-html,
> etc.), so that we don't have to version control the generated lists of
> packages, and this updating of the lists is done automatically whenever
> we generate the manual?

  Originally, the generated list was still modified manually. But I don't 
think that is needed anymore, so indeed I would do it automatically as 
part of the 'make manual' step.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
