From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 28 Oct 2019 23:04:34 +0100
Subject: [Buildroot] [PATCH] package/systemd: fix sha256 for README
In-Reply-To: <20191028211524.GB2892@scaer>
References: <20191028074847.29836-1-offougajoris@gmail.com>
 <20191028211524.GB2892@scaer>
Message-ID: <9bca7f8e-52ed-98b4-72c4-a264c631c1f1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 28/10/2019 ? 22:15, Yann E. MORIN a ?crit?:
> Joris, All,
Hi Yann
>
> On 2019-10-28 08:48 +0100, Joris Offouga spake thusly:
>> Fix http://autobuild.buildroot.net/results/4878af2ed318925ab530062576f91e7a1af47bd5
> I think you got it backwards n that build failure: it states that
> Buildroot exoected to find the d9356 hash, but the README really had the
> 3a3b3 hash.
>
> That failure occured on commit 2d991821ad, but the hash file has been
> fixed since then, in commit f81b26ec52.

Sorry for the patch indeed it's already fixed I looked at the build 
error but not the commit tree.

Best Regards,

Joris OFFOUGA.

>
>> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
>> ---
>>   package/systemd/systemd.hash | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
>> index 2f2c11089c..bc8edfcdba 100644
>> --- a/package/systemd/systemd.hash
>> +++ b/package/systemd/systemd.hash
>> @@ -2,4 +2,4 @@
>>   sha256	0611843c2407f8b125b1b7cb93533bdebd4ccf91c99dffa64ec61556a258c7d1  	systemd-243.tar.gz
>>   sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>>   sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
>> -sha256	3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf	README
>> +sha256	d9356b277440f21730426592c27170d034a39954ab5154dfba1cc3cbf7b22935	README
> This just reverts to the issue in fact. Did you really test that?
>      make legal-info
>
> Regards,
> Yann E. MORIN.
>
>> -- 
>> 2.17.1
>>
