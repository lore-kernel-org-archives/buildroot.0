From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 15 Jan 2013 22:04:28 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <201301152159.17888.yann.morin.1998@free.fr>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <50EBD33C.1090603@mind.be>
 <CAAfyv37mJRpP+-VA6xv=c6D-i9OiNK_wakpeexMZ5-nKFSurYA@mail.gmail.com>
 <201301152159.17888.yann.morin.1998@free.fr>
Message-ID: <CAAfyv36XKECoCh4+Dx-revgX_hF9N7A94DqD=5zaNdo=4scm3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On Tue, Jan 15, 2013 at 9:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Belisko, Arnout, All,
>
> On Tuesday 15 January 2013 Belisko Marek wrote:
>> On Tue, Jan 8, 2013 at 9:05 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> > On 07/01/13 22:56, Yann E. MORIN wrote:
>> >> Actually, what matters in the content of the source files. Do some of
>> >> them refer to either license?
>> >>    - if the files only refer to GPLv2+, then the BSD-3c does not apply,
>> >>    - if the files only refer to BSD-3c, then the GPLv2+ does not apply,
>> >>    - if some file refer to one or two of the licenses, then both apply.
>> >
>> >
>> >      - if all files refer to GPLv2+ and BSD-3c, then either applies.
>> >
>> > Putting GPLv2+ BSD-3c implies that parts are GPLv2+, other parts and BSD-3c.
>> > But it's also possible (and likely) that either applies.  BTW, it's not
>> > possible that both apply because they have conflicting terms.
>
> Yes, the BSD-3c *is* compatible with the GPLv2. See:
>     http://directory.fsf.org/wiki/License:BSD_3Clause
>
>> Hmm what then should be in SG3_UTILS_LICENSE? I've checked files and
>> some of them are BSD some GPLv2.
>
> Assuming that the libraries are dual-licensed LGPLv2.1+ / BSD-3c, and the
> programs are dual-licensed GPLv2+ / BSD-3c, I'd do something like:
>
> SG3_UTILS_LICENCE = LGPLv2.1+ BSD-3c
> ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
> SG3_UTILS_LICENCE += GPLV2+ BSD-3c
> endif
It's bit complicated. All library files are BSD only but utils files
are mixed (BSD + GPLv2).
>
> Adapt to the real situation, of course.
>
> Keep in minf that we try to keep the legal-info stuff correct, but we only
> advertise it as a non-authoritative status, and it is the responsibility of
> the person/entity that distributes the firmware to check the legal-info
> for correctness.
>
> I think we should make that crystal-clear when generating the legal-info,
> so there is no ambiguity.
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
>

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
