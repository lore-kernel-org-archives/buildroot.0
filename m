From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Feb 2016 21:38:53 +0100
Subject: [Buildroot] [PATCH 06/18] erlang-fast_tls: new package
In-Reply-To: <20160123092057.477970af@free-electrons.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
 <1453511471-28519-7-git-send-email-fhunleth@troodon-software.com>
 <20160123092057.477970af@free-electrons.com>
Message-ID: <56AFC25D.9070405@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, Thomas, All,

Le 23/01/2016 09:20, Thomas Petazzoni a ?crit :
> Dear Frank Hunleth,
> 
> On Fri, 22 Jan 2016 20:10:59 -0500, Frank Hunleth wrote:
>> This package is used by the newer versions of the ejabberd dependencies.
> 
> SoB line missing.

It seems that erlang-fast_tls depends on erlang-p1-utils package. I had the
following build error:

==> erlang-fast_tls-1.0.0 (compile)
Dependency not available: p1_utils-.* ({git,
                                        "git://github.com/processone/p1_utils",
                                        {tag,"1.0.3"}})
ERROR: compile failed while processing
/home/naourr/git/buildroot/test/erlang/build/erlang-fast_tls-1.0.0: rebar_abort

Best regards,
Romain

> 
>> ---
>>  package/Config.in                          |  1 +
>>  package/erlang-fast_tls/Config.in          |  7 +++++++
>>  package/erlang-fast_tls/erlang-fast_tls.mk | 14 ++++++++++++++
>>  3 files changed, 22 insertions(+)
>>  create mode 100644 package/erlang-fast_tls/Config.in
>>  create mode 100644 package/erlang-fast_tls/erlang-fast_tls.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 09c2b40..a560784 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -471,6 +471,7 @@ menu "Erlang libraries/modules"
>>  	source "package/erlang-goldrush/Config.in"
>>  	source "package/erlang-lager/Config.in"
>>  	source "package/erlang-p1-cache-tab/Config.in"
>> +	source "package/erlang-fast_tls/Config.in"
> 
> Alphabetic ordering not correct here.
> 
> Thomas
> 
