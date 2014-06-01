From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sun, 01 Jun 2014 18:08:05 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: select fbset as it is a runtime
 dependency
In-Reply-To: <CAEBucnCENKuaq6oidc9o0S9KjB_Hkt7h3oc0eed4mRs3ZRSZ3g@mail.gmail.com>
References: <1401634635-20325-1-git-send-email-hadrien.boutteville@gmail.com>
 <CAEBucnCENKuaq6oidc9o0S9KjB_Hkt7h3oc0eed4mRs3ZRSZ3g@mail.gmail.com>
Message-ID: <538B4FE5.6050809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser,

On Sun, 1 Jun 2014 10:30:10 -0500, Spenser Gilliland wrote:
> On Jun 1, 2014 7:57 AM, "Hadrien Boutteville"
> <hadrien.boutteville at gmail.com <mailto:hadrien.boutteville@gmail.com>>
> wrote:
>>
>> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com
> <mailto:hadrien.boutteville@gmail.com>>
>> ---
>>  package/ti-gfx/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
>> index 3e8648e..f1f3a07 100644
>> --- a/package/ti-gfx/Config.in
>> +++ b/package/ti-gfx/Config.in
>> @@ -3,6 +3,7 @@ config BR2_PACKAGE_TI_GFX
>>         select BR2_PACKAGE_HAS_LIBEGL
>>         select BR2_PACKAGE_HAS_LIBGLES
>>         select BR2_PACKAGE_HAS_POWERVR
>> +       select BR2_PACKAGE_FBSET # Runtime dependency only
>>         depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
>>         help
>>           Graphics libraries for TI boards.
>> --
>> 1.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> Fbset is available in either the package or as part of busybox.  Is
> there a good way to support both?

Erf, yes, I didn't pay attention to that... According to Thomas the
solution would be to select fbset in the default busybox configuration,
and select it in ti-gfx only if busybox is not used.

Regards,

Hadrien
