From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Nov 2013 22:32:58 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no
 patch is found for a package
In-Reply-To: <20131105201752.GC17791@jack.whiskey>
References: <1383656430-29160-1-git-send-email-andi@etezian.org>
 <52793E3A.5060802@mind.be> <20131105201752.GC17791@jack.whiskey>
Message-ID: <527AB58A.9050506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/13 21:17, Andi Shyti wrote:
> Hi Arnout,
>
>>> If no patch is available for a specific package it doesn't mean
>>> that is necessarily an error, perhaps there is no need to apply
>>> any patches. Therefore, don't stop the build by returning '1',
>>> but go ahead.
>>
>>   This is in fact intentional, because it indicates that there is
>> something wrong with the configuration. When you specify in your
>> configuration that some specific patch directory should be used, but
>> that directory doesn't exist, then it probably means you made a
>> mistake in your configuration.
>>
>>   Can you give an example of a specific situation where you had a
>> problem with this check?
>
> this happens when for example you want to get as cross compiler
> the daily snapshot instead of a specific version.
>
> The build stops with an error because of that 'exit 1' since it
> doesn't find any gcc-20131105 patch directory (i think the
> snapshot is called so).

  That's a bug in the gcc package then :-)

  It should actually be converted to using the default patch strategy 
instead of post-patch hooks. Let me look into it...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
