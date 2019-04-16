From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 16 Apr 2019 23:47:48 +0200
Subject: [Buildroot] [PATCH] package/madplay: fix build failure due to
 old autotools macro
In-Reply-To: <20190416221315.74b4c9c9@windsurf>
References: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
 <20190416221315.74b4c9c9@windsurf>
Message-ID: <75d9fba9-15ff-695a-6347-550bf26488c6@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 16/04/2019 22:13, Thomas Petazzoni ha scritto:
> On Tue, 16 Apr 2019 12:21:25 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> MKINSTALLDIRS is not automatically called by autotools when
>> autoreconfigured.
>> This leads to have install stage error:
>> `/bin/sh @MKINSTALLDIRS@
>> /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
>> /bin/sh: 0: Can't open @MKINSTALLDIRS@`
>> because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.
>>
>> Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
>> every @MKINSTALLDIRS@ occurence in *.in Makefile.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Why is this package suddenly failing to build ? madplay hasn't been
> updated recently, so why do we have build failures and not before ?

MKINSTALLDIRS is very obsolete, but Autoconf and Automake are the same 
version since 2017 and 2018, so they're not the problem even if I 
thought they were.
First failure is dated 14-04-2019.

> Isn't the build failure related to the switch from gettext-gnu to
> gettext-tiny ?

.config has "gettext-gnu" not "gettext-tiny", so that doesn't seem the 
problem.
I try to dig deeper.

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

> Thomas
> 
