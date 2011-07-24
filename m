From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 16:50:50 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <20110720201942.17ec130a@skate>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
 <20110720201942.17ec130a@skate>
Message-ID: <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 20, 2011 at 8:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Wed, 20 Jul 2011 08:29:26 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> You could auto-detect the site-method if you add support for the
>> file:// prefix in _SITE. Auto-detection currently already occurs for
>> git, bzr, http, etc. so I think it makes sense to do it here as well.
>
> I think you are making a confusion here between the "local" site method
> implemented in this patch and the "file" site method that you
> implemented in the past, and which is part of this patch set, in a
> different patch.
>
> The "file" site method simply allows to say that the package tarball is
> present locally in the system. But except the download step, all the
> other package construction steps are similar: extraction, patching, etc.
>
> The "local" site method tells Buildroot that the package source code is
> already available is some *directory*. Using the "local" site method
> completely skips the download, extraction and patching steps of the
> package construction process, which directly starts by the
> configuration step.
>
> So, "file" and "local" are two very different things.

Ok, I was indeed confusing the two.
If I understand correctly, the main difference is that the file method
expects an archive, and the local method expects a prepared source
tree.
But this also means that you cannot properly use a 'local' package
from two buildroot installations, since the compilation process
happens in the local directory. Is that correct?

Thomas
