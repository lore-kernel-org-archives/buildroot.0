From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 3 Jun 2016 11:11:08 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160602223812.GD3714@free.fr>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160602223812.GD3714@free.fr>
Message-ID: <CAGm1_ksQ26SPFYrUELk+K9UmZyFfGJLGjAQLoMFMd15HHr1oKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 3, 2016 at 12:38 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2016-06-01 23:26 +0200, Thomas Petazzoni spake thusly:
>> Our patchwork currently has ~270 patches pending, so we need to do
>> something to clean up the backlog of patches. To do this, I will try to
>> revive an initiative that was started by Thomas De Schampheleire a few
>> years ago, which had proven to be useful.
>
> Thanks for re-starting this! :-)
>
>>  1/ package/libgpg-error: bump to version 1.21
>>     http://patchwork.ozlabs.org/patch/562100/
>>
>>     I don't really have any comments, other than the fact that it is
>>     super annoying for a package with so many dependencies to start
>>     having architecture dependencies. Could someone refresh and
>>     validate this patch?
>
> Hmm... Fact is, upstream has not been very responsive to the proposal
> for dumping the architecture detection:
>
>     http://comments.gmane.org/gmane.comp.encryption.gpg.devel/21150
>     http://comments.gmane.org/gmane.comp.encryption.gpg.devel/21176
>
> They don't even seem to understand the problem... :-(
>
> So, either we get stuck with the current version, but as Gustavo
> noticed, that would preclude updtating libgcrypt, or we bump and have to
> suffer this arch limitation...
>
>>  3/ RFC: adding customizable linux logo
>>     http://patchwork.ozlabs.org/patch/577638/
>>
>>     This creates a "Linux extension" to easily customize the Linux
>>     logo. Do we care? The current implementation assumes imagemagick is
>>     available on the host, which probably isn't good. Probably the
>>     customlogo package is not needed, and convert the image to the
>>     appropriate format can be done directly in the
>>     CUSTOMLOGO_PREPARE_KERNEL hook.
>>
>>     Do we want such a feature?
>
> Well, we can certainly accept that, but as I replied, let's just expect
> the user to provide already rendered ppm/pbm images.
>
> However, the ppm/pbm files are just text file. A user could provide a
> patch to change the logo, and we already have the necessary infra to
> apply patches...
>
>>  6/ Makefile: Fix overlay overwriting everything
>>     http://patchwork.ozlabs.org/patch/581463/
>>
>>     A problem with the merged /usr option, and when the rootfs overlay
>>     contains specific directories. Discussion has happened, no decision.
>
> As already pointed out, this is supposedly fixed. I replied to Maxime,
> askign him that he confirms the fix we already have works for him and if
> so, that he marks his patch as superseded in patchwork.
>
>>  7/ apply-patches.sh: handle any file name as *.patch
>>     http://patchwork.ozlabs.org/patch/595693/
>
> I am absolutely not decided on that one. Surely, it has the potential to
> cause quite some harm...

Still had no time to make further testing. Will try to do this in the
next weeks.

>>  10/ The remaining "help text" related patches from Yann
>>      http://patchwork.ozlabs.org/patch/596393/
>>      http://patchwork.ozlabs.org/patch/596396/
>>      http://patchwork.ozlabs.org/patch/596397/
>>      http://patchwork.ozlabs.org/patch/596398/
>>      http://patchwork.ozlabs.org/patch/596399/
>>      http://patchwork.ozlabs.org/patch/596395/
>>
>>      Do we want this?
>>
>>      I like the general idea personally, but I continue to dislike the
>>      fact that the formatting is enforced at the infra level, with this
>>      weird syntax. I'd prefer packages to simply contribute a
>>      HELP_CMDS, or register a hook, where they can use "echo" to display
>>      whatever they want.
>
> I have been thinking about that one. As I asid, I'm not too fond of
> letting packages handle their own formatting. But I can understand that
> you do not like it (why? ;-] ).
>
> So, I'll rework the series shortly. In the meantime, I've marked it as
> changes-requested in patchwork.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
