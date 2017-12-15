From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 15 Dec 2017 15:22:29 +0200
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <2a2dadee-301e-6840-0f78-680d09211649@petroprogram.com>
References: <20171214105706.4577-1-aep@exys.org>
 <20171214105706.4577-2-aep@exys.org> <20171214162102.25c6d252@windsurf>
 <CABukmmN-WtUiGpUGTWUhPhkFLOaLAgMNfXujMwMUkNB=P8PHQA@mail.gmail.com>
 <20171214165210.40b8f73d@windsurf>
 <2a2dadee-301e-6840-0f78-680d09211649@petroprogram.com>
Message-ID: <45f4f16e-ec0a-8cbe-f41f-f9c025cba55f@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, found this from 2012:

http://openwall.com/lists/musl/2012/12/08/4

So for statically linked musl (and uclibc) dlopen is no no

-S-


Stefan Fr?berg kirjoitti 15.12.2017 klo 15:12:
> Hi Thomas
>
>
> Thomas Petazzoni kirjoitti 14.12.2017 klo 17:52:
>> Hello,
>>
>> On Thu, 14 Dec 2017 16:27:36 +0100, Arvid Picciani wrote:
>>
>>> yes i did see the comment that's why i didnt submit a proper patch but more
>>> an RFC.
>>> It builds fine for me. maybe it doesn't try to use the dlopen stuff with
>>> musl?
>> I guess musl always has dlopen(), even in a purely statically linked
>> scenario, while uClibc does not have it.
>>
>> Thomas
> But doesn't static glibc also use dlopen() ?
>
> -S-
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
