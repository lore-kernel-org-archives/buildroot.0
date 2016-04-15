From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Apr 2016 16:15:20 -0300
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version
 1.21
In-Reply-To: <1458505707.1998.24.camel@embedded.rocks>
References: <1451762923-15985-1-git-send-email-joerg.krause@embedded.rocks>
 <56885656.8080505@mind.be> <1458505707.1998.24.camel@embedded.rocks>
Message-ID: <57113DC8.7090509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/16 17:28, J?rg Krause wrote:

> Hi Arnout,
>
> I'm really sorry for the long delay. This patch has lost my
> attention...
>
>>   It's mind-boggling that "a small library with error codes" needs
>> architecture-specific handling...
>
> It is indeed! I had a closer look and I think the whole magic libgpg-
> error does for retrieving the initialization of a lock object can be
> done without all the target configuration files. I'll contact the
> maintainers about this issue.
>
> Best regards
> J?rg Krause

Hi all.
A small attention note: this is now required for the recently released 
libgcrypt 1.7.0 since it depends on gpg-error >= 1.13 (which uses the 
new mutex code IIRC which causes this headache).
It's not a high-priority since it's just new feature, no security bug 
fixes... yet ;)
Regards.
