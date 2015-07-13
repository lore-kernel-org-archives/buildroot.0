From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 16:48:00 +0200
Subject: [Buildroot] [PATCH v4 3/4] Makefile: add
 TARGET_CLEAR_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <20150713134420.GT2451@tarshish>
References: <1436784870-17417-1-git-send-email-s.martin49@gmail.com>
 <1436784870-17417-3-git-send-email-s.martin49@gmail.com>
 <20150713134420.GT2451@tarshish>
Message-ID: <CAHXCMMJet12qsX--xCDesj2s+RrOVNBcgLGnnG6tgNJs=cez4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2015 at 3:44 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Mon, Jul 13, 2015 at 12:54:29PM +0200, Samuel Martin wrote:
>> This patch introduces the TARGET_CLEAR_RPATH_HOOK hook fixing the ELF
>> files' RPATH of the host tree (excluding the sysroot).
>>
>> After running this hook, the RPATH from any target ELF files is empty.
>
> There are legitimate uses for RPATH. The ebtable package sets the ebtables
> executable RPATH to /lib/ebtables to load its libeb*.so extensions. The sudo
> package add RPATH to /usr/libexec/sudo in visudo. There may be more. How
> should we handle these cases? Maybe add a per-package, per-executable RPATH
> setting?
Indeed, this is valid uses of RPATH.
I can rework/extend the script to sanitize RPATH, i.e. remove the
paths referring to the build tree.

Any thoughts about this?

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

Regards,

-- 
Samuel
