From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:28:50 +0200
Subject: [Buildroot] [git commit] package/openjdk{,
 -bin}: bump latest to version 16.0.1+9
In-Reply-To: <20210505200538.72E8F7F96C@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 5 May 2021 22:28:47 +0200")
References: <20210505200538.72E8F7F96C@busybox.osuosl.org>
Message-ID: <87h7jdxpst.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=057e27029c9811ba8cc4922e30cc3878bed98807
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When introducing OpenJDK to buildroot, the OpenJDK project did not put
 > releases on their GitHub page. Since then, the OpenJDK developers have
 > not only added OpenJDK releases to Github, they are starting to phase
 > out adding releases to their public-facing mercurial repository.

 > Compare the following URLs:
 > https://wiki.openjdk.java.net/display/JDKUpdates/JDK+14u
 > https://wiki.openjdk.java.net/display/JDKUpdates/JDK+15u
 > https://wiki.openjdk.java.net/display/JDKUpdates/JDK+16u

 > With JDK14, only the mercurial repository is listed. With OpenJDK15,
 > both the GitHub and mercurial repository are listed. Finally, with
 > OpenJDK16, only the GitHub repository is listed.

 > For consistency's sake, and for the version bump of JDK latest from 14
 > to 16 do the following:

 >   - Change the repository for OpenJDK14 to point to the official GitHub
 >     repository,

 >   - In order to simplify and reuse the GitHub URL, modify the
 >     OPENJDK_VERSION_MAJOR and OPENJDK_VERSION_MINOR definitions to only
 >     include a single number for the MAJOR definition.

 >   - Change openjdk-bin.mk to also use the same format as the openjdk.mk
 >     file

 > Unfortunately, we can't yet do the switch for OpenJDK11: the Github
 > repository is missing a Mercurial-related file, so that the archive
 > for OpenJDK11 11.0.11+9 would change from the one we already have on
 > s.b.o and that people would alreay have locally, and we'd have a hash
 > mismatch, either on master, or on all pur previous relases. OpenJDK11
 > just got a new release mere hours ago (as of this writing), but it
 > hasn't yet trickled down to AdoptOpenJDK/openjdk11-binaries, so we
 > can't do the bump just yet...

 > Add a note to the OpenJDK11 case, to prepare the migration to Github
 > with the next version bump.

 > Finally, remove upstreamed patch 0001-fix-gcc-10-support.patch as it's
 > no longer needed.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - meld the github switch and 14->16 bump together
 >   - drop the github switch for 11 9because hash mismatch)
 >   - expand commit log accordingly
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

What do we do for 2021.02.x? Bump as well? openjdk-14 is EOL and (most
likely) has security issues.

https://adoptopenjdk.net/support.html

-- 
Bye, Peter Korsgaard
