From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Sep 2014 10:13:40 +0100
Subject: [Buildroot] [PATCH 1/2] coreutils: Do not install uptime
In-Reply-To: <20140910224529.24ee19a4@free-electrons.com>
References: <1410359406-49326-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140910224529.24ee19a4@free-electrons.com>
Message-ID: <541167C4.8010905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/2014 09:45 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 10 Sep 2014 15:30:05 +0100, Vicente Olivert Riera wrote:
>> coreutils' uptime doesn't work and its execution fails with a message
>> like this one:
>>
>>    uptime: couldn't get boot time: No such file or directory
>>
>> busybox and procps-ng provide a working alternative.
>>
>> This is a common old problem as we can see here:
>>
>>    https://lists.openwrt.org/pipermail/openwrt-devel/2011-March/010006.html
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Reviewed-by: Markos.Chandras <Markos.Chandras@imgtec.com>
>> ---
>>   package/coreutils/coreutils.mk |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
>> index 07a1347..7457b79 100644
>> --- a/package/coreutils/coreutils.mk
>> +++ b/package/coreutils/coreutils.mk
>> @@ -61,7 +61,8 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>>   		PERL=missing
>>
>>   COREUTILS_CONF_OPT = --disable-rpath \
>> -		--enable-install-program=hostname
>> +		--enable-install-program=hostname \
>> +		--enable-no-install-program=uptime
>
> I think this is not the proper fix. A more appropriate fix is to
> actually get uptime to work, which is a oneliner. See my patch posted
> at http://patchwork.ozlabs.org/patch/387971/.

I have tested it and it works fine.

> I'll mark your patch as Rejected in patchwork. Of course, if you
> disagree, feel free to turn back your patch to the "New" state with an
> explanation.

I don't disagree. I also think it's better to have a working coreutils' 
uptime instead of disabling it.

> Thanks a lot for noticing this issue in the first place!

You are welcome.

> Thomas

-- 
Vincent
