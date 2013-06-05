From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 16:04:38 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <877gi8ekf6.fsf@dell.be.48ers.dk>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk>
Message-ID: <20130605160438.2a47341b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 05 Jun 2013 15:50:21 +0200, Peter Korsgaard wrote:

> This works, but is afaik less efficient for the static lib case.
> 
> The real fix is imho to build the object files twice, like how libtool
> does it.
> 
> If you look at the Debian package, they work around it by adding a
> seperate .c -> .sho build rule, which adds -fPIC, and then link the .so
> file with the .sho files instead.

Are you sure there are not already many packages that build things only
once with -fPIC and use that for both the static and the shared library?

What you're proposing here is quite the opposite to what you merged
(from me) in a33baa1ef9dadbec8e45d411c30d636fa6b8872a (icu: don't build
object files twice).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
