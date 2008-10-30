From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 30 Oct 2008 07:23:53 -0600
Subject: [Buildroot] [PATCH 6/9] Ask the kernel source where it will
	install modules
In-Reply-To: <20081030142018.1377e1b1@surf>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203246.15826.56394.stgit@localhost.localdomain>
	<20081030142018.1377e1b1@surf>
Message-ID: <fa686aa40810300623o637f3b9fk5820cb21bf9ef05c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 30, 2008 at 7:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 16 Oct 2008 14:32:46 -0600,
> Grant Likely <grant.likely@secretlab.ca> a ?crit :
>
>> Originally, $(LINUX26_VERSION) was used to figure out which directory
>> modules would get installed in under /lib/modules.  This causes
>> problems when $(LINUX26_VERSION) differs from what version the kernel
>> source thinks it is using because it will try to use depmod in the
>> wrong directory.
>
> Just for curiosity, in what cases $(LINUX26_VERSION) can differ from
> the ? version the kernel source thinks it is using ? ?

When using a git kernel tree for instance, LINUX26_VERSION is set to
"linux-git" to match the directory that the kernel is unpacked into
but the kernel source could be reporting just about any
"linux-vX.Y.Z-<sha1>".

>
> Otherwise, the version proposed by Hans-Christian Egtvedt looks good to
> me.

Looks good to me too.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
