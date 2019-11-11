From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:01:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <CAFvCimWdoHfPzVJchnczcBnk1VECW+N_1c21fvOuQRosGkQbrQ@mail.gmail.com>
References: <20191111083348.3964650-1-christian@paral.in>
 <CADvTj4o4m-CSrPiJ_FSLKzUhxTKacMRVRKFjf99jUgCrLJKhrQ@mail.gmail.com>
 <CAFvCimUCex67b=3_NMgM=aWwfL=jSaJ00FFZ+o4=fHStXTpt2w@mail.gmail.com>
 <20191111153905.59ab2f4c@windsurf.home>
 <CAFvCimWdoHfPzVJchnczcBnk1VECW+N_1c21fvOuQRosGkQbrQ@mail.gmail.com>
Message-ID: <20191111160158.20956982@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(If possible, you should bottom post instead of top post. Thanks!)

On Mon, 11 Nov 2019 15:56:04 +0100
J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:

> It's about what implementation of cgroup is used by systemd to maintain the
> cgroup-tree of processes
> 
> * legacy is v1
> * hybrid is both v1 and v2
> * unified is v2 only
> (note that only the default is changed, this can be changed via the kernel
> command-line at boot time)
> 
> v1 is deprecated on the kernel side because it was... a mess.
> The systemd people are migrating stuff from v1 to v2 as new controllers are
> added to v2, but at this point there is little left that is v1 only thus
> the change of the default value
> 
> Very few user-space projects care about cgroups : mainly systemd and
> container-managers. Container-manager need to interact with systemd as
> described in
> https://systemd.io/CGROUP_DELEGATION.html which allows to drop v1 and to
> correctly spread the responsibility between systemd and the container
> managers without
> stepping on each other's toes.
> Also note that Fedora31 will use the unified cgroup hierarchy.
> A good summary of adoption status :
> https://medium.com/nttlabs/cgroup-v2-596d035be4d7
> 
> At that point, I think staying in hybrid mode is the safest bet :
> everything in user-space hasn't migrated yet.
> Let Fedora take the fire and force everybody to migrate, and let's revisit
> the subject once (at least) Docker has migrated...

OK, thanks a lot for this explanation, much clearer!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
