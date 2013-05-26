From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 26 May 2013 19:23:12 +0200
Subject: [Buildroot] [PATCH] system/device-table: do not set
	/home/default stgid
In-Reply-To: <20130525203711.GA3407@free.fr>
References: <1369514012-19606-1-git-send-email-yann.morin.1998@free.fr>
 <20130525203711.GA3407@free.fr>
Message-ID: <CAHXCMMJnTCwqfgm6ga-DTeTJy5jvYAds8oKq7w0aLDhojd+Byg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

2013/5/25 Yann E. MORIN <yann.morin.1998@free.fr>:
> All,
>
> On 2013-05-25 22:33 +0200, Yann E. MORIN spake thusly:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> Currently, /home/default is mode 2755 which means it is setgid.
>> Since /home/default is not group-writable, it is useless.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> ---
>> AFAICS, there is no reason that /home/default be setgid.
>> However, I have not audited all packages to check whether one
>> would require that.
>> ---
>>  system/device_table.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/system/device_table.txt b/system/device_table.txt
>> index 421728b..43c0cfa 100644
>> --- a/system/device_table.txt
>> +++ b/system/device_table.txt
>> @@ -9,7 +9,7 @@
>>  /dev                                 d       755     0       0       -       -       -       -       -
>>  /tmp                                 d       1777    0       0       -       -       -       -       -
>>  /etc                                 d       755     0       0       -       -       -       -       -
>> -/home/default                                d       2755    1000    1000    -       -       -       -       -
>> +/home/default                                d       755     1000    1000    -       -       -       -       -
>>  /var/www                             d       755     33      33      -       -       -       -       -
>>  /etc/shadow                          f       600     0       0       -       -       -       -       -
>>  /etc/passwd                          f       644     0       0       -       -       -       -       -
>
> I think this should got in -next, not master. If it should go at all.
Acked-by: Samuel Martin <s.martin49@gmail.com>
(for the patch itself and its application on next).

>
> Any reason for this setgid bit on a group-unwritable directory in the
> first place?
It has been there for ages (from the beginning), though i don't see
any obvious reasons to set this setgid bit on the home directory.


Regards,

-- 
Samuel
