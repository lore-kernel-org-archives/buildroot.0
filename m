From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2018 14:59:45 +0100
Subject: [Buildroot] [PATCH 2/2] linux: Make dtc install step more
 reliable
In-Reply-To: <1ea7068f-6be1-9a09-e2ff-50ca406be783@andin.de>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-3-anaumann@ultratronik.de>
 <6a53c610-705f-41c6-5675-a514c61acb8d@mind.be>
 <1ea7068f-6be1-9a09-e2ff-50ca406be783@andin.de>
Message-ID: <01e22482-f6c7-f3d5-56d9-b390952f651f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 13:55, Andreas Naumann wrote:
> Hi,
> 
> Am 09.11.18 um 23:14 schrieb Arnout Vandecappelle:
>>
>>
>> On 08/11/2018 14:04, Andreas Naumann wrote:
> ...
>>> -??????? if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
>>> +??????? if [ "$(BR2_PACKAGE_HOST_DTC)" != "y" ]; then \
>>> ????????????? ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
>>> ????????? fi \
>>
>> ? Since now it's purely steered by a make variable, you can change it into
>>
>> ????????? $(if $(BR2_PACKAGE_HOST_DTC),ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \
> 
> Thanks. I'll resend v2.

 Please test as well. I have a good track record of proposing broken code :-)

 Regards,
 Arnout

[snip]
