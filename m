From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Nov 2018 12:18:56 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <e17b869d-0492-f0f9-fd2b-2ab04de0cdca@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Nov 2018 11:31:29 +0100")
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
 <20181103224222.229c064a@windsurf>
 <CAPi7W8388ghbe_PtDyJ_Hi1=2PLo4sAoZbzwORjH4qLGQ-ue5w@mail.gmail.com>
 <20181104111953.08d765e0@windsurf>
 <CAPi7W83CQfQGjuhZBUvZoPBsJJLSE2sgRj_P9UHt7Lvb9bpqpA@mail.gmail.com>
 <87lg69nkjx.fsf@tkos.co.il>
 <616d82b7-c580-49cd-b4bf-ad1b6da2368b@mind.be>
 <20181106085910.665564c3@windsurf> <87tvkubkf2.fsf@dell.be.48ers.dk>
 <e17b869d-0492-f0f9-fd2b-2ab04de0cdca@mind.be>
Message-ID: <87lg66bgin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > then package{A,B,C} would be built with the system-provided make, and
 >> > then package{D,E,F} would be built with host-make ? Is this really a
 >> > desirable situation ?
 >> 
 >> Well, it sounds better than the breakage we have today.

 >  At first sight, I don't see why it should be a problem to use a different make
 > for different packages. A bit weird, but it really shouldn't affect
 > reproducibility or anything.

Well, it could in case a package behaved differently depending on the
make version (E.G. newer make versions have broken older Makefiles), so
enabling a package X that pulls in host-make suddenly changes something
for the build of package Y - Or the other way around, E.G. package Y
depends on package X which pulls in host-make so we never notice that
package Y needs a newer make version, and then a version bump of Y makes
X optional, ..

But I agree that it is quite unlikely to cause any real issues.


 >> In general, mixing make versions in recursive invocations seems a bit
 >> icky. I guess we could end up with issues if/when we do toplevel
 >> parallel builds as well if the job control tracking differs between
 >> versions.

 >  Ooh, yes, top-level parallel build might break dramatically in such a situation...

 >  Well, let's fix that problem when we get there, right?

Agreed!

-- 
Bye, Peter Korsgaard
