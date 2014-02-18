From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 17:44:56 +0100
Subject: [Buildroot] [PATCH v7 3/4] infra: Introduce BR2_HOST_NEEDS_JAVA
In-Reply-To: <CAGduivzSEpXbLOCvsnMHOdbidVBUfzgCH7QiVaQ5PSx24M-x4A@mail.gmail.com>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
 <20140218171846.6969c9a6@skate>
 <CAGduivzSEpXbLOCvsnMHOdbidVBUfzgCH7QiVaQ5PSx24M-x4A@mail.gmail.com>
Message-ID: <20140218174456.527aac52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 18 Feb 2014 17:41:17 +0100, Maxime Hadjinlian wrote:

> >> +# Hidden boolean selected by packages in need of Java in order to build
> >> +# (example: xbmc)
> >> +config BR2_HOST_NEEDS_JAVA
> >> +     bool
> >
> > Do we need a kconfig bool for this? We have the same situation for
> > classpath, and we haven't introduced a specific kconfig bool for it.
> Yes, I had two patches:
>   - One to introduce kconfig bool option for JAVAC and JAR
>   - The second to make classpath uses them and remove the specific in
> dependencies.sh
> 
> It seems cleaner and if another package has the same needs, it's already there.

Right, but when it's needed for just one package, it's maybe not needed
to have a generic solution. When it starts to be needed by a few
packages, then it is time to refactor things and have a generic
solution such as the one you propose.

But oh well, since you already wrote the code, I'm fine with it.

> > Moreover, I am not sure BR2_HOST_NEEDS_JAVA is the right name. It's not
> > really the host that needs Java, it's the compilation process that
> > requires a host Java. So BR2_NEEDS_HOST_JAVA is probably more
> > technically correct.
> True, I'll fix that.

Cool, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
