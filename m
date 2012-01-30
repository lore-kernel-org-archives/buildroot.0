From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 30 Jan 2012 12:51:22 +0100
Subject: [Buildroot] [RFC 14/15] foobar: create a fake proprietary
 package (testing only)
In-Reply-To: <201201290950.27997.minimod@morethan.org>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
 <CALR4fELbaToSJw6qJHWJ=hF8TBA4gMsN49eTaiESt+PJRytoUA@mail.gmail.com>
 <201201290950.27997.minimod@morethan.org>
Message-ID: <4F26843A.4080700@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Michael S. Zick wrote:
> On Sun January 29 2012, Diego Iastrubni wrote:
>> On Sun, Jan 29, 2012 at 5:11 PM, Luca Ceresoli<luca@lucaceresoli.net>  wrote:
>>>
> If this proposal or something like it is included in the build
> system, then those firmware blob licenses could also be handled
> with the new bit of infrastructure.


Thanks for pointing out.
I had a look at the linux-firmware module, and it raises some
interesting points for discussion of the compliance stuff in general,
as well as the implementation.

Firstly, linux-firmware is a package composed of different parts with
different licenses.
This makes it hard for BR to handle the legal stuff for this package,
as it should show a different set of licenses depending on which parts
are actually used.
This is not unique of linux-firmware though. binutils has as many as
9 license files in its sources.

Second, I read a few random license files in linux-firmware and most of
them are similar to BSD licenses, in that they require the license text
to be included in the product documentation.
This is why I did not implement the third goal of my RFC, "save the
complete text of all license files that must be included in the product
documentation". It would be far from trivial.
In fact, in a case such as linux-firmare, it would be relatively easy to
copy all the (many) license files, but it would be of limited
usefulness.
The best thing to do would be to copy only the license files for those
parts of the package that are actually used in the product. I think
there's no way to obtain such a feature without a manual work of the
package's .mk creator. This work could probably be limited to packages
with a non-obvious licensing scheme, though.

Luca
