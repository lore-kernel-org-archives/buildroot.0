From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 22:42:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/mender: better default
 mender.config
In-Reply-To: <bc22f4e8-6547-5d9a-a50b-f60c42cf438c@mind.be>
References: <20190528134105.30572-1-deinok@deinok.com>
 <20190528134105.30572-2-deinok@deinok.com>
 <bc22f4e8-6547-5d9a-a50b-f60c42cf438c@mind.be>
Message-ID: <4c688d74-093a-dff4-20b4-f0baabb11465@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 20:28, Arnout Vandecappelle wrote:
>  Hi Raul,
> 
> On 28/05/2019 15:41, deinok at deinok.com wrote:
>> From: Raul Hidalgo Caballero <deinok@deinok.com>
>>
> 
>  Please give a better explanation than "better" :-). The summary line is OK, but
> the body of the commit message should specify why it is better. Even if the
> explanation is obvious, like I say below.
> 
>> Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
>> ---
>>  package/mender/mender.conf | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/mender/mender.conf b/package/mender/mender.conf
>> index 979f16aaf6..7eb9fb18b4 100644
>> --- a/package/mender/mender.conf
>> +++ b/package/mender/mender.conf
>> @@ -2,9 +2,9 @@
>>    "InventoryPollIntervalSeconds": 1800,
>>    "UpdatePollIntervalSeconds": 1800,
>>    "RetryPollIntervalSeconds": 300,
>> -  "RootfsPartA": "mmcblk0p2",
>> -  "RootfsPartB": "mmcblk0p3",
>> +  "RootfsPartA": "/dev/mmcblk0p1",
>> +  "RootfsPartB": "/dev/mmcblk0p2",
> 
>  This one seems kind of obvious...
> 
>  Mirza, how is it possible that this used to work for you?

 Ha, it was already submitted before by Mirza! [1]

 I'll go and apply that one instead.

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1099369/

> 
>>    "ServerCertificate": "/etc/mender/server.crt",
>> -  "ServerURL": "https://docker.mender.io",
>> +  "ServerURL": "https://hosted.mender.io",
> 
>  This one is also obvious: docker.mender.io doesn't exist, and according to
> wayback machine it never did. Well, it doesn't know hosted.mender.io either and
> that one definitely exists, so maybe it just changed name. Mirza?
> 
>  Regards,
>  Arnout
> 
>>    "TenantToken": "dummy"
>>  }
>>
