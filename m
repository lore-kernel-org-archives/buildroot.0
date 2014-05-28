From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 28 May 2014 18:39:03 +0200
Subject: [Buildroot] [PATCH for 2014.05] manual: remove contributor list
	and add copyright
In-Reply-To: <20140528162711.GG3510@free.fr>
References: <65f6151a027a1048a118.1401292259@argentina>
 <20140528162711.GG3510@free.fr>
Message-ID: <1be851e7-473a-4d32-a283-df3f989da2df@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Thomas, All,
>
>On 2014-05-28 17:50 +0200, Thomas De Schampheleire spake thusly:
>> As discussed on the mailing list [1], remove the limited explicit list of
>> contributors in favor of the general mention of 'The Buildroot developers'.
>> Add a copyright statement.
>> Move the generation info to the front.
>> 
>> [1] http://lists.busybox.net/pipermail/buildroot/2014-May/097589.html
>> 
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> 
>> ---
>>  docs/manual/manual.txt |  11 +++++------
>>  1 files changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -61,9 +61,9 @@ manual-check-dependencies-$(3):
>>  	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
>>  	$(Q)mkdir -p $$(@D)/.build
>>  	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
>> -	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
>> +	$(Q)a2x $(6) --verbose -k -f $(2) -d book -L -r $(TOPDIR)/docs/images \
>
>Why --verbose?
>
>>  	        -D $$(@D) $$(@D)/.build/$(1).txt
>> -	-$(Q)rm -rf $$(@D)/.build
>> +	#-$(Q)rm -rf $$(@D)/.build
>
>Debug stuff left over?

Ai, yes the changes in manual.mk should not be part of this patch.. I'll resend, sorry...
