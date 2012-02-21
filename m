From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Feb 2012 09:44:39 +0100
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <jhueu4$u5p$1@dough.gmane.org>
References: <jhub5r$smv$1@dough.gmane.org>
 <CAC78GpcJ8nZ0QrZ01a0sDgVxV7kN12ShRi27Cv8sGLg4-TKXgQ@mail.gmail.com>
 <jhueu4$u5p$1@dough.gmane.org>
Message-ID: <4F435977.1060001@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant Edwards wrote:
...
>> Personally, I keep my post-build is a directory structure like:
>> board/manufacture/model/post-build.sh
> I prefer to modify the buildroot source tree as little as possible (it
> makes upgrading to a new version easier).  So I keep everything
> outside it that I can.  I've put what used to be my
> package/customize/source directory in "../customfiles", my post-build
> script in "../postbuild.sh", and my output directory is "../output".

Buildroot can be used in different ways, so yours is not necessarily
wrong. But the structure of Buildroot is such that you can put your
customizations in a few, well-defined places, which typically are the
board/mycompany/myproduct dir and your config file.
To add proprietary packages what I do is to create a
packages/mcompany/ dir with packages inside.

If you need to add currently unsupported opensource packages you
can just submit a patch to this mailing-list for mainline inclusion.

Finally, especially if you need many customizations, I suggest you
think about using git. You can have mainline Buildroot in the master
branch and you modifications in another branch. It is very quick to
merge your branch with an updated Buildroot, if you follow the
guidelines above.


>>> It would be awfully nice if the help text for "path" config options
>>> explained what directory the path is relative to. Alternatively, it
>>> might be nice if there were some variables that could be used in
>>> user-configured paths to anchor the path to specific points in the
>>> build, output, or source tree.
>>>
>>> Putting an absolute path in a config file doesn't really seem like a
>>> workable option.
>> Agreed
>>
>> Somewhere I saw some slides that had a recommended way to do this. It
>> also had a minimal post-build script to run. It is on the mailing
>> list somewhere.
> I think somebody posted a pointer to a week or so back when I was
> asking about a change to the customize.mk file.
>

Here it is:
> For more details, seehttp://free-electrons.com/blog/elce-2011-videos/,
> search for "Using Buildroot For a Real Project". There's a video of
> Thomas Petazzoni with many best practices for using Buildroot.
> My above suggestion comes from slide 24 of his presentation. Thanks
> Thomas.

From:
http://lists.busybox.net/pipermail/buildroot/2012-February/049989.html

Look at slide 25 too.

Luca
