From: Andreas Naumann <dev@andin.de>
Date: Mon, 12 Nov 2018 13:55:06 +0100
Subject: [Buildroot] [PATCH 2/2] linux: Make dtc install step more
 reliable
In-Reply-To: <6a53c610-705f-41c6-5675-a514c61acb8d@mind.be>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-3-anaumann@ultratronik.de>
 <6a53c610-705f-41c6-5675-a514c61acb8d@mind.be>
Message-ID: <1ea7068f-6be1-9a09-e2ff-50ca406be783@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 09.11.18 um 23:14 schrieb Arnout Vandecappelle:
> 
> 
> On 08/11/2018 14:04, Andreas Naumann wrote:
...
>> -		if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
>> +		if [ "$(BR2_PACKAGE_HOST_DTC)" != "y" ]; then \
>>   			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
>>   		fi \
> 
>   Since now it's purely steered by a make variable, you can change it into
> 
>   		$(if $(BR2_PACKAGE_HOST_DTC),ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \

Thanks. I'll resend v2.


best regards,
Andi

> 
> 
> (note that the semicolon is still needed because it's in the CONFIG_DTC condition).
> 
>   Regards,
>   Arnout
> 
> 
>>   	fi
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
