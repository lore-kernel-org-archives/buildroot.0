From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jul 2012 11:24:44 +0200
Subject: [Buildroot] [PATCH] libgcrypt: install libgcrypt-config in host
 directory
In-Reply-To: <1341958748-9024-1-git-send-email-arnout@mind.be>
References: <1341958748-9024-1-git-send-email-arnout@mind.be>
Message-ID: <20120711112444.5b5cbad0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 00:19:08 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Packages depending on libgcrypt call libgcrypt-config to determine its
> CFLAGS.  If libgcrypt-config happens to be installed on the host, this
> will add /usr/include to the target include path.  So make sure
> libgcrypt-config is in the host directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

For most packages, we just leave the <foo>-config script in
$(STAGING_DIR), and then adjust their reverse dependencies .mk file to
point specifically to the $(STAGING_DIR) for that script.

I am not a big fan of doing otherwise specifically for libgcrypt.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
