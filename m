From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Dec 2012 17:08:09 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <CACQ1gAj-H5P3SaX=fhzxpW=aPwp+kJuZw2CQ9AYgmnSKZKpp7g@mail.gmail.com>
References: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
 <805796c3-1a48-4485-8d1b-5c1c5d2cbfb4@zimbra2.corp.accelance.fr>
 <CACQ1gAj-H5P3SaX=fhzxpW=aPwp+kJuZw2CQ9AYgmnSKZKpp7g@mail.gmail.com>
Message-ID: <CAHXCMMKXJ8Crr770fXoYz=+SbNcU0VCNXkMcvXsKJKRmd0xsWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

2012/12/17 Richard Genoud <richard.genoud@gmail.com>:
> 2012/12/17 Jeremy Rosen <jeremy.rosen@openwide.fr>:
>> Hello everybody
>>
>> there is a little bit more work to do on this patch (mainly updating a few more places in the documentation) but i'd like to have a go/no-go before I do that...
>
> I was looking for that kind of feature, I hope it will be accepted.
> For now, I use the output/target tree and those parameters in the
> /etc/exports file:
> *(rw,all_squash,no_subtree_check,anonuid=my_uid,anongid=my_gid)
>
> But that means that all the FS is owned by my user.

There are plenty of good reasons to not use output/target as root for
a chroot or a NFS root, as explained here:
http://buildroot.org/downloads/manual/manual.html#faq-why-not-use-target-as-chroot

And here, you'll find the right way to do this (so far):
http://buildroot.org/downloads/manual/manual.html#_nfs_boot


Regards,

-- 
Sam
