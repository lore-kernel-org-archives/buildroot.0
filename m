From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 20:19:42 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
 method
In-Reply-To: <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
Message-ID: <20110720201942.17ec130a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 20 Jul 2011 08:29:26 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> You could auto-detect the site-method if you add support for the
> file:// prefix in _SITE. Auto-detection currently already occurs for
> git, bzr, http, etc. so I think it makes sense to do it here as well.

I think you are making a confusion here between the "local" site method
implemented in this patch and the "file" site method that you
implemented in the past, and which is part of this patch set, in a
different patch.

The "file" site method simply allows to say that the package tarball is
present locally in the system. But except the download step, all the
other package construction steps are similar: extraction, patching, etc.

The "local" site method tells Buildroot that the package source code is
already available is some *directory*. Using the "local" site method
completely skips the download, extraction and patching steps of the
package construction process, which directly starts by the
configuration step.

So, "file" and "local" are two very different things.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
