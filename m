From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 25 Oct 2016 10:04:19 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
	16.04
In-Reply-To: <87r378bnk8.fsf@dell.be.48ers.dk>
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
 <87r378bnk8.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9Vn=nu=bGb8BV0rDJSxXeQ-1ZH3abz415q5vbVPEEmerqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2016-10-22 14:00 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com>
> writes:
>
>  > * Updating to ubuntu 16.04
>  > * Fixing dependencies
>  > * Fixing locale complaints
>  > * Removing unused packages
>
>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>  > ---
>  > Changelog
>
>  > * Changed to C locale as suggested by Arnout Vandecappelle
>
>  >  support/misc/Vagrantfile | 9 ++++++---
>  >  1 file changed, 6 insertions(+), 3 deletions(-)
>
>  > diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
>  > index cf269fe..5e56d5d 100644
>  > --- a/support/misc/Vagrantfile
>  > +++ b/support/misc/Vagrantfile
>  > @@ -12,7 +12,7 @@ VM_MEMORY=2048
>  >  VM_CORES=1
>
>  >  Vagrant.configure('2') do |config|
>  > -    config.vm.box = 'ubuntu/trusty64'
>  > +    config.vm.box = 'bento/ubuntu-16.04'
>
> What is the reason to use a base image from the bento project instead of
> the official ubuntu image?
>
> https://atlas.hashicorp.com/ubuntu/boxes/xenial64


The official images from Canonical are broken in many ways, for example
this bug [1] prevents the image working properly cause it lacks the vagrant
user.

Bento images are instead very well tested and triaged from the Chef team,
you can find more info here [2]

[1] https://bugs.launchpad.net/cloud-images/+bug/1569237
[2] http://chef.github.io/bento/

Sincerely, Angelo


>
>
> --
> Bye, Peter Korsgaard
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161025/2f2c0cf7/attachment.html>
