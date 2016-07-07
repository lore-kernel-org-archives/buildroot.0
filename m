From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 7 Jul 2016 12:11:19 +0200
Subject: [Buildroot] [PATCH 2/2] dependencies: check for Math
 BigInt/BigRat Perl module
In-Reply-To: <20160707115745.429a01cc@free-electrons.com>
References: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
 <1467845012-10531-2-git-send-email-romain.naour@gmail.com>
 <20160707115745.429a01cc@free-electrons.com>
Message-ID: <9177495b-b3f2-422c-2965-ad65837ea33d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 07/07/2016 ? 11:57, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu,  7 Jul 2016 00:43:32 +0200, Romain Naour wrote:
> 
>> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
>> index 5832cf3..40e83d4 100755
>> --- a/support/dependencies/dependencies.sh
>> +++ b/support/dependencies/dependencies.sh
>> @@ -239,6 +239,8 @@ fi
>>  # Check that the Perl installation is complete enough for Buildroot.
>>  required_perl_modules="Data::Dumper" # Needed to build host-autoconf
>>  required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
>> +required_perl_modules="$required_perl_modules Math::BigInt" # Used by mpv
>> +required_perl_modules="$required_perl_modules Math::BigRat" # Used by mpv
>>  required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
> 
> Should the addition of those Perl modules be conditional on the mpv
> package being enabled? I'm not sure, just wondering.

Yes, I hesitated doing so, but these modules are pretty small.

I haven't a strong opinion...

Best regards,
Romain

> 
> Thomas
> 
