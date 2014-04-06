From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Apr 2014 11:31:38 +0200
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
In-Reply-To: <1396776324.27939.YahooMailNeo@web28803.mail.ir2.yahoo.com>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
 <20140406075912.GC4096@tarshish>
 <1396776324.27939.YahooMailNeo@web28803.mail.ir2.yahoo.com>
Message-ID: <d0022b62-8def-48d0-9b6c-da49e87e140b@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe Reynes <tremyfr@yahoo.fr> schreef:
>Hi Baruch,
>
>I've missed this "mandatory dependancy".
>I suppose that this dependancy is usefull to uncompress tarball.
>But I think that the compilation of firmware should be done with
>tools compiled by buildroot.
>
>If lzma is used to compress the rootfs, then lzma is compile
>by builtoot. If gzip is used to compress the rootfs, then we use
>local gzip. It's not very "coherent".
>And using compiled binary with buildroot increase chance to
>regenerate firmware on (very) different machine.
>
>And I agree with you, it's not a "real" issue, it's more a "nice to have".

The problem is that the build time is increased without good reason.
If there is a problem with a specific version of gzip/bzip2, we could always use the suitable-host-package mechanism as we do for tar. In fact, you could start using it for lzma too and avoid building host-lzma if it's already present...

Best regards,
Thomas
