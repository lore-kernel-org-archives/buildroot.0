From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 14 Jun 2016 20:46:01 +0200
Subject: [Buildroot] [PATCH] scanpan: downgrade needed host perl version
In-Reply-To: <20160614121731.5d618cdd@free-electrons.com>
References: <20160613194057.46504-1-sv99@inbox.ru>
 <20160614121731.5d618cdd@free-electrons.com>
Message-ID: <CAB0FRsvbv9uQ=XPMaej-zJQkRxUKr___R3QQAswW12131q4n+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NACK for this patch.

scancpan must use a host perl with the same major version as the
target perl (currently 5.22.2),
in order to have the correct data from Module::CoreList needed by the
dependency generation.
See comment lines 575-576.

In fact, the documentation (part Synopsis) must be fixed with :
perlbrew install 5.22.2
I'll send the patch.

Fran?ois


2016-06-14 12:17 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Fran?ois,
>
> Could you review/ack this patch? Thanks!
>
> Thomas
>
> On Mon, 13 Jun 2016 22:40:57 +0300, Viacheslav Volkov wrote:
>> support/scripts/scancpan - require host perl 5.022
>>
>> on the Ubuntu 14.04 - perl version v5.18.2
>>
>> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
>> ---
>>  support/scripts/scancpan | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
>> index 6c70cfb..fb445cf 100755
>> --- a/support/scripts/scancpan
>> +++ b/support/scripts/scancpan
>> @@ -471,7 +471,7 @@ unshift @INC, sub {
>>  } # END OF FATPACK CODE
>>
>>
>> -use 5.022;      # same major version as target perl
>> +use 5.018;      # same major version as target perl
>>  use strict;
>>  use warnings;
>>  use Fatal qw(open close);
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
