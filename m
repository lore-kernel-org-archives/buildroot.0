From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 13 Feb 2020 23:26:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/parted: disable on uclibc
In-Reply-To: <87d0aidul6.fsf@dell.be.48ers.dk>
References: <20200118163929.663035-1-fontaine.fabrice@gmail.com>
 <87d0aidul6.fsf@dell.be.48ers.dk>
Message-ID: <f4f69402-631b-ef46-5f2c-af49fc279cb0@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 2/13/20 10:51 PM, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>   > Like postgreSQL (and imagemagick), parted does not build against uClibc
>   > with locales enabled, due to an uClibc bug, see
>   > http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html:
> 
>   > In file included from atari.c:42:
>   > atari.c: In function 'atr_part_correct':
>   > atari.c:221:9: error: dereferencing pointer to incomplete type 'struct __uclibc_locale_struct'
>   >   return isalnum_l(part->id[0], atr_c_locale)
>   >          ^~~~~~~~~
> 
>   > So disable parted on uclibc
> 
>   > Fixes:
>   >  - http://autobuild.buildroot.org/results/992518d340a9f32a0721d6e66936850c4c3ef2e4
> 
>   > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> What about the reverse dependencies? E.G. udisks and python-pyparted?

Since I'm bumping udisks :-), udisks already depends on 
!BR2_TOOLCHAIN_USES_UCLIBC, but python-pyparted does not, so it deserves 
a build with the same autobuilder failure defconfig, I let you know.

-- 
Giulio Benetti
Benetti Engineering sas
