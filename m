From: Matt Flax <flatmax@flatmax.org>
Date: Fri, 2 Sep 2016 11:51:08 +1000
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <5637116E3E13BE46B0D936BF364783C1F6B4F0@MAIA.sede.videotec.com>
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 <87a8fszmq7.fsf@dell.be.48ers.dk>
 <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
 <8b51ea03-6172-ce10-9a80-7caf43952de1@flatmax.org>
 <20160901113941.36166d9e@free-electrons.com>
 <5637116E3E13BE46B0D936BF364783C1F6B4F0@MAIA.sede.videotec.com>
Message-ID: <deef8031-a2b3-d7be-8e37-d24b25125f22@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/09/16 22:18, Ottavio Campana wrote:
>> My feeling is that things like devshell are created because using Yocto
>> during development is too painful. Buildroot simply doesn't need
>> something like devshell because using the build system during active
>> development is perfectly fine. Of course, if you disagree and have some
>> concrete examples, we'll be happy to look into this.
> Thomas, you are 100%.
>
> The usual situation is you develop a portable program, but then you need to specialize some part that is platform-specify and you need to work on the sources with the cross compiler.
>
>
Further on this topic...
If you need to work on sources w.r.t. specific cross compile setups, 
there are a few ways to do that effectively/efficiently when using 
buildroot.

One way for example is to use quilt ... e.g. when editing an old linux 
mach/plat device file, have an external buildroot directory with a 
patches/linux directory.
You can then "make linux" then "cd output/build/linux" and "ln -s" your 
external patches/linux folder to the quilt expected patches directory. 
You can then use quilt as expected, and whenever "quilt refresh" is run, 
the external patches get updated.

In this manner, you use standard buildroot and quilt to manage patches 
for cross-compiled packages ... once you are happy, you can then either 
use the patches as per the standard process with buildroot or apply them 
against your original sources.

Matt
