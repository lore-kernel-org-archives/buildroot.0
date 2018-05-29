From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:38:05 +0200
Subject: [Buildroot] custom skeleton question
In-Reply-To: <85B790C7-22DB-4715-A360-5D229877EB00@stask.net> (Liam
 Staskawicz's message of "Tue, 29 May 2018 10:48:47 -0700")
References: <85B790C7-22DB-4715-A360-5D229877EB00@stask.net>
Message-ID: <874liq5k2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Liam" == Liam Staskawicz <liam@stask.net> writes:

 > I'd like to create a custom rootfs skeleton based on Ubuntu Base
 > (https://wiki.ubuntu.com/Base) via the existing skeleton-custom
 > package, but rather than ship the entire skeleton in my repo, i'd like
 > to download it (either as a step in another custom package or
 > otherwise).

Doesn't this "base" already contain a number of libraries and programs?
I don't quite see how this fits in Buildroot.

 > Given that BR2_ROOTFS_SKELETON_CUSTOM_PATH is evaluated at kconfig
 > time, I don't see the best way to supply this value from another
 > package.

 > Is there a recommended approach to supply this value more dynamically?

Instead of using it as a rootfs skeleton you could perhaps create a
package to download such a "base" and extract it on top of the default
skeleton?

-- 
Bye, Peter Korsgaard
