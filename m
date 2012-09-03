From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Mon, 03 Sep 2012 23:12:36 +0300
Subject: [Buildroot] Bash string manipulation in Kconfig
In-Reply-To: <201209032207.47111.yann.morin.1998@free.fr>
References: <5044FD5F.102@petroprogram.com> <20120903210830.71b3372b@skate>
 <50450AD0.3060703@petroprogram.com>
 <201209032207.47111.yann.morin.1998@free.fr>
Message-ID: <50450F34.4090306@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.9.2012 23:07, Yann E. MORIN kirjoitti:
> Stefan, All,
>
> On Monday 03 September 2012 21:53:52 Stefan Fr?berg wrote:
>> 3.9.2012 22:08, Thomas Petazzoni kirjoitti:
>>> Le Mon, 03 Sep 2012 21:56:31 +0300,
>>> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>>>
>>>> But how to do similar in buildroot  .mk files ???
>>> 	$(notdir $(FOO))
>>>
>>> Thomas
>> One more question:
>>
>> Why does not the following work ?
>>
>> FULL_DOWNLOAD_URL=http://www.somedomain.com/blah/blah/somefile1
>> FULL_DOWNLOAD_URL+=http://www.somedomain2.com/blah2/blah2/blah/somefile2
>>
>> for i in $(FULL_DOWNLOAD_URL);do \
>>     echo $(notdir $$i) ; \
>> done
>>
>> I expect it to print:
>>
>> somefile1
>> somefile2
>>
>> But it prints instead:
>>
>> http://www.somedomain.com/blah/blah/somefile1
>> http://www.somedomain2.com/blah2/blah2/blah/somefile2
> That's because $(notdir ...) is onterpreted by make, while $i is
> interpreted by the shell.
>
> In your case, you'd want to use the shell constrcut:
>   for i in $(FULL_DOWNLOAD_URL);do \
>       echo $${i##*/} ; \
>   done
>
> Regards,
> Yann E. MORIN.
>
Ah... I see
Thanks Yann!
And Thanks Thomas!

These shell-make mixing is so confusing ....

Stefan
