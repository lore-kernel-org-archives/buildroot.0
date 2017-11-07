From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 7 Nov 2017 23:26:58 +0100
Subject: [Buildroot] [PATCH] util-linux: fix link failures due to name
 clash
In-Reply-To: <498746333.16420841.1510015528782.JavaMail.zimbra@datacom.ind.br>
References: <1510010041-4377-1-git-send-email-luca@lucaceresoli.net>
 <1111696854.16420170.1510013995647.JavaMail.zimbra@datacom.ind.br>
 <498746333.16420841.1510015528782.JavaMail.zimbra@datacom.ind.br>
Message-ID: <34f7c3d1-0ee7-655a-e56d-48a16ddfcc85@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On 07/11/2017 01:45, Carlos Santos wrote:
>> From: "Carlos Santos" <casantos@datacom.ind.br>
>> To: "Luca Ceresoli" <luca@lucaceresoli.net>
>> Cc: "Adam Duskett" <aduskett@gmail.com>, buildroot at buildroot.org
>> Sent: Monday, November 6, 2017 10:19:55 PM
>> Subject: Re: [Buildroot] [PATCH] util-linux: fix link failures due to name clash
> 
>>> From: "Luca Ceresoli" <luca@lucaceresoli.net>
>>> To: buildroot at buildroot.org
>>> Cc: "Luca Ceresoli" <luca@lucaceresoli.net>, "Adam Duskett" <aduskett@gmail.com>
>>> Sent: Monday, November 6, 2017 9:14:01 PM
>>> Subject: [Buildroot] [PATCH] util-linux: fix link failures due to name clash
>>
>>> Several packages have a similar md5.c file, and each has a function
>>> named byteReverse(). This generates link errors ("multiple definition
>>> of `byteReverse'").
>>>
>>> Fix by declaring byteReverse as static, since it is just an internal
>>> function.
>>>
>>> Fixes:
>>>  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/
>>
>> Did you submit this patch upstream?
> 
> [Do not hit ?send? before completing the the message, dooh!]
> 
> Perhaps it was blocked by the util-linux MLM. Did you submit the patch as a plain-text message using git send-email?

I sent with git send-email, but apparently I'm having issues with
sending to vger.kernel.org, that I'm trying to solve with my ISP.

In the meanwhile I sent the patch from a different account, so at least
it's there for review. I also sent v2 of this patch to mark the new
upstream status.

Thanks,
-- 
Luca
