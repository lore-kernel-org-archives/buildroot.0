From: Pink Boy <dasfoo@yahoo.com>
Date: Mon, 5 May 2008 13:49:14 -0700 (PDT)
Subject: [Buildroot] booting root filesystem over nfs
In-Reply-To: <481F093D.9070906@ripnet.com>
Message-ID: <814162.35883.qm@web31804.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sander sez,

> 2) the "root" in path to the root filesystem was
> causing boot problems on my target.    I was getting
> error messages of the form "mounting proc/ ... mount:
> permission denied.  (are you root?)".   Simply
> renaming "root" to "rfs" (for example) on my Host
> (ubuntu 7.10) caused this particular problem to go
> away.  Having to do this makes me wonder if I am
> doing something wrong.

I'm having some issues mounting a root file system over
NFS on Ubuntu.  Might be related.  Just to get it to mount
I had to manually add no_root_squash to the etc/exports 
share entry  After that linux would mount and boot, but 
doesn't have write access to root which results in 
errors on startup.  (I'm using the TimeSys board suport
package so I doubt there is anything wrong with the 
root file system itself.)

Mr Foo
