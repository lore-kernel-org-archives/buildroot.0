From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 20:33:44 +0200
Subject: [Buildroot] [PATCH] package/pppd: disable for musl toolchains
In-Reply-To: <20160716202434.0a3a6440@free-electrons.com>
References: <1468685298-29083-1-git-send-email-romain.naour@gmail.com>
 <20160716202434.0a3a6440@free-electrons.com>
Message-ID: <15985f1d-b02e-b670-4b71-5fb11c4afc44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 16/07/2016 ? 20:24, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 16 Jul 2016 18:08:18 +0200, Romain Naour wrote:
>> For the same reason as for ipsec-tools [1], disable pppd for musl
>> toolchains.
>> It also include <sys/cdefs.h> which is not provided by musl [2].
>>
>> This fixes a compilation error with musl libc because of undeclared
>> __P and missing sys/cdefs.h include.
>>
>> Propagate the dependency to network-manager and rp-pppoe
>> packages.
>>
>> [1] 33499484e457018203023cdfdd5286478f2ae381
>> [2] http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_musl_and_I_get_error_messages_about_sys.2Fcdefs.h
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/network-manager/Config.in | 1 +
>>  package/pppd/Config.in            | 5 +++--
>>  package/rp-pppoe/Config.in        | 5 +++--
>>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> I've added a Config.in comment in the network-manager package, and
> applied. Thanks!
> 
> It's a bit sad that we have to disable packages just because of silly
> __P macros, but there are indeed tons of them in pppd :-/

Well, I'm also not really happy to disable packages in Buildroot for such reason :-/

Best regards,
Romain


> 
> Thomas
> 
