From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 10:57:11 +0100
Subject: [Buildroot] autobuild annotations
Message-ID: <CAAXf6LUcR-P7rrpiBOELDV=3GZNHn3kU9hu8bg63+xOZWs0u0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

What I am missing in the current autobuild website/flow is a way to
indicate that a certain problem is already analyzed by someone, and
what the problem is. Maybe a patch has been submitted already and
waiting to be merged. Maybe the solution is clear but someone still
needs to make a patch. Maybe it's more complex and we have to wait for
feedback from upstream.

If we could have such a 'comment' or 'annotations' field, we could
avoid duplicating the analyis / resolution effort.

One way to proceed is to simply keep a comment for each package. When
there is a failure, we show (or link to) the comment for that package,
even though at that time we are not yet sure that the problem is
exactly the same (one package could fail in multiple ways). The
comment should have a link to the problem on which it was added
originally, so that the developer looking at the new problem can
analyze if it is the same problem or not.

To implement this, we'd need an extra table in the database to map a
package to a comment, and we need a query to extract the comments for
a given package from that table when displaying the results.

What do you think?
Do you have alternative proposals?

Thanks,
Thomas
