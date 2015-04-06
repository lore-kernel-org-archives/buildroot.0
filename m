From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 06 Apr 2015 22:43:30 +0200
Subject: [Buildroot] [PATCH 2/4] package/thrift: fix libtool warning
In-Reply-To: <5522E92F.1070300@mind.be>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-2-git-send-email-romain.naour@openwide.fr>
 <5522E92F.1070300@mind.be>
Message-ID: <5522EFF2.6040303@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 06/04/2015 22:14, Arnout Vandecappelle a ?crit :
> On 06/04/15 18:57, Romain Naour wrote:
>> Backport an upstream patch.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Minor comments below
> 
>> ---
>>  ...-check-minimum-required-version-of-automa.patch | 45 ++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
>>
>> diff --git a/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
>> new file mode 100644
>> index 0000000..2019706
>> --- /dev/null
>> +++ b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
>> @@ -0,0 +1,45 @@
>> +From 9b03d2b02d32302008d2bd0218b31b9a0ca5a748 Mon Sep 17 00:00:00 2001
>> +From: Jens Geyer <jensg@apache.org>
>> +Date: Fri, 3 Apr 2015 12:37:03 +0200
>> +Subject: [PATCH] THRIFT-3071 check minimum required version of automake in
>> + bootstrap.sh Client: Build process Patch: James E. King, III
>> + <jim.king@simplivity.com>
> 
>  Something went wrong with the subject line here. Upstream has the Client: and
> Patch: lines below the subject.

Ok, I see. The commit tittle is correct in my git tree but the formatted patch
is wrong...

I had to add a new line between title and Client line...

> 
>> +
>> +This closes #421
>> +
>> +- remove a warning when using libtool
>> +
>> +"libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([./aclocal])' to configure.ac,"
>> +
>> +[Romain:
>> +  - remove the part for bootstrap.sh which is not
>> +    bundled in thrift archive.
>> +  - fix the comment]
> 
>  Well, that fixing was no success :-) Anyway it should be

Indeed :) Sorry

> 
> - fix the commit log accordingly
> 
> 
>  Please also add a reference to the upstream commit, e.g.
> 
> 4aa95df383bfa13c46a4dc0b41672ec29d476300 upstream
> 
> or
> 
> https://git-wip-us.apache.org/repos/asf?p=thrift.git;h=4aa95df383bfa13c46a4dc0b41672ec29d476300
> 

Thanks for the review, I'll resend an updated version after having some comments
on patch 3/4 and 4/4 which are the aim of this series.

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
