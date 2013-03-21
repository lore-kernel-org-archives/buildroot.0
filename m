From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Mar 2013 09:31:14 -0300
Subject: [Buildroot] [PATCH] dosfstools: fix host variant dependencies
In-Reply-To: <514AFD3E.7040608@zacarias.com.ar>
References: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
 <201303211321.12821.yann.morin.1998@free.fr>
 <514AFD3E.7040608@zacarias.com.ar>
Message-ID: <514AFD92.8050605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/21/2013 09:29 AM, Gustavo Zacarias wrote:

> On 03/21/2013 09:21 AM, Yann E. MORIN wrote:
> 
>>> +# Avoid target dosfstools dependencies, no host-libiconv
>>> +HOST_DOSFSTOOLS_DEPENDENCIES =
>>> +
>>
>> Shouldn't we also do:
>>     HOST_DOSFSTOOLS_LDFLAGS =
>>
>>>  ifneq ($(BR2_ENABLE_LOCALE),y)
>>>  DOSFSTOOLS_DEPENDENCIES += libiconv
>>>  DOSFSTOOLS_LDFLAGS += -liconv
> 
> Not really, HOST_LDFLAGS doesn't inherit.
> Regards.

And we explicitly use a clean BUILD_CMDS for the host :)
Regards.
