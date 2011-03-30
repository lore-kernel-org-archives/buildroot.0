From: Martin Hicks <mort@bork.org>
Date: Wed, 30 Mar 2011 12:54:30 -0400
Subject: [Buildroot] SCM management
In-Reply-To: <AANLkTik7W8-NnFEgU+ibjeTjVO1HHqwd4RwGvngR7kBT@mail.gmail.com>
References: <20110316163052.GA8006@game.jcrosoft.org>
	<AANLkTik7W8-NnFEgU+ibjeTjVO1HHqwd4RwGvngR7kBT@mail.gmail.com>
Message-ID: <AANLkTinDPz4AZfasK_kWLoshWVTF8CUkh1sv9qxZxa4N@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oops.  Forgot to CC the list.

mh

On Wed, Mar 30, 2011 at 12:53 PM, Martin Hicks <mort@bork.org> wrote:
> I added support, via a patch that I posted recently, to support an
> external kernel tree. ?No dl/ file is used and the tree is referenced
> directly by the makefiles rather than doing the download->extract
> step.
>
> This is a hack. ?If you were to propose doing this in a more general
> way, I'd be interested in seeing patches.
> mh
>
> On Wed, Mar 16, 2011 at 12:30 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
>> Hi,
>>
>> ? ? ? ?During my work on barebox and the kernel
>> ? ? ? ?I modify Buildroot to get the source from my git or the mainline
>> ? ? ? ?and found out that we remove the tree everytime and re-clone it
>>
>> ? ? ? ?This is time consuming specialy in develeopment when you add new
>> ? ? ? ?commit for other user which need to re-checkout your tree.
>>
>> ? ? ? ?So I'd like to propose a new way to manage the trees
>> ? ? ? ?we could do something like on gentoo
>>
>> ? ? ? ?as example with git
>> ? ? ? ?we clone a bare tre and store it in dl and do not remove it so if you
>> ? ? ? ?need a new version of the tree you just need to fetch it and do not
>> ? ? ? ?clone it again
>>
>> ? ? ? ?For this purpose I would propose to manage the tree like this in dl
>> ? ? ? ?for git as example
>> ? ? ? ?builddir/fetch/git-src/${package}
>>
>> ? ? ? ?for bzr
>> ? ? ? ?builddir/fetch/bzr-src/${package}
>>
>> ? ? ? ?and to simplify the scm I would like to propose the manage it not via
>> ? ? ? ?makefile rules but via scripts
>>
>> Best Regards,
>> J.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
>
> --
> Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
> Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
>



-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
