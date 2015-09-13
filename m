From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 13 Sep 2015 14:59:27 +0200
Subject: [Buildroot] [PATCH] perl: fix static build
In-Reply-To: <20150913123517.07275fa0@free-electrons.com>
References: <1442139982-29309-1-git-send-email-francois.perrad@gadz.org>
 <20150913123517.07275fa0@free-electrons.com>
Message-ID: <CAB0FRssTPKS=H_c+zJBJfndNheJ3ODDt2duzodwXCpSLR_YWqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-09-13 12:35 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> Thanks for this fix. See some comments below.
>
> On Sun, 13 Sep 2015 12:26:22 +0200, Francois Perrad wrote:
>> see http://autobuild.buildroot.net/results/502/502e6a6280451acc48e5f500e774b2bd04c7229e/
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl/0001-hack-EUMM.patch | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 package/perl/0001-hack-EUMM.patch
>>
>> diff --git a/package/perl/0001-hack-EUMM.patch b/package/perl/0001-hack-EUMM.patch
>> new file mode 100644
>> index 0000000..3d54f47
>> --- /dev/null
>> +++ b/package/perl/0001-hack-EUMM.patch
>> @@ -0,0 +1,20 @@
>> +hack EUMM 7.04_01 which comes with Perl 5.22.0
>> +
>> +with static lib build, we cannot call _find_magic_vstring(),
>> +which does a `require B;` and B is not a pure Perl module.
>> +
>
> You should add your SoB line inside the patch as well.
>
> Also, do you think this patch can be accepted upstream?
>

I've improved the patch for V2.
No, I think that it will be accepted upstream, first in perl-cross and
after in perl.

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
