From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:29:58 +0100
Subject: [Buildroot] musl/gettext issue
In-Reply-To: <nq4lncxo36.ln2@ID-313208.user.individual.net>
References: <20150916221636.039df52b@free-electrons.com>
 <nq4lncxo36.ln2@ID-313208.user.individual.net>
Message-ID: <20160126222958.63f31eb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jan 2016 22:25:11 +0100, Bernd Kuhls wrote:
> Am Wed, 16 Sep 2015 22:16:36 +0200 schrieb Thomas Petazzoni:
> 
> > Now, enter musl. It does have an internal gettext implementation.
> > However, it is not recognized by GNU gettext has a correct
> > implementation, so when you build GNU gettext in a musl system, it does
> > build/install libintl.so and its header files.
> 
> Hi Thomas,
> 
> is there already a solution for this problem?

No, I personally haven't had the time to work on this topic, and nobody
else did, apparently.

> I saw the bug with aumix-2.8 which I could solve by bumping the package 
> to 2.9.1. Now I am stuck with http://autobuild.buildroot.net/?reason=gdk-
> pixbuf-2.32.3
> 
> Is this bug report related to our problem?
> http://savannah.gnu.org/bugs/?46436

Yes, it seems related, at least it reflects very well the fact that
musl provides a gettext implementation, but gettext.m4 doesn't
recognize it as being a valid implementation.

I see
http://lists.gnu.org/archive/html/bug-gettext/2015-04/msg00002.html
hasn't got much feedback on the gettext mailing list, so we'll probably
have to dig into the topic ourselves, and find some solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
