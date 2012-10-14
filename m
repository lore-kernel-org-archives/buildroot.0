From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 13 Oct 2012 20:39:10 -0400
Subject: [Buildroot] [PATCH 12/13] target/generic: add filesystem
	overlay option
In-Reply-To: <20121013231448.17317.37653.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231448.17317.37653.stgit@localhost>
Message-ID: <CANxTyt6dH8173xfa1nfN2CaXspSMiZcwMgVna4c4FL9-0ziNkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Oct 13, 2012 at 7:14 PM, Arnout Vandecappelle (Essensium/Mind) <
arnout@mind.be> wrote:

> The filesystem overlay is a tree that is copied over the target fs
> after building everything - which is currently usually done in the
> post-build script.
>

I'm very happy to see the overlay fs concept get introduced.  We introduced
an almost identical concept to our customized buildroot a couple of years
ago, and found it to be a great addition.  In particular, it lets us keep a
full skeleton with most of our files, and a couple very small overlays for
things that we want just in an NFS-mount dev scenario and just in a FLASH
image scenario.

However, we still make use of the custom target skeleton feature.
 Basically, we wanted to keep our initial skeleton in our project directory
with our overlays, rather than hack up the default skeleton that comes with
buildroot.  Also, we wanted to avoid having to maintain a list of files
installed by the default skeleton that then need to be deleted in a
post-build script.

(The truth is that we use our custom skeleton both as the initial custom
skeleton that gets copied during the beginning of the process, and as an
overlay that gets copied at the end of the process, so that no
package-installed scripts take precedence over our customized target
skeleton files.)

So I still see use, at least for us, for a custom skeleton.  No?

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121013/7f9f53c7/attachment.html>
