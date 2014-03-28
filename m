From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 28 Mar 2014 19:40:59 +0100
Subject: [Buildroot] [PATCH] valgrind: Add support for MIPS architecture
In-Reply-To: <5335BE6C.8020500@imgtec.com>
References: <1396025209-9495-1-git-send-email-Vincent.Riera@imgtec.com>
 <be46f8fb-8747-4d45-a946-fc11e5818688@email.android.com>
 <5335BE6C.8020500@imgtec.com>
Message-ID: <06ec4288-1b83-45b9-885d-993a337a6774@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente Olivert Riera <Vincent.Riera@imgtec.com> schreef:
>On 03/28/2014 06:16 PM, Thomas De Schampheleire wrote:
>> Hi Vicente,
>>
>> Vicente Olivert Riera <Vincent.Riera@imgtec.com> schreef:
>>> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>> package/valgrind/Config.in |    3 ++-
>>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
>>> index dacdd86..fd5649b 100644
>>> --- a/package/valgrind/Config.in
>>> +++ b/package/valgrind/Config.in
>>> @@ -1,7 +1,8 @@
>>> config BR2_PACKAGE_VALGRIND
>>> 	bool "valgrind"
>>> 	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
>>> -		   BR2_cortex_a9 || BR2_powerpc
>>> +		   BR2_cortex_a9 || BR2_powerpc || BR2_mips || \
>>> +		   BR2_mipsel || BR2_mips64 || BR2_mips64el
>>> 	help
>>> 	  Tool for debugging and profiling Linux programs.
>>>
>>
>> Did you test this on target?
>
>Not yet, but it should work.
>
>> Do you have any idea why it wasn't enabled for mips before?
>
>Valgrind added support for MIPS on it's last release, 3.9.0:
>
>http://sourceforge.net/p/valgrind/mailman/valgrind-announce/thread/52738DEF.1070801 at acm.org/
>
>But you already knew that. The following message is yours:
>
>"One of the new features of Valgrind 3.9.0 is the addition of MIPS
>support. Maybe it would be good to enable Valgrind on these
>architectures. I'm adding Vincente and Markos in the Cc list, since
>they are our main MIPS contributors. They might probably be interested
>in doing this work, after testing on MIPS hardware."

I think you are confusing the two Thomas'es, but that's ok :-).

Thanks for your explanation...

Best regards,
Thomas
