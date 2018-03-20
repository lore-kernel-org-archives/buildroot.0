From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Mar 2018 09:03:01 -0500
Subject: [Buildroot] [PATCH] python-virtualenv: new package
In-Reply-To: <CANQCQpYGEiSND-XdpmAo57cWcFS0eM_+DhSqgubLUgve_w-PQg@mail.gmail.com>
References: <1517523718-30586-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87po5lz0uf.fsf@dell.be.48ers.dk>
 <CANQCQpYGEiSND-XdpmAo57cWcFS0eM_+DhSqgubLUgve_w-PQg@mail.gmail.com>
Message-ID: <CANQCQpZNbrxYxShbNk-skshmaU7r5iWtEp4v6wBtzwwJWVrsEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Feb 4, 2018 at 2:06 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Peter,
>
> On Sun, Feb 4, 2018 at 8:10 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
> >
> >  > A tool for creating a isolated python env.
> >  > Within Buildroot, the basic problem being addressed is
> >  > one of dependencies and versions, and indirectly permissions.
> >  > A great example are the Django and AMQP protocol packages.
> >  > An applications depending on these are usually locked into a specific
> >  > version.
> >
> >  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >
> > Can you explain what the use case for this is? Is this to install
> > additional python packages at runtime on the target?
> >
>
> The main use case is to have a sandbox where you can deploy a
> configuration of python packages to support an existing application
> where you can't (reasonably) adjust all the buildroot versions of the
> similar python packages to match.  My plan is to build the main OS
> build using buildroot and then combine the existing virtualenv into
> the rootfs for deployment.  There isn't a runtime need to any dynamic
> changes to the env.


We did some prototyping and it turns out that virtualenv and
setuptools are not required to make a rehosted folder of python work
in buildroot (ie you just set a path and use it).  Note: However, on
the host machine where you gather up the folder of material, you do
need virtualenv to perform that caching activity.

I've marked my series as rejected.

Matt
