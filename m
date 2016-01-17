From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Jan 2016 21:24:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbroadvoice: Not available on
 BR2_arc
In-Reply-To: <569BF704.3000406@mind.be>
References: <1453030930-30782-1-git-send-email-bernd.kuhls@t-online.de>
 <569BF704.3000406@mind.be>
Message-ID: <569BF889.2070602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-01-16 21:18, Arnout Vandecappelle wrote:
> On 17-01-16 12:42, Bernd Kuhls wrote:
>> The only available buildroot-toolchain for arc is gcc-4.8 which has a
>> bug when compiling libbroadvoice:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
>>
>> This patch can be removed when gcc-4.9+ is available for arc.
>>
>> Fixes
>> http://autobuild.buildroot.net/results/4a1/4a1fd92d1ce4963d3e282ea2dc8f0f6c5db4f1e1/
>> http://autobuild.buildroot.net/results/ce3/ce3be7d27489647a98d8932c5bcabd08c845187b/
>> http://autobuild.buildroot.net/results/988/988bd189bab37a03c037160d6758774d4aa6c8a0/
>> and many others
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/libbroadvoice/Config.in | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/package/libbroadvoice/Config.in b/package/libbroadvoice/Config.in
>> index d695df0..740342e 100644
>> --- a/package/libbroadvoice/Config.in
>> +++ b/package/libbroadvoice/Config.in
>> @@ -1,5 +1,8 @@
>>  config BR2_PACKAGE_LIBBROADVOICE
>>  	bool "libbroadvoice"
>> +	# broken with gcc-4.8 which is the only available toolchain on arc
>> +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
>> +	depends on !BR2_arc
> 
>  To be future-safe, we can already write:
> 
> 	depends on !BR2_arc || BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

 Sorry for the dupe, I shouldn't do FIFO reading :-)

 Regards,
 Arnout


> 
>  Regards,
>  Arnout
>>  	help
>>  	  broadvoice - a library for the BroadVoice 16 and 32 speech
>>  	  codecs
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
