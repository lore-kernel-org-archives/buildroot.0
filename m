From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 26 Jul 2014 07:31:57 +0200
Subject: [Buildroot] [PATCH v2 3/3] apply-patches.sh: don't print
	anything when "make -s" is used
In-Reply-To: <20140725174515.GE3955@free.fr>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
 <1406306319-11972-4-git-send-email-fabio.porcedda@gmail.com>
 <20140725174515.GE3955@free.fr>
Message-ID: <f104a79f-5b3e-46d5-9ad1-a5470e1137fe@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Fabio, All,
>
>On 2014-07-25 18:38 +0200, Fabio Porcedda spake thusly:
>> The make "-s" option is used to enable the "Silent operation" so if that
>> option is used don't print anything as far as there isn't any error.
>> 
>> Add the "-s" option to "apply-patches.sh" to enable silent operation.
>> 
>> Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
>> used so others parts can use it to silence the build as well.
>> 
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>[--SNIP--]
>> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>> index 37f2d81..8d4ba6d 100755
>> --- a/support/scripts/apply-patches.sh
>> +++ b/support/scripts/apply-patches.sh
>> @@ -6,6 +6,8 @@
>>  # (c) 2002 Erik Andersen <andersen@codepoet.org>
>>  #
>>  # Parameters:
>> +# - "-s",optional. Silent operation, don't print anything if there
>> +# isn't any error.
>>  # - the build directory, optional, default value is '.'. The place where are
>>  # the package sources.
>>  # - the patch directory, optional, default '../kernel-patches'. The place
>> @@ -28,6 +30,13 @@
>>  # applied. The list of the patches applied is stored in '.applied_patches_list'
>>  # file in the build directory.
>>  
>> +silent=
>> +if [[ $1 == "-s" ]] ; then
>
>The script uses single-[ tests, so please stay aligned with that. E.g.:
>
>    if [ ${1} == "-s" ]; then

In standard 'test' this should then also be a single = sign.
