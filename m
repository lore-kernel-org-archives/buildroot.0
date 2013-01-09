From: Julian Lunz <git@jlunz.de>
Date: Wed, 9 Jan 2013 20:33:26 +0100
Subject: [Buildroot] compressed file system
In-Reply-To: <1357758922954-38297.post@n4.nabble.com>
References: <1357754022866-38293.post@n4.nabble.com>
 <20130109185725.7b568bb6@skate>
 <1357758922954-38297.post@n4.nabble.com>
Message-ID: <20130109203326.4cc1fabb@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello tallu,

On Wed, 9 Jan 2013 11:15:22 -0800 (PST)
tallu <tallubko@yahoo.com> wrote:
> So how can I check this kind of compressed file system (.ext2.gz)?

As far as I know: You'll need to uncompress it, after that you can
loop-mount it, so:
sudo mount -o loop rootfs.ext2 mountpoint

If you check with 'mount' afterwards, you should see sth. like this:
...
/dev/loop0 on mountpoint type ext2 (rw)

avfs (http://avf.sourceforge.net/) might work with compressed image, not
tested though.

Julian
