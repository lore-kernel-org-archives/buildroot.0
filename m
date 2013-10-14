From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 18:42:07 +0200
Subject: [Buildroot] [PATCH 2/2] qt5base: add an option to build and
 install examples
In-Reply-To: <CAAEAJfDKwZ-EtAO61h=ZOE4QoAr75fZsw7s8aXhQjJm9VVBQwQ@mail.gmail.com>
References: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
 <1381007796-20031-2-git-send-email-fatih.asici@gmail.com>
 <CAAEAJfDKwZ-EtAO61h=ZOE4QoAr75fZsw7s8aXhQjJm9VVBQwQ@mail.gmail.com>
Message-ID: <20131014184207.024e8383@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Mon, 14 Oct 2013 11:11:14 -0300, Ezequiel Garc?a wrote:

> > +ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> > +QT5BASE_CONFIGURE_OPTS += -make examples -compile-examples
> > +else
> > +QT5BASE_CONFIGURE_OPTS += -nomake examples
> > +endif
> > +
> 
> Any reason why this is not with the rest of the options
> and using the simpler:
> 
> QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES), \
>         -make examples -compile-examples, \
>         -nomake examples)
> 
> ?

I agree with your first point (it should be with the other configure
option), but I disagree with your second point. The choice Fatih has
made is the one we make everywhere in Buildroot whenever the "if"
becomes multiline. I'd very much prefer Fatih to keep its original
proposal.

We use $(if ...) only when it can be done like this:

FOO_SOMETHING = $(if $(BR2_BLEH),foo,bar)

when it becomes more complicated than that, we use ifeq ... else ...
endif blocks on several lines.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
