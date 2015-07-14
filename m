From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jul 2015 10:28:10 +0200
Subject: [Buildroot] [PATCH v5 3/5] Makefile: add
 TARGET_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <20150714053758.GX2451@tarshish>
References: <1436824511-1601-1-git-send-email-s.martin49@gmail.com>
 <1436824511-1601-3-git-send-email-s.martin49@gmail.com>
 <20150714053758.GX2451@tarshish>
Message-ID: <CAHXCMML1KJSL3EqHfm0kY7JGyd6+JPLdXFs2faG+0sE9Fsgp_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Jul 14, 2015 at 7:37 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Mon, Jul 13, 2015 at 11:55:09PM +0200, Samuel Martin wrote:
>> This patch introduces the TARGET_SANITIZE_RPATH_HOOK hook fixing the ELF
>> files' RPATH of the TARGET_DIR (excluding the sysroot).
>
> Are you sure sysroot is excluded?
Yes, via $(STAGING_DIR).

During my tests, I only saw /path/to/sysroot/usr/lib in the RPATH.
So, I only remove paths similar to this (i.e. standard libdirs from
the sysroot) in RPATH.

>
>> After running this hook, the RPATH from any target ELF files won't
>> contain any occurence of the sysroot or some build locations.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Tested-by: Baruch Siach <baruch@tkos.co.il>
>
> [ Build test only: verified that /sbin/ebtables preserves its RPATH
>   (/lib/ebtables), and that /usr/sbin/visudo also preserves its target RPATH
>   (/usr/libexec/sudo), while dropping the staging part ($(@D)/lib/util/.libs)
>   ]
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

Thanks a lot for your careful review. :-)

Regards,

-- 
Samuel
