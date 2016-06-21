From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Jun 2016 17:02:19 +0100
Subject: [Buildroot] [git commit] efivar: new package
In-Reply-To: <20160621175128.2db7e559@free-electrons.com>
References: <20160612140155.BE24D8041E@busybox.osuosl.org>
 <57696022.2060308@imgtec.com> <20160621175128.2db7e559@free-electrons.com>
Message-ID: <5769650B.6080604@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/16 16:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Jun 2016 16:41:22 +0100, Vicente Olivert Riera wrote:
> 
>>> +comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
>>> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
>>> +		!BR2_TOOLCHAIN_USES_GLIBC  
>>
>> shouldn't be
>>
>> comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
>> 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
>> 		BR2_TOOLCHAIN_USES_GLIBC
>>
>> ...?
>>
>> The package is only compatible with glibc, so it depends on it. The
>> comment should depend on it as well.
> 
> No, we precisely want to display the comment when the user is *NOT*
> using glibc, to inform him that the package is not available because he
> is not using glibc.

<facepalm>

of course, sorry for the noise.

Regards,

Vincent.

> Thomas
> 
