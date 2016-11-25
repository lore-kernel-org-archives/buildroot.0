From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 25 Nov 2016 17:06:15 +0100
Subject: [Buildroot] [PATCH 1/1] host-python3: Do not use the system
 OpenSSL.
In-Reply-To: <ae041aa5-51bc-0308-7d46-427845dec4ee@mind.be>
References: <515ff5e8-2077-f5e9-52eb-7e061b48203a@green-communications.fr>
 <20161122131109.4459-1-nicolas.cavallari@green-communications.fr>
 <ae041aa5-51bc-0308-7d46-427845dec4ee@mind.be>
Message-ID: <cf00a52c-9992-2828-916a-765b47cd3315@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/11/2016 23:46, Arnout Vandecappelle wrote:
> 
> 
> On 22-11-16 14:11, Nicolas Cavallari wrote:
>> host-python3 currently detect if there is an usable OpenSSL installation
>> and conditionnaly compiles the 'ssl', '_ssl' and '_hashlib' modules.
>> This may break compilation if the system's OpenSSL has been updated to
>> 1.1.0 because of a bug in python, see https://bugs.python.org/issue26470
>> for details.
>>
>> Unlike Python 2.7, Python 3 unconditionnaly compiles fallbacks for
>> common hash algorithm, so disabling OpenSSL will still leave Python 3
>> with implementations of common hash algorithm.
>>
>> This adds a patch to configure.ac patch to implement a --disable-openssl
>> option.
> 
>  You didn't add your Signed-off-by here.

Oops, i'll put it here just in case someone want to apply it anyway:

Signed-off-by: Nicolas Cavallari
<nicolas.cavallari@green-communications.fr>

>> ---
>>  .../0031-Add-an-option-to-disable-openssl.patch    | 23 ++++++++++++++++++++++
>>  package/python3/python3.mk                         |  3 ++-
>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>  create mode 100644 package/python3/0031-Add-an-option-to-disable-openssl.patch
>>
>> diff --git a/package/python3/0031-Add-an-option-to-disable-openssl.patch b/package/python3/0031-Add-an-option-to-disable-openssl.patch
>> new file mode 100644
>> index 0000000..d437520
>> --- /dev/null
>> +++ b/package/python3/0031-Add-an-option-to-disable-openssl.patch
>> @@ -0,0 +1,23 @@
>> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
>  Funny, an almost-git-formatted patch :-)
> 
>  Since I assume you based this on python's 111-optional-ssl.patch, I think you
> really should keep Thomas's authorship (and signed-off-by of course)

I didn't base this on 111-optional-ssl.patch, i just copy-pasted some
lines nearby. The buildroot patches for python 3 are not really the
same compared to the python 2.7 patches. I think would be rude to
indicate Thomas signed off this patch without ever seeing it.

It was already a bit rude to keep the signoff while modifying
111-optional-ssl.patch, but i received no comments on that.

>  That said:
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  This is really needed for 2016.11. I can't build host-python3 without it.

I'll wait for further comments before resubmitting.
