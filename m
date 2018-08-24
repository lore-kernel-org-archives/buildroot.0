From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 24 Aug 2018 18:54:15 -0500
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <20180824070203.GK9365@scaer>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
Message-ID: <CANQCQpb6Cgt+YoniwLCd8jGhLdrzCCJDcAyXjcSAWbETrZ=mUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
On Fri, Aug 24, 2018 at 2:02 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Hollis, Julien, Matthew, Thomas, All,
>
> On 2018-08-16 11:10 +0200, Thomas Petazzoni spake thusly:
[snip]
> Now, I also had a look at all the timeouts, and I also noticed a single
> other pattern. Julien's and Matthew's autobuilder would always choke on
> host-libsodium, and it happens only on those two autobuilders:
>
>     http://autobuild.buildroot.org/?reason=host-libsodium
>
> All failing at the same point:
>
>     checking whether segmentation violations can be caught when using the C compiler...
>

Tried a few things...
1) Setup this config and did a make host-libsodium.  No hang.
2) Took the test code from that configure test and could execute it without hang
3) Doing a full build now and we'll see if there is a sequencing/file
configuration driving this.

Any other ideas?
Matt
