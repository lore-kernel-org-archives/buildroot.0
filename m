From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Jul 2015 09:15:54 +0200
Subject: [Buildroot] [PATCH v2 4/4] Makefile: staging symlink uses a
 relative path
In-Reply-To: <6195872.eqbV4amuVy@sagittea>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
 <1436775527-2484-5-git-send-email-s.martin49@gmail.com>
 <6195872.eqbV4amuVy@sagittea>
Message-ID: <CAHXCMMJbncpfhzKjrirB15N0t_bv8PsBh1+chYB0Mz75DKKdeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rome, all,

On Thu, Jul 16, 2015 at 12:17 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello Samuel,
>
> On Monday 13 July 2015 10:18:47 Samuel Martin wrote:
>> A step forward toward a relocatable SDK.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index daf692e..30a2d0e 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -447,7 +447,7 @@ $(STAGING_DIR):
>>       @ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
>>       @mkdir -p $(STAGING_DIR)/usr/include
>>       @mkdir -p $(STAGING_DIR)/usr/bin
>> -     @ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
>> +     @ln -snf $(subst $(BASE_DIR)/,,$(STAGING_DIR)) $(BASE_DIR)/staging
> Does it work if user customize BR2_HOST_DIR?
Yes and no. :-)

I mean, Buildroot still works correctly, but the symlink is not
relative because the substitution does not have any effect when
BR2_HOST_DIR points somewhere out of BASE_DIR.

I'm not sure a relative symlink is judicious when BR2_HOST_DIR is set,
moreover when it points somewhere out of BASE_DIR.

>
> BR,
>
> --
> J?r?me Pouiller, Sysmic
> Embedded Linux specialist
> http://www.sysmic.fr

Regards,

-- 
Samuel
