From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 09 Feb 2018 13:28:59 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/1=5D_dbus=3A_fix_system=5F?=
 =?iso-8859-1?q?bus=5Fsocket_location?=
In-Reply-To: <CAFSsvmqDd_CrgW9VRUwfz34c28Qj5SkSWXs0pn2+bvki38cEOA@mail.gmail.com>
References: <20180208192324.10325-1-aduskett@gmail.com>
 <20180208193450.j4k5kj3ccdf5dk7o@tarshish>
 <CAFSsvmqDd_CrgW9VRUwfz34c28Qj5SkSWXs0pn2+bvki38cEOA@mail.gmail.com>
Message-ID: <62609522-18ba-40d6-847a-8feb00890602@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> That solution won't work on a rootfs with that is read/write.  My own filing
> system doesn't have a symlink from /var/run to ./run
>
> Perhaps it's just me?

Hi Adam, according to both D-Bus and systemd upstreams, having separate 
/run from /var/run is broken. New enough systemd also warns against that.

Just changing the D-Bus socket location won't work. My patch links a 
bugreport where people have mentioned that the /var/run/dbus essentially 
cannot change because it's hard-coded in other SW as well.

Can you investigate which part creates /run and /var/run on your 
configuration of buildroot, but with a fresh-from-scratch build? Grepping 
for "/run" in build/packages-file-list.txt should answer that.

Cheers,
Jan
