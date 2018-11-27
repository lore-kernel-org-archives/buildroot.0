From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2018 17:54:18 +0100
Subject: [Buildroot] [PATCH] perl-time-hires: remove it
In-Reply-To: <20181123090742.68155c7c@windsurf>
References: <20181122182215.17910-1-francois.perrad@gadz.org>
 <20181123090742.68155c7c@windsurf>
Message-ID: <68d8e298-7309-c2b0-4002-0d1a4581b3e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/11/2018 09:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 22 Nov 2018 19:22:15 +0100, Francois Perrad wrote:
>> this is a core module (ie. included in the Perl distribution)
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  DEVELOPERS                                   |  1 -
>>  package/Config.in                            |  1 -
>>  package/perl-time-hires/Config.in            | 10 ----------
>>  package/perl-time-hires/perl-time-hires.hash |  6 ------
>>  package/perl-time-hires/perl-time-hires.mk   | 14 --------------
>>  5 files changed, 32 deletions(-)
>>  delete mode 100644 package/perl-time-hires/Config.in
>>  delete mode 100644 package/perl-time-hires/perl-time-hires.hash
>>  delete mode 100644 package/perl-time-hires/perl-time-hires.mk
> 
> We need Config.in.legacy handling when removing packages/options.

 No we don't. Config.in.legacy handling is there to make sure that the user
after upgrading Buildroot still has everything that she had enabled before. In
this case, the Time::HiRes module *is* there because it is part of perl. So no
legacy handling needed.

 Regards,
 Arnout
