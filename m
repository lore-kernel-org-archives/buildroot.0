From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 22 Jul 2017 12:59:34 +0200
Subject: [Buildroot] [PATCH v9 2/3] support/scripts/fix-rpath: check if
 the patchelf utility exists
In-Reply-To: <540b59e4-54b2-6db3-e48b-7b26737d194f@mind.be>
References: <1500642853-5565-1-git-send-email-wg@grandegger.com>
 <1500642853-5565-3-git-send-email-wg@grandegger.com>
 <540b59e4-54b2-6db3-e48b-7b26737d194f@mind.be>
Message-ID: <1e6ed455-f002-245f-9142-86cc6fb0d0d5@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 21.07.2017 um 23:13 schrieb Arnout Vandecappelle:
> 
> 
> On 21-07-17 15:14, Wolfgang Grandegger wrote:
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>   support/scripts/fix-rpath | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
>> index f7c70b7..9272d2d 100755
>> --- a/support/scripts/fix-rpath
>> +++ b/support/scripts/fix-rpath
>> @@ -45,6 +45,9 @@ Environment:
>>   
>>       TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR
>>                    (default HOST_DIR/opt/ext-toolchain)
>> +
>> +Returns:         0 if success or 1 in case of error
>> +
>>   EOF
>>   }
>>   
>> @@ -60,6 +63,11 @@ main() {
>>       local find_args=( )
>>       local sanitize_extra_args=( )
>>   
>> +    if [ ! -x "${PATCHELF}" ]; then
> 
>   This is not fully failsafe; it's still possible that some shared library used
> by patchelf is not available anymore. So to be really sure (as suggested by Thomas):
> 
>      if [ ! "${PATCHELF}" --help > /dev/null 2>&1 ]; then
> 
>   But that's really borderline stuff so

Ah,  I missed that point. Will send a hopefully final v10 after some 
basic testing...

Wolfgang.
