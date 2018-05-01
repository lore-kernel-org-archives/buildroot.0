From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 1 May 2018 19:01:21 +0200
Subject: [Buildroot] [PATCH] glibc: install the obsolete libnsl
In-Reply-To: <20180429042656.udrq5dqw4q2p3btk@sapphire.tkos.co.il>
References: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
 <0418f92d-f988-da20-4561-dbf786afed94@gmail.com>
 <20180429042656.udrq5dqw4q2p3btk@sapphire.tkos.co.il>
Message-ID: <14ab0499-0a98-0bf3-3acb-3918450e0773@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 29/04/2018 ? 06:26, Baruch Siach a ?crit?:
> Hi Romain,
> 
> On Sat, Apr 28, 2018 at 04:51:39PM +0200, Romain Naour wrote:
>> Le 13/03/2018 ? 16:59, Baruch Siach a ?crit?:
>>> glibc 2.27 stopped installing libnsl by default. Restore libnsl install
>>> to fix packages, like exim, that use that library.
>>
>> Do you know if libnsl can be disabled from exim ?
> 
> Of course. We already do that for non-glibc targets. See 
> EXIM_REMOVE_LIBNSL_FROM_MAKEFILE in exim.mk.
> 
>> Is exim is the only remaining program still using/supporting libnsl ?
> 
> I don't know.
> 
>> libnsl from Glibc doesn't build with the upcoming gcc 8, it's not even build
>> tested by Glibc maintainers (build-many-glibcs.py test script) see [1].
>>
>> Maybe we can provide libnsl from a package that provide an updated version of
>> this library [2]?
>>
>> Can you have a look?
> 
> The simplest solution would be to disable libnsl in exim unconditionally, 
> remove libnsl support in glibc, and deal with any other libnsl users as we 
> encounter them.

Ok, let's remove nsl unconditionally from exim and disable the deprecated libnsl
from glibc. I'll post a new series doing so.

Btw, Fedora 28 has switched to the external libnsl in order to support IPV6 [1].
Interested people can add a new libnsl package later.

Best regards,
Romain

|1] https://fedoraproject.org/wiki/Changes/NISIPv6

> 
> baruch
> 
