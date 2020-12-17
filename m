From: Charles Eidsness <charles@ccxtechnologies.com>
Date: Thu, 17 Dec 2020 06:58:03 -0500
Subject: [Buildroot] pycompile script doesn't compile files with single
 character names
In-Reply-To: <CAHfJR7j8YdVLnYyXu7imzcnTC_9AcEnBwBi1BFFJTtqRNxXKGg@mail.gmail.com>
References: <CAAV4SYZLndA0mHnZO6+9+YGaVKtPQwGYHxWi4=ckF67AzibDzw@mail.gmail.com>
 <CAHfJR7j8YdVLnYyXu7imzcnTC_9AcEnBwBi1BFFJTtqRNxXKGg@mail.gmail.com>
Message-ID: <CAAV4SYaqA+gr-mS+Q=6AxhQH8hB14JAGhJ97gPPi0-C+3EYVeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Dec 2020 at 03:22, Julien Floret <julien.floret@6wind.com> wrote:
>
> Hi Charles,
>
> Le mer. 16 d?c. 2020 ? 14:37, Charles Eidsness via buildroot
> <buildroot@busybox.net> a ?crit :
> >
> > Hi All,
> >
> > I'm not sure if this is by design but the pycompile utility won't compile single character python files. This causes an issue if you've selected pyc files only and are building python-dnspython, which has some single character filenames.
> >
> > Here is a simple fix:
> >
> > diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> > index 7041a0506b..e2cfc2683c 100644
> > --- a/support/scripts/pycompile.py
> > +++ b/support/scripts/pycompile.py
> > @@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None, verbose=False):
> >          return  # only compile real files
> >
> >      if not re.match(
> > -            r"^[_A-Za-z][_A-Za-z0-9]+\.py$", os.path.basename(host_path)
> > +            r"^[_A-Za-z][_A-Za-z0-9]*\.py$", os.path.basename(host_path)
> >      ):
> >          return  # only compile "importable" python modules
> >
>
> Your fix looks good to me. Could you send a git patch using "git
> send-email", so that it can be applied by the maintainers?
> Thanks!
>
> Julien

Hi Julien,

I don't have git send-email setup but used git format-patch and sent
out an email, hopefully it'll work.

Thanks!
Charles
