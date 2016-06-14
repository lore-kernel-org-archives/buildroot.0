From: Viacheslav Volkov <sv99@inbox.ru>
Date: Tue, 14 Jun 2016 16:07:46 +0300
Subject: [Buildroot] [PATCH] scanpan: downgrade needed host perl version
In-Reply-To: <20160614121731.5d618cdd@free-electrons.com>
References: <20160613194057.46504-1-sv99@inbox.ru>
 <20160614121731.5d618cdd@free-electrons.com>
Message-ID: <a1016a46-4cb9-4c3a-cf7e-1a5cc8aca2c7@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

14.06.16 13:17, Thomas Petazzoni ?????:
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

On the host machine with perl version lower then 5.22 scancpan exit with
error - require version 5.22.

I cant add perl module from the cpan on the Ubuntu 14.04 - perl version
5.18.2.

SYNOPSIS - in the script:

curl -kL http://install.perlbrew.pl | bash
perlbrew install perl-5.18.2
supports/scripts/scancpan [options] [distname ...]


Thanks
