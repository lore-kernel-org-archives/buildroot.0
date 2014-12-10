From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
Date: Wed, 10 Dec 2014 20:08:54 +0100
Subject: [Buildroot] [PATCH v2] openocd 0.8.0
In-Reply-To: <54876789.8090404@vanguardiasur.com.ar>
References: <1417379718-8575-1-git-send-email-claudio.laurita@integrazionetotale.it>
 <54876789.8090404@vanguardiasur.com.ar>
Message-ID: <54889A46.8030103@integrazionetotale.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 09/12/2014 22:20, Ezequiel Garcia ha scritto:
> Hi Claudio,
>
> Shouldn't this patch have a proper commit log?
Hi Ezequiel
thank you for your comments.
This is my first "official" proposal, so, please, guide me through the 
right "formal" steps.
I simply followed the instructions found in the manual. Anything missing 
is something I didn't understand (or I forgot).
I have a folder with the master git clone, put my new files there, 
commit them (locally) and format a patch.
Maybe this is not the right way to go, so, any suggestion to fill the 
missing pieces is welcome.
>
> I have a question, see below.
>
> On 11/30/2014 05:35 PM, Claudio Laurita wrote:
> [..]
>> -# Adapters
>> -ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
>> -OPENOCD_CONF_OPTS += --enable-ft2232_libftdi
>> +ifeq ($(BR2_PACKAGE_LIBFTDI),y)
>>   OPENOCD_DEPENDENCIES += libftdi
>> +HOST_OPENOCD_DEPENDENCIES += host-libftdi
>> +endif
>> +
> Are you sure it's correct to tie a host dependency
> to a target option?
Absolutely not.
It's a mistake that I only partially corrected from the first version of 
the patch.
Originally I assumed that the host part was to be built with the same 
options of the target part.
Thomas Petazzoni pointed out this bad mistake, but I forgot to correct 
this part. Sorry.
> On the other side, the commit fails to build here:
>
> configure: error: hidapi is required for the CMSIS-DAP Compliant Debugger
> package/pkg-generic.mk:167: recipe for target '/home/zeta/buildroot/ciaa/output/build/host-openocd-0.8.0/.stamp_configured' failed
> make: *** [/home/zeta/buildroot/ciaa/output/build/host-openocd-0.8.0/.stamp_configured] Error 1
I really apologize for that. The host part is a disaster.
I was totally concentrated on the target part. Shame on me.

> Any chance we bump openocd with a less invasive patch?
I really didn't want to be invasive, trust me.
But the actual package recipe manages only a minimal part of the options 
offered, even at the time of version 5.
I simply tried to make a full recipe to exploit all the actual potential 
of the package, as I needed it for my project.
Maybe it's not a good idea. Let's talk about that and find the right way 
to go.
But note that the deleted package patches are simply useless with the 
actual code, so they are to be deleted anyway. And this is a very big 
part of the patch.

I will try to clean all the mistakes in the host part and submit a third 
version of the patch in a couple of days.
Claudio
