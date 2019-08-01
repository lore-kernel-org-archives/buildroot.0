From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 1 Aug 2019 12:04:53 +0200
Subject: [Buildroot] [PATCH v3] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190801114634.193eca45@windsurf.home>
References: <20190729142610.21331-1-giulio.benetti@micronovasrl.com>
 <20190801005200.23317a95@windsurf.home>
 <93e84376-9b70-a3d4-422a-ceb3eadc71a6@micronovasrl.com>
 <20190801114634.193eca45@windsurf.home>
Message-ID: <bd4d19d8-279a-caa4-1e28-2d6d536085d4@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 01/08/2019 11:46, Thomas Petazzoni ha scritto:
> On Thu, 1 Aug 2019 11:12:09 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>> So the proper fix is not to change the libnss
>>> code, and your patches are most likely going to be rejected upstream
>>> (with good reason).
>>
>> ...they have all been upstreamed:
>> https://hg.mozilla.org/projects/nss/log?rev=Giulio+Benetti
>>
>> They all have been discussed here:
>> https://bugzilla.mozilla.org/buglist.cgi?emailcc1=1&list_id=14831966&emaillongdesc1=1&emailtype1=exact&emailassigned_to1=1&short_desc_type=allwordssubstr&email1=giulio.benetti%40micronovasrl.com&emailbug_mentor1=1&emailreporter1=1&short_desc=Remove%20-Wmaybe-uninitialized%20warning&resolution=FIXED&classification=Client%20Software&classification=Developer%20Infrastructure&classification=Components&classification=Server%20Software&classification=Other&query_format=advanced&emailqa_contact1=1&product=NSS
>>
>> The first and more ambiguos warning was this:
>> https://bugzilla.mozilla.org/show_bug.cgi?id=1561548
>> It sent me nut, not gcc :)
>> But in the end it was correct.
> 
> I checked 3 of these (not all), and the three I checked were bogus, the
> variable was definitely initialized.

You're right, I've been misleaded, indeed my commit log doesn't say that 
they are real errors.

>> I'd say to keep as it is for the moment and when NSS_3_46 will be
>> released(soon) it will contain all patches we will remove
>> NSS_ENABLE_WERROR=0.
>>
>> What do you think?
> 
> We generally disable Werror anyway in many packages, it's pretty common
> practice. It's common for new compiler versions to raise new warnings.
> Werror makes sense for upstream developers, a bit less so for
> downstream distributions/build-systems.

Ok, thank you!

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
