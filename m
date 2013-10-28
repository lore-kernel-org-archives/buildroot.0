From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 27 Oct 2013 22:11:28 -0200
Subject: [Buildroot] [PATCH 2/2] qt5base: add an option to build and
 install examples
In-Reply-To: <CAAEAJfAX3yKCUiJ9hvTQXjmfbwZXx8F1EwwMp6GTR3WFpgLAYw@mail.gmail.com>
References: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
 <1381007796-20031-2-git-send-email-fatih.asici@gmail.com>
 <CAAEAJfDKwZ-EtAO61h=ZOE4QoAr75fZsw7s8aXhQjJm9VVBQwQ@mail.gmail.com>
 <20131014184207.024e8383@skate>
 <CAAEAJfAX3yKCUiJ9hvTQXjmfbwZXx8F1EwwMp6GTR3WFpgLAYw@mail.gmail.com>
Message-ID: <CAAEAJfBY4VcUY_OR=kr6ZXoKMtBCFSB8MoOudZG1d2K11BNcFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fatih, Peter:

On 14 October 2013 14:02, Ezequiel Garc?a <ezequiel@vanguardiasur.com.ar> wrote:
> On 14 October 2013 13:42, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Ezequiel Garc?a,
>>
>> On Mon, 14 Oct 2013 11:11:14 -0300, Ezequiel Garc?a wrote:
>>
>>> > +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>>> > +QT5BASE_CONFIGURE_OPTS += -make examples -compile-examples
>>> > +else
>>> > +QT5BASE_CONFIGURE_OPTS += -nomake examples
>>> > +endif
>>> > +
>>>
>>> Any reason why this is not with the rest of the options
>>> and using the simpler:
>>>
>>> QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES), \
>>>         -make examples -compile-examples, \
>>>         -nomake examples)
>>>
>>> ?
>>
>> I agree with your first point (it should be with the other configure
>> option), but I disagree with your second point. The choice Fatih has
>> made is the one we make everywhere in Buildroot whenever the "if"
>> becomes multiline. I'd very much prefer Fatih to keep its original
>> proposal.
>>
>> We use $(if ...) only when it can be done like this:
>>
>> FOO_SOMETHING = $(if $(BR2_BLEH),foo,bar)
>>
>> when it becomes more complicated than that, we use ifeq ... else ...
>> endif blocks on several lines.
>>
>
> Sure, no objections on my side.
>
> Fatih: if you re-submit this, you can add my:
>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>

Peter: Will you take this as it is, or would you prefer a re-submit
reordering as agreed above?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
