From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 25 Sep 2018 23:53:15 -0300
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
References: <CAFSsvmpPj0xusvmxjgVVvxv0rGwmXmJQJc5dmtiFSK7C9fpAYg@mail.gmail.com>
Message-ID: <5baaf49bebe31_5ea43fa0300d2d6026920@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Yegor

On Tue, Sep 25, 2018 at 07:41 PM, Adam Duskett wrote:

>  My main issue is this: The way buildroot is set up, each python
> package bump will need to be manually updated, checked for dependency
> changes, if any of those are changed, then add/update those, run the
> built rootfs, and check the library, and if you miss any of those
> steps, you have to do it all over again. With Django, I did run the
> rootfs, imported Django, printed the Django version, and said "OK,
> that should work," which is not enough. I am not a Django expert.

Something that do help in this case is to add more runtime tests for python
packages.
I agree that importing the module and printing the version is not always
enough, but it is *something* and can detect many runtime dependency issues, so
maybe we can start there (writing more runtime tests that do the import) and
then improve those test cases to cover more cases, specially with the input
from people that actually use each one.

> 
>  Also, many people who do use the packages might not know how to
> contact the BuildRoot maintainers if a package they use is broken.
> Also, these packages that are causing the failure are the only ones we
> can see. I am not sure if other packages (or dependencies of those
> packages) will work. Each package upgrade requires manual testing.
> 
> What's to say Python3.8 doesn't break even more things? I think an
> open discussion of how BuildRoot actually maintains and installs
> Python packages needs to happen.

I am not saying we don't need to rethink packaging, but if we end up choosing to
keep the current way or even in the meantime while we discuss and implement a
new way, also in the case of Python3.8 breaks things more automated tests for
python packages can help at least to identify what breaks and reduce the burden
of manual testing.

Regards,
Ricardo
