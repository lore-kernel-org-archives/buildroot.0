From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:34:05 +0100
Subject: [Buildroot] [PATCH] suport/download: force svn to be
 non-interactive
In-Reply-To: <42ed0ef2-e62a-4c19-fd81-83b6a591fd32@dawncrow.de>
References: <20171103212216.11772-1-yann.morin.1998@free.fr>
 <42ed0ef2-e62a-4c19-fd81-83b6a591fd32@dawncrow.de>
Message-ID: <689f024f-c9e6-31c2-945f-ce06885a2804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 16:14, Andr? Hentschel wrote:
> Am 03.11.2017 um 22:22 schrieb Yann E. MORIN:
>> Fixes:
>>     http://autobuild.buildroot.org/results/2af/2af7412846c576089f8596857ab8c81ac31c1bed/
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  support/download/svn | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/support/download/svn b/support/download/svn
>> index 77abf3d02d..9f27d71f86 100755
>> --- a/support/download/svn
>> +++ b/support/download/svn
>> @@ -33,6 +33,6 @@ _svn() {
>>      eval ${SVN} "${@}"
>>  }
>>  
>> -_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
>> +_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
>>  
>>  tar czf "${output}" "${basename}"
>>
> 
> 
> Reviewed-by: Andr? Hentschel <nerv@dawncrow.de>

 Thanks! Sorry that Thomas, Yann and I gave you the same message three times.
Race conditions, difficult to avoid :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
