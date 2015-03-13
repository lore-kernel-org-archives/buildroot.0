From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 13 Mar 2015 02:20:17 +0200
Subject: [Buildroot] [PATCH] move random-seed from /etc to /var/lib
In-Reply-To: <8761a5hlbr.fsf@dell.be.48ers.dk>
References: <20150312002013.GA11018@vostro> <8761a5hlbr.fsf@dell.be.48ers.dk>
Message-ID: <20150313002017.GA11581@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fri, Mar 13, 2015 at 12:01:28AM +0100, Peter Korsgaard wrote:

> >>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:
> 
>  > In case / is mounted read-only, /etc is likely to be read-only
>  > as well, so the seed will not be saved.
> 
> But if rootfs is RO, so will /var/lib then?
Common (I think?) setup is to have ro / and rw /var on some
kind of persistent storage. This way /etc typically remains
a part of read-only root.

Buildroot does not support such layout at present but with /etc/mtab
and /etc/resolv.conf already out of /etc, it's one step away.

> I would rather get rid of the static random_seed file instead. Seeding
> all Buildroot based devices with a RO rootfs from the same 512 bytes of
> data can hardly be helpful for security.
Agreed. Currently the initial file is only used to check for rw filesystem.
That's not necessary, and easy to fix. Sending a patch.
