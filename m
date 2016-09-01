From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 1 Sep 2016 12:23:45 +0200
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <20160901113941.36166d9e@free-electrons.com>
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 <87a8fszmq7.fsf@dell.be.48ers.dk>
 <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
 <8b51ea03-6172-ce10-9a80-7caf43952de1@flatmax.org>
 <20160901113941.36166d9e@free-electrons.com>
Message-ID: <bac3ea8e-9d12-1bdc-8220-b131908513da@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ottavio & All,

just as a sidenote: if you happen to work with qmake based project, you
can easily just call the qmake from the host dir
(buildroot/output/host/usr/bin/qmake) dirclty from your source dir, and
the generated Makefile will use the Buildroot environment, sets the
correct include and link flags, for libraries contained by Buildroot as
well. Of course things are getting a bit complicated if you are
developing your lib and your application simultaneously, then better to
use the mentioned source dir overriding mechanism.


Regards
zgyarmati


On 2016-09-01 11:39, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 1 Sep 2016 17:51:31 +1000, Matt Flax wrote:
>
>> Is it necessary to have a devshell ? Could you simply run 'make package' 
>> instead and work live in the output/build/package directory ?
>> You can rerun various parts of the make process by deleting the .stamp_* 
>> files in the package directory.
>>
>> Conceptually if you build the package you are working on natively on 
>> your desktop, you should be able to do all the library inclusion and 
>> linking locally ... once happy, you can simply invoke buildroot to cross 
>> compile for you ... I would imagine that that would be a much faster way 
>> top develop ...
> Fully agreed. I am not sure I understand the usefulness of devshell. It
> is just easier and more efficient to use the build system directly.
>
> However, if you're actively working on the source of a package, do
> *NOT* make your changes in outptu/build/<package>-<version>/. This
> directory is a temporary location. Instead, use the OVERRIDE_SRCDIR
> mechanism, which allows you to tell Buildroot to take the source code
> for a given package from a given directory. See
> http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
> slides 261 and following.
>
> My feeling is that things like devshell are created because using Yocto
> during development is too painful. Buildroot simply doesn't need
> something like devshell because using the build system during active
> development is perfectly fine. Of course, if you disagree and have some
> concrete examples, we'll be happy to look into this.
>
> Best regards,
>
> Thomas


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160901/cba068a2/attachment.asc>
