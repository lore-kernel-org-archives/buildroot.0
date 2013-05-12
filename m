From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 May 2013 11:23:13 +0200
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
 1.0.7 package
In-Reply-To: <87k3n5yzj3.fsf@dell.be.48ers.dk>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
 <518D8507.3060909@mind.be> <87k3n5yzj3.fsf@dell.be.48ers.dk>
Message-ID: <20130512112313.12a809e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 11 May 2013 23:31:12 +0200, Peter Korsgaard wrote:

>  Arnout>  We have a tendency to make a copy of a package when there is a major
>  Arnout> version change, cfr. python3 and qt5. However, in this case, I don't
>  Arnout> think it's a good idea. At this time, many (most?) gstreamer
>  Arnout> downstreams have already moved to 1.x. Also, no more patches will be
>  Arnout> made the the 0.10 series (though distro's may still make patches). So
>  Arnout> we can expect the old gstreamer stuff to die out relatively
>  Arnout> quickly. But if we call the new thing gstreamer1 now, we're
>  Arnout> essentially stuck with that name for all eternity.
> 
> I'm not so sure. If you look at the other recent major version upgrades
> (python/qt/gtk), it seems to me like people aren't jumping on the new
> version right away. I had several people asking me if qt4 would still be
> available once qt5 got added.

I agree. I recently had a customer using Buildroot, with a fairly
important stack of custom/proprietary software written on top of
gstreamer 0.10. Having the possibility to continue to use gstreamer
0.10 is very important to allow such users to migrate to newer
Buildroot versions. The migration to gstreamer 1.x will not happen
overnight for such users who have a large body of software written
against gstreamer 0.10.

Similarly for Qt4 vs. Qt5, as Peter mentioned.

> I think the nicest thing we can do for our users is just to add the new
> package next to the existing when these incompatible major version
> upgrades happen, so they can chose themselves when/if they want to
> upgrade. I agree that gstreamer1 perhaps isn't the nicest name, but it
> isn't too bad either, and for python/qt/gtk the names are commonly used.

Right. Ideally, we would have preferred to have 'gstreamer' be the
latest available version, and 'gstreamer0.10' be the name for the old
packages. But that doesn't work, because we can't predict the future.

We had the same for Gtk. In the past we had package/libgtk and
package/libgtk2, and now package/libgtk is gone. And presumably, we'll
gain package/libgtk3 in the future.

>  Arnout>  Obviously, there will be some packages that break down when
>  Arnout> gstreamer 1.0 is used, but we'll have to discover that at some
>  Arnout> point anyway.
> 
> Like the closed source imx stuff.

Hum, not sure to get your point here, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
