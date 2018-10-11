From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Oct 2018 22:52:54 +0200
Subject: [Buildroot] [PATCH] netsnmp: fix static build failure due to
 missing -lssl and -lz
In-Reply-To: <871s8w1aaz.fsf@dell.be.48ers.dk>
References: <c7ee69a4-ece1-2161-f0a4-d0bbb5dc14ad@micronovasrl.com>
 <20180917203912.75481-1-giulio.benetti@micronovasrl.com>
 <871s8w1aaz.fsf@dell.be.48ers.dk>
Message-ID: <f1617e29-4fdf-967f-84a6-123c045b8400@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Il 11/10/2018 22:46, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
>   > During configure some checking needing -lssl and -lz don't have them
>   > appended to linker tail. Since we are building static this leads to
>   > configure failure because of mandatory functions lack produces:
>   > "configure: error: The DTLS based transports require the libssl library
>   > from OpenSSL to be available and support DTLS"
> 
>   > - Add 1 patch to fix -lssl lack in configure and .ac modules:
>   > upstreamed: https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
>   > - Add 2 patches to fix -lz lack in configure and .ac modules:
>   > 1 upstreamed: https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/
>   > 1 in Merge Request: https://sourceforge.net/p/net-snmp/code/merge-requests/19/
>   > - Add NETSNMP_AUTORECONF = YES
> 
>   > Fixes:
>   > http://autobuild.buildroot.net/results/ece/ece7af756c910f65f618c1d04a5de70cc574b5f4/
>   > http://autobuild.buildroot.net/results/2a7/2a7020de6a4095cf9991d09fbe8f6e364783f63b/
>   > http://autobuild.buildroot.net/results/e27/e2787d15f72949cbb347e8a1d344f5f80b4d7697/
>   > http://autobuild.buildroot.net/results/439/4393ce8ddee294f91bdc3e6fb53e08d56fe52184/
>   > http://autobuild.buildroot.net/results/da6/da6bbbbb3a8d8193ec1389b9d976164181e88ae2/
>   > http://autobuild.buildroot.net/results/cf5/cf57686e7620cc0ec361631a9ff906aa0123fdb4/
>   > http://autobuild.buildroot.net/results/104/1043a958314529240627005d1bf21a76f4e6fcf5/
>   > http://autobuild.buildroot.net/results/885/8855545bd09388e0da451a3cb53b312e13b29c2c/
>   > http://autobuild.buildroot.net/results/a3d/a3dab9618a7ed88f94597418a5892c87adc23c66/
>   > http://autobuild.buildroot.net/results/18e/18e70b88c9bcb3b8ede7308e54bba9417d1fd3fb/
>   > http://autobuild.buildroot.net/results/ee3/ee34f65f26da20c0f2fdb9e86bcbddd389f59a29/
>   > http://autobuild.buildroot.net/results/a1e/a1eb848079080ddf7cf2fc9e554cdd63ade0e9aa/
>   > http://autobuild.buildroot.net/results/4dc/4dc8b53ff9f504c0a3dfc2d72c2609ad4d34559b/
>   > http://autobuild.buildroot.net/results/9cc/9cc19e481de20ea0b4b5163e45c5aee525b81229/
>   > http://autobuild.buildroot.net/results/f15/f15c22e0257d7498456049d8aae195ed6a265d2e/
>   > http://autobuild.buildroot.net/results/1b3/1b30f9813a4605056963bfe4532374f725830fda/
>   > http://autobuild.buildroot.net/results/d02/d02afc174ac4c9888f0a2cf725820cc1f05fc4bf/
>   > http://autobuild.buildroot.net/results/57b/57b3f4663058d728987ef848e4b346656cae21d4/
>   > http://autobuild.buildroot.net/results/ed4/ed4c27bdffccc4374ab7f951c30baba8171d30e1/
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>   > ---
>   >  ...figure-static-linking-Fix-SSL-checks.patch | 142 ++++++++++++++++++
> 
> Having the configure part AND doing a autoreconf is a bit stupid, but I
> guess you just wanted to include the upstream commit as is.

As I've tested, need to autoreconf to pick up new autotools rules 
applied with patches.
So if call only ./configure after appliyng patches it wouldn't work as 
configure file is not re-created by autotools.

Maybe I have to suggest to netsnmp upstream as Issue to update 
"configure" file?

> Committed, thanks!

Thank you!
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
