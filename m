From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2015 09:43:35 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <CAKAx1chQju2g1-wf6PDEeiQ0D1KJPfar9Js2z7oWdu8ejZSqLg@mail.gmail.com>
 (Lionel Orry's message of "Wed, 2 Dec 2015 08:58:56 +0100")
References: <20151202073542.GY23754@vapier.lan>
 <CAKAx1chQju2g1-wf6PDEeiQ0D1KJPfar9Js2z7oWdu8ejZSqLg@mail.gmail.com>
Message-ID: <874mg1i6ko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Orry <lionel.orry@gmail.com> writes:

Hi,

 > Hi,
 > On Wed, Dec 2, 2015 at 8:35 AM, Mike Frysinger <vapier@gentoo.org> wrote:

 >> the busybox.net software has been languishing for quite a long time,
 >> so i gave it a strong kick today.  just about every piece of software
 >> has been upgraded on the box including bugzilla.  my various testing
 >> looks like it still works, but if you guys notice anything weird, feel
 >> free to let me know.
 >> -mike

Thanks for doing the update Mike! We had some issues with old (dsa) ssh
keys, but that is fixed now.

 > ?Thank you for that. I don't know if it's related but the "Recent commits"
 > and "Recent discussions" streams normally displayed on?

 > ?the buildroot homepage are empty...

I don't think this is related. Looking closer, it seems like the Google
API the website used is no longer available :/

E.G.:

https://www.google.com/uds/Gfeeds?callback=google.feeds.Feed.RawCompletion&context=0&num=30&hl=en&output=json&q=http%3A%2F%2Frss.gmane.org%2Ftopics%2Fexcerpts%2Fgmane.comp.lib.uclibc.buildroot&key=notsupplied&v=1.0&nocache=1449045352617

Returns:

/* callback */google.feeds.Feed.RawCompletion('0', null, 403, 'This API is no longer available.', 200)

The API page (https://developers.google.com/feed/) says:

This API is officially deprecated. See our deprecation policy in our
Terms of Service for details.

Angelo, any idea how to fix this? Googling around I see:

http://blog.superfeedr.com/google-feed-api-alternative/

But ideally we shouldn't depend on any extra external API for this.

-- 
Bye, Peter Korsgaard
