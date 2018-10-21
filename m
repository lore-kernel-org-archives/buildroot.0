From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 21 Oct 2018 19:46:13 +0200
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <CANQCQpZ-c3mzU6vrWoC5gBi=xVyRagaNy6VgnU2YfRXtreoEJQ@mail.gmail.com>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
 <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
 <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
 <20181021172707.GA19294@x230>
 <CANQCQpZ-c3mzU6vrWoC5gBi=xVyRagaNy6VgnU2YfRXtreoEJQ@mail.gmail.com>
Message-ID: <20181021174611.GA25417@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew, Angelo,

> Petr,

> On Sun, Oct 21, 2018 at 6:27 PM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi,

> > > > The merge_config.sh is used for a couple scenarios
> > > >  - Appending kconfigs together (CONFIG_*)

> > >  ... I forgot about this one. Indeed, the buildroot merge_config.sh script is
> > > used in pkg-kconfig.mk to merge kernel configs. Ideally we should change that to
> > > use the package's merge_config.sh script. However, the location of that script
> > > may vary, or it may even be missing...

> > > >  - Buildroot cfgs for runtime tests (BR2_*)
> > > >  - As a tool by users to merge together Buildroot configs

> > > > I'm not sure of the cleanest approach to support both
> > > >  - you could detect if the file is one or the other and adjust the regex
> > > >  - do the inverse and build a list of lines that are not comments

> > >  I think Angelo's patch is the best approach after all.
> > +1. I also think keep using our merge_config.sh with -b switch from Angelo's
> > patch [1] is the way.

> Do you think you'll be able to provide an updated patch based on Angelo's work?
Matthew, sure I can have look into it. Unless Angelo is planning to finish it.

Kind regards,
Petr
