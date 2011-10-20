From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 20 Oct 2011 08:55:47 +0200
Subject: [Buildroot] [PATCH 1 of 5] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <201110200032.56871.arnout@mind.be>
References: <patchbomb.1318602115@devws108>
 <31ae7a6eaff4e2cf9a1e.1318602116@devws108>
 <201110200032.56871.arnout@mind.be>
Message-ID: <CAAXf6LVrA=gCTdT-OWZbDcZ0LA2nZmQu_6d_8LHpLT3bMy_LWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Oct 20, 2011 at 12:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Wednesday 19 October 2011 09:34:04, Thomas De Schampheleire wrote:
>> +# findfileclauses_cont: creates "-o -name 'X' -o -name 'Y'"
>> +# [1:namelist, 2:prefix]
>> +findfileclauses_cont=$(patsubst %,$(2) -name '%',$(1))
>> +# findfileclauses: creates "-name 'X' -o -name 'Y'"
>> +# [1:namelist]
>> +findfileclauses=$(call findfileclauses_cont,$(firstword $(1))) $(call findfileclauses_cont,$(call notfirstword,$(1)),-o)
>
> ?The _cont function is a bit redundant, no?
>
> findfileclauses=-name '$(firstword $(1))' $(patsubst %,-o -name '%',$(call notfirstword,$(1)))
>
> ?I don't think the duplication of -name warrants the additional function
> call. ?It definitely doesn't make it easier to understand.

You're right. I got a little carried away with these functions... :-D

>
> ?Nevertheless, this is a nifty patch!
>

Thanks!
I'll wait a while for some more feedback on this series, and then I'll update.

Best regards,
 Thomas
