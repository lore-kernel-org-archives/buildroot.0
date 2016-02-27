From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 23:23:57 +0100
Subject: [Buildroot] [PATCH v3] qt: add font license information
In-Reply-To: <20160227220053.6ddafcc6@gmx.net>
References: <1456439689-16676-1-git-send-email-ps.report@gmx.net>
 <CANxTyt5b64cQxOCHT5Z3KQF5K0D-T5_Qd_g9nxggYsa8+VmZQA@mail.gmail.com>
 <20160227220053.6ddafcc6@gmx.net>
Message-ID: <56D221FD.1020602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/16 22:00, Peter Seiderer wrote:
> Hello Danomi,
> 
> On Sat, 27 Feb 2016 11:38:39 -0500, Danomi Manchego <danomimanchego123@gmail.com> wrote:
> 
>> > Peter S.,
>> > 
>> > On Thu, Feb 25, 2016 at 5:34 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>>> > > With this implementation, the different licenses will be separated with
>>> > > <space><comma>. This is not nice, but to avoid it a pretty ugly construct
>>> > > is needed:
>>> > >
>>> > > QT_LICENSE = $(shell echo $(QT_LICENSE_BITS) | sed 's% , %, %g')
>>> > >
>>> > > Since the <space><comma> is just a minor nuisance, we're not going to that kind
>>> > > of complexity.
>>> > >
>> > 
>> > The <space><comma> can be avoided during variable construction by doing this:
>> > 
>> > QT_LICENSE := BlahBlah
>> > 
>> > ifeq ...
>> > QT_LICENSE:=$(QT_LICENSE), MoreBlahBlah
>> > 
>> > If you don't mind the X:=$(X) part, that is.  IIRC, buildroot did a
>> > pass not long ago removing := from assignments that didn't actually
>> > need it.
>> > 
> Thanks for the tip, tried it and works for me ;-), but [1] states:
> 
>   Simply expanded variables are defined by lines using ?:=? or ?::=? (see Setting
>   Variables). Both forms are equivalent in GNU make; however only the ?::=? form
>   is described by the POSIX standard (support for ?::=? was added to the POSIX
>   standard in 2012, so older versions of make won?t accept this form either). 
> 
> Maybe this was the reason to avoid it in buildroot?

 Not at all - we use loads of GNU make specific things, like functions.

 There is no big reason to avoid :=, only for consistency we prefer to use =
everywhere. So in this case it would be OK to use :=. Note however that there
should be spaces around it (any whitespace after = will be stripped).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
