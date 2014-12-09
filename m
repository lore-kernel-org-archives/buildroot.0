From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 9 Dec 2014 20:56:26 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: remove duplicated
	dependency
In-Reply-To: <20141209203539.3d07e284@free-electrons.com>
References: <1418153523-10972-1-git-send-email-francois.perrad@gadz.org>
 <20141209203539.3d07e284@free-electrons.com>
Message-ID: <CAB0FRsvqEKVDX59Sdcz2wQQ+NKqL44LNsW4nKxP0ah_Ua5wtsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-12-09 20:35 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Tue,  9 Dec 2014 20:32:03 +0100, Francois Perrad wrote:
>> dependency from metacpan comes as a list of module
>> which is transformed in a list of distribution for BR.
>> different modules could be included in the same distribution,
>> so duplication is possible.
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Thanks. Could you give an example of a CPAN module which exhibits the
> issue, so non-Perl people like me can test the effect of your patch?
>
> Thanks!
>

An example with a CPAN module which is not in BR

   $ support/scripts/scancpan -f HTTP-Daemon

Without the patch, its dependency on HTTP-Message is duplicated.

Fran?ois

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
