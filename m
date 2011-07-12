From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Tue, 12 Jul 2011 17:10:01 +0700
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
In-Reply-To: <20110712091730.6372c872@skate>
References: <1310452089-23322-1-git-send-email-ruckuus@gmail.com>
 <20110712084323.74ff5c0c@skate>
 <CAG7bwA+MEJDb_1tXHQ82_R7_7eCmm1fwYnE2O0DSiMBwL0USqQ@mail.gmail.com>
 <20110712091730.6372c872@skate>
Message-ID: <CAG7bwAJ-9V3k1yaFzLo4QK466mkddMR8rPXEZ0YrSewf=wY3iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Jul 12, 2011 at 2:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Dwi,
>
> Le Tue, 12 Jul 2011 14:03:01 +0700,
> Dwi Sasongko Supriyadi <ruckuus@gmail.com> a ?crit :
>
>> > The latest ccid release is 1.4.4, dated May 2011, which doesn't
>> > seem to be that old. In general, we prefer using stable releases
>> > rather than SVN versions when possible. Do you have a good reason
>> > for choosing a specific SVN version instead of the latest project
>> > release ?
>> >
>>
>> It should have been using the latest version.
>>
>> The reason is somehow fuzzy for me, and I need your advise. The idea
>> is to keep the changes in .mk file as less as possible when there is
>> new release, so in above case we only need to change the CCID_VERSION
>> based on SVN version.
>>
>> I agree to use the stable release which is in this case will look as
>> follow:
>>
>> CCID_VERSION = 1.4.4
>> CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
>> CCID_SITE = https://alioth.debian.org/frs/download.php/3579
>>
>> Comparing to the previous release: 1.4.3
>> CCID_VERSION = 1.4.3
>> CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
>> CCID_SITE = https://alioth.debian.org/frs/download.php/3535
>>
>> There will be changes in CCID_VERSION and CCID_SITE when upgrading
>> from 1.4.3 to 1.4.4
>>
>> Please advise, should this is not reasonable
>
> Well, I think updating two lines (CCID_VERSION and CCID_SITE) is
> reasonable when the package version needs to be changed. It would of
> course have been better if Alioth did not use this strange (and
> stupid?) URL scheme, but that's the way it is.
>

I have modified the url to point to the tarball instead of SVN

>> >> +CCID_AUTORECONF = YES
>
> Presumably, if you use the tarball versions, the ./configure script and
> Makefile.in files will already be available, so this line could be
> removed.
>

Thank you for this info.

>> >> +##########################################################
>> >> +#
>> >> +# PCSC-Lite
>> >> +#
>> >> +# ########################################################
>> >> +PCSC_LITE_VERSION = 5853
>> >> +PCSC_LITE_SITE = svn://anonscm.debian.org/pcsclite/trunk/PCSC
>> >
>> > Same question, SVN version really needed ?
>> >
>>
>> Actually no. When checking out from SVN it will always get the latest
>> version.
>
> No, with what you have written, it will always get revision 5853, and
> nothing else. It'd be better to use the tarball version here as well.
>

Indeed, when saying it will check out the latest version what I mean
is when the version is not specified.

>> >> +PCSC_LITE_AUTORECONF = YES
>
> And remove this line.
>
>> Many thanks for your comments. This is my first attempt on buildroot,
>> I will try my best to accomplish it.
>
> And your first attempt is very good! Thanks for contributing!
>

Thank you.

I have already modified the patch after testing from scratch
(recompile everything) and found out that there are other dependencies
for ccid.

Should I send the patch here or creating another thread?

Thanks in advance,
DWI
